<template>
  <view>
    <!--展示介绍图片-->
    <view class="image_box">
      <image
        src = "https://zhoukaiwen.com/img/loginImg/head.png"
        mode="scaleToFill"
        class="image_size"
      />
      <view class="name_box">
          <view>测试名称</view>
      </view>
    </view>
    <!--展示介绍文字-->
    <view class="text_box">
      <uni-section class="mb-10" title="课程描述" type="line" titleFontSize="20px" titleColor="#333"></uni-section>
      <text class="text_size">测试描述</text>
    </view>
    <!--选课按钮-->
    <view class="bottom">
      <button class="button_box">
        了解详情
      </button>
    </view>
  </view>
</template>

<script>
  export default {
    data() {
      return {
        
      };
    }
  }
</script>

<style lang="scss" scoped>
.image_box
{
  width:100%;
  margin: 15rpx 0;
  background-color: white;
  height: 650rpx;
  -webkit-box-shadow:2px 2px 10px rgb(230, 234, 239);
}
.image_size
{
  width:100%;
}
.name_box
{ 
  margin-top: 10rpx;
  font-size: 24px;
  font-weight: bolder;
}
.text_box
{

  background-color: white;
  margin-bottom: 40rpx;
  padding: 20rpx 15rpx;
  -webkit-box-shadow:2px 2px 10px rgb(227, 231, 235);
}
.text_size
{
  font-size: 18px;
}
.bottom
{
  -webkit-box-shadow:2px 2px 10px rgb(227, 231, 235);
  width: 100%;
  position: fixed;
  left: 1rpx;
	right: 10rpx;
	bottom: calc( var(--window-bottom) + 20px);
	z-index: 1030;
	margin-bottom: 10rpx;

}
.button_box
{
    font-size: 28rpx;
		background: #2796f2;
		color: #fff;
		height: 90rpx;
		line-height: 90rpx;
		border-radius: 50rpx;
		font-weight: bold;
}
.mb-10 
{
	margin-bottom: 10px;
}
</style>
    
      