% 设置参数和几何结构
mu_0 = 4*pi*1e-7; % 真空中的磁导率
mu = 1.2e-6; % 介质的磁导率
R1 = 0.1; % 球壳的内半径（单位：米）
R2 = 0.2; % 球壳的外半径（单位：米）
H0 = 0.1; % 外磁场强度（单位：特斯拉）

% 设置模拟空间
num_points = 100; % 离散点数量
r = linspace(R1, R2, num_points); % 离散点的半径
theta = linspace(0, 2*pi, num_points); % 离散点的角度
[R, Theta] = meshgrid(r, theta); % 构建网格


% 初始化磁标势和磁场强度
A = zeros(num_points, num_points);
H = zeros(num_points, num_points, 2);

% 计算磁标势和磁场强度
for i = 1:num_points
for j = 1:num_points
r_val = R(i, j);
theta_val = Theta(i, j);
if r_val < R1 || r_val > R2

% 球壳内外区域
A(i, j) = -mu_0*H0*r_val*cos(theta_val); % 根据边界条件设置磁标势
H(i, j, 1) = 0; % 球壳内外区域的磁场强度为零
H(i, j, 2) = 0;
else
% 球壳内部
A(i, j) = -mu_0*H0*R1^2*cos(theta_val)/(2*r_val) + (mu_0*H0*R1^3)/(2*mu*r_val^2); % 根据边界条件设置磁标势
H(i, j, 1) = (mu_0*H0*R1^2*cos(theta_val))/(2*mu*r_val^2); % 计算球壳内的径向磁场强度
H(i, j, 2) = 0; % 球壳内的切向磁场强度为零
end
end
end


% 可以根据需要绘制磁标势和磁场强度的图像，例如：
% 绘制磁标势分布
figure;
contourf(R.*cos(Theta), R.*sin(Theta), A);
colorbar;
xlabel('x');
ylabel('y');
title('磁标势分布');

% 绘制磁场强度分布
figure;
quiver(R.*cos(Theta), R.*sin(Theta), H(:,:,1), H(:,:,2));
xlabel('x');
ylabel('y');
title('磁场强度分布')

