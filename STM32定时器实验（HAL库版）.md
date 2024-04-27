#! https://zhuanlan.zhihu.com/p/666339717
# 1 STM32定时器实验（HAL库版）
> 实验环境 
> `STM32cubeMX`+`keil`

## 1.1 基本设置
![选择芯片型号F103ZETx](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701387396-a05ee83e-09c0-484c-aa6a-23091cbe0a35.png#averageHue=%23faf9f8&clientId=u1ed1122c-b4da-4&from=paste&height=733&id=u1c428535&originHeight=916&originWidth=1384&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=111704&status=done&style=none&taskId=u933ec9dc-0bd6-4c44-be6a-fb042f92181&title=%E9%80%89%E6%8B%A9%E8%8A%AF%E7%89%87%E5%9E%8B%E5%8F%B7F103ZETx&width=1107.2 "选择芯片型号F103ZETx")
![使用外部时钟](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701418654-ba548a74-77d9-4dd7-bc27-d04df75e60b5.png#averageHue=%23fefcfc&clientId=u1ed1122c-b4da-4&from=paste&height=256&id=ud27c11f3&originHeight=320&originWidth=1058&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=25676&status=done&style=none&taskId=ub58a5c07-9da9-410d-8e44-16fe034e32f&title=%E4%BD%BF%E7%94%A8%E5%A4%96%E9%83%A8%E6%97%B6%E9%92%9F&width=846.4 "使用外部时钟")
![使用 serial wire debug（SWD）调试](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701450825-ecc27e63-e864-4903-bc21-07199d6a2186.png#averageHue=%23fefdfc&clientId=u1ed1122c-b4da-4&from=paste&height=212&id=u96c0e5b0&originHeight=265&originWidth=1015&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=16845&status=done&style=none&taskId=u16923d8b-bf1f-4f74-b5dc-9b1a2df6e67&title=%E4%BD%BF%E7%94%A8%20serial%20wire%20debug%EF%BC%88SWD%EF%BC%89%E8%B0%83%E8%AF%95&width=812 "使用 serial wire debug（SWD）调试")
![使用外部时钟](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701709490-f1ba21b8-699e-4303-a4a7-fb2f842d1160.png#averageHue=%23fefafa&clientId=u1ed1122c-b4da-4&from=paste&height=136&id=u64ee17ac&originHeight=170&originWidth=526&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=10753&status=done&style=none&taskId=ue495093c-2ef9-401f-96ab-3564335fd56&title=%E4%BD%BF%E7%94%A8%E5%A4%96%E9%83%A8%E6%97%B6%E9%92%9F&width=420.8 "使用外部时钟")
![设置时钟频率](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701729677-1f12bd38-592b-43bb-964d-ef9c9919fb3e.png#averageHue=%23fefefe&clientId=u1ed1122c-b4da-4&from=paste&height=182&id=u8748d7ec&originHeight=227&originWidth=455&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=15747&status=done&style=none&taskId=u6f106824-ec86-4b0b-9e36-f5e5da12d12&title=%E8%AE%BE%E7%BD%AE%E6%97%B6%E9%92%9F%E9%A2%91%E7%8E%87&width=364 "设置时钟频率")
## 1.2 GPIO设置
![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701787519-d47bc519-4957-46d3-97eb-92eb7c0a55eb.png#averageHue=%233eb92f&clientId=u1ed1122c-b4da-4&from=paste&height=701&id=u53260286&originHeight=876&originWidth=946&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=58204&status=done&style=none&taskId=ucc16353f-9ee1-43c6-8e1d-fb63d0de291&title=&width=756.8)![这里可以快速跳转](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701799486-763fef2a-3ef6-41f0-9c18-1d6757a9d54e.png#averageHue=%23fefefe&clientId=u1ed1122c-b4da-4&from=paste&height=422&id=u27d50e18&originHeight=527&originWidth=800&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=21931&status=done&style=none&taskId=uc7171b3b-059e-4c32-9bb1-5c5dbb6c686&title=%E8%BF%99%E9%87%8C%E5%8F%AF%E4%BB%A5%E5%BF%AB%E9%80%9F%E8%B7%B3%E8%BD%AC&width=640 "这里可以快速跳转")
## 1.3 设置时钟中断
![设置内部时钟源](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701882836-85e52a9b-c829-440d-8943-bb6727e35334.png#averageHue=%23fefefd&clientId=u1ed1122c-b4da-4&from=paste&height=32&id=u95e4eed1&originHeight=40&originWidth=719&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=1682&status=done&style=none&taskId=uba2414fe-6b44-4559-aff1-0e24f36074c&title=%E8%AE%BE%E7%BD%AE%E5%86%85%E9%83%A8%E6%97%B6%E9%92%9F%E6%BA%90&width=575.2 "设置内部时钟源")
![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699701909319-abb777a8-54a6-4ccd-a34b-b24a66140481.png#averageHue=%23fcf6f5&clientId=u1ed1122c-b4da-4&from=paste&height=94&id=u84682dde&originHeight=118&originWidth=501&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=8525&status=done&style=none&taskId=u0e8e4a62-dd6f-41b1-ba37-faecdc97d2b&title=&width=400.8)
计算公式如下
$$
\tau=\frac{\text{Prescales}\times \text{counter period}}{\text{HCLK}\times10^{6}} s
$$ 
> - `时钟频率` 字面意思
> - `分频` 字面意思
> - `计数周期`
>    - 多少个分频之后进入中断

记得点上这个![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702135567-f81df709-bf66-48cd-9347-0e7bf5c35905.png#averageHue=%23fcfbfa&clientId=u1ed1122c-b4da-4&from=paste&height=26&id=ud28da2ed&originHeight=32&originWidth=442&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=1684&status=done&style=none&taskId=u06619728-4a8b-4632-bc74-6fef43d8b47&title=&width=353.6)
![中断使能](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702152456-ace448c6-8cc2-4146-bb39-95be14c6f96d.png#averageHue=%23dee397&clientId=u1ed1122c-b4da-4&from=paste&height=78&id=u6e83393e&originHeight=97&originWidth=775&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=9280&status=done&style=none&taskId=ubafc09af-8332-4a77-9086-810953e3f24&title=%E4%B8%AD%E6%96%AD%E4%BD%BF%E8%83%BD&width=620 "中断使能")
就是这个，卡了我一节课
## 1.4 设置输出模式
![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702188284-9fada4fd-03c7-45da-aee6-f691eb6dc633.png#averageHue=%23f5e0b1&clientId=u1ed1122c-b4da-4&from=paste&height=501&id=u2a7c876c&originHeight=626&originWidth=845&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=41572&status=done&style=none&taskId=u09b82515-ae58-46bf-a4a2-876ebbe0bd4&title=&width=676)
![输出keil能使用的格式](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702195639-b1c70c8d-bff9-409d-aa18-6e770143847c.png#averageHue=%23fefefc&clientId=u1ed1122c-b4da-4&from=paste&height=50&id=u76e1de0a&originHeight=62&originWidth=274&originalType=binary&ratio=1.25&rotation=0&showTitle=true&size=2238&status=done&style=none&taskId=uf736bf4c-7f88-48ab-b7b1-c564c5f9e97&title=%E8%BE%93%E5%87%BAkeil%E8%83%BD%E4%BD%BF%E7%94%A8%E7%9A%84%E6%A0%BC%E5%BC%8F&width=219.2 "输出keil能使用的格式")
![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702223462-d603ac12-f19a-4c77-9f07-bdf24a3beb1c.png#averageHue=%23fbf9f6&clientId=u1ed1122c-b4da-4&from=paste&height=33&id=u0e09afce&originHeight=41&originWidth=462&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=2889&status=done&style=none&taskId=u81179441-651c-4659-bd0d-1053541e162&title=&width=369.6)
## 1.5 keil下载
> 使用的是正点原子 `STM32F103 ZET6`战舰开发板,使用`STLINK v2`下载

### 1.5.1 安装STLINK驱动
[ST-LINK官方驱动.zip](https://www.yuque.com/attachments/yuque/0/2023/zip/29137445/1699702359346-714442bf-f680-43ed-8e72-0ef9d1c7c430.zip)
### 1.5.2 闪退
因为使用的是`keil MDK 6`，一打开debug setting就闪退，解决方法
[keil 设置 Debug Stlink settings 闪退问题](https://zhuanlan.zhihu.com/p/622680350#:~:text=%E8%A6%81%E8%A7%A3%E5%86%B3%E6%AD%A4%E9%97%AE%E9%A2%98%EF%BC%8C%E5%8F%AF%E4%B8%8B%E8%BD%BD%E9%99%84%E5%8A%A0%E7%9A%84%20STLinkUSBDriver.dll%20%E6%96%87%E4%BB%B6%EF%BC%8C%E5%B9%B6%E5%B0%86%E5%85%B6%E5%A4%8D%E5%88%B6%E5%88%B0%20MDK%20%E5%AE%89%E8%A3%85%E7%9B%AE%E5%BD%95%E7%9A%84%E5%AD%90%E6%96%87%E4%BB%B6%E5%A4%B9%E4%B8%AD%E3%80%82%20%E5%8F%91%E5%B8%83%E4%BA%8E%202023-04-17%2006%3A57,%2B%20STlink%20%E8%B0%83%E8%AF%95%EF%BC%8C%E7%BB%93%E6%9E%9C%E6%80%BB%E6%98%AF%E9%97%AA%E9%80%80%EF%BC%8C%E4%B8%80%E7%82%B9%E5%88%B0%20Debug%20%E9%80%89%E9%A1%B9%E5%8D%A1%20%E7%9A%84%20Settings%20%E6%8C%89%E9%92%AE%EF%BC%8C%E5%B0%B1%E5%8D%A1%E6%AD%BB%EF%BC%8C%E7%84%B6%E5%90%8E%E4%B8%80%E4%BC%9A%E5%84%BF%E5%B0%B1%E9%97%AA%E9%80%80%E3%80%82)


[STLinkUSBDriver.zip](https://www.yuque.com/attachments/yuque/0/2023/zip/29137445/1699702467595-d1c010c2-fc71-48f5-bc15-07323649b02a.zip)


将如上文件解压到`D:\Program Files (x86)\keilv5\ARM\STLink`（你自己的路径）
### 1.5.3 debug设置
![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702755704-0c28b48b-2d63-4d27-a5a0-deece998c4f1.png#averageHue=%23d4c895&clientId=u1ed1122c-b4da-4&from=paste&height=67&id=uba69ce71&originHeight=84&originWidth=281&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=15833&status=done&style=none&taskId=u27ff2b02-7e01-4812-ac1e-b6d55bec1a8&title=&width=224.8)![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702767212-35260bb6-a83b-4368-bcaa-3fc6aef7c061.png#averageHue=%23e7e4e3&clientId=u1ed1122c-b4da-4&from=paste&height=81&id=u458a6fa8&originHeight=101&originWidth=757&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=24350&status=done&style=none&taskId=u4d65a8f0-e3d9-4865-b42d-6c76204fc95&title=&width=605.6)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699702777401-7968d66c-37d7-43bf-a9e0-a97e9481b721.png#averageHue=%23e7e3e2&clientId=u1ed1122c-b4da-4&from=paste&height=57&id=u855ee7b0&originHeight=71&originWidth=406&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=8971&status=done&style=none&taskId=udf752d60-d3ff-49b8-8cde-9097ce527c0&title=&width=324.8)
> 下载完记得`reset`一下

### 1.5.4 代码详解
main函数里面代码
```c
HAL_TIM_Base_Start_IT (&htim3); // 使能中断
HAL_GPIO_WritePin(GPIOE,GPIO_PIN_5,GPIO_PIN_RESET);// 初始化亮
HAL_GPIO_WritePin(GPIOB,GPIO_PIN_5,GPIO_PIN_SET);// 初始化亮
```
其实可以不用设置初始化亮（高电平），可以在`cubemx`中设置![image.png](https://cdn.nlark.com/yuque/0/2023/png/29137445/1699703168386-3dc2081f-f934-441b-be18-e4004b5c7c3a.png#averageHue=%23fefefe&clientId=u1ed1122c-b4da-4&from=paste&height=49&id=u7fbb5b0d&originHeight=61&originWidth=783&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=1986&status=done&style=none&taskId=ue61f656c-4df8-4e10-94f9-83769f0ba6d&title=&width=626.4)
中断之后进入的函数，放在`main.c`里面即可
```c
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    HAL_GPIO_TogglePin(GPIOE,GPIO_PIN_5);
    HAL_GPIO_TogglePin(GPIOB,GPIO_PIN_5);	

}
```
> 虽然另外一个文件里面也有，但是里面是__weak[【C语言内功心法】__weak -- 示弱也是一种强大-CSDN博客](https://blog.csdn.net/m0_37697335/article/details/81628417)
> 简单来说，就是你定义了就用你的。你没定义就用他的，example

```c
__weak void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* Prevent unused argument(s) compilation warning */
  UNUSED(htim);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_TIM_PeriodElapsedCallback could be implemented in the user file
   */
}
```
### 1.5.5 代码文件
[跑马灯实验.zip](https://www.yuque.com/attachments/yuque/0/2023/zip/29137445/1699702850237-c22d0024-4776-49e2-a5d6-ae0c7bfec168.zip)

[定时器中断实验.zip](https://www.yuque.com/attachments/yuque/0/2023/zip/29137445/1699702850512-78a36aa6-3246-4bc0-bcaf-810e7d9e12b0.zip)
