<template>
  <view class="container">
    <!--个人头像-->
    <view class="top">
      <view class="center">
        <view class="center_top">
          <!--头像-->
          <view class="center_img">
            <image src="" mode="scaleToFill" />
            <open-data type="userAvatarUrl" class="user_head" />
          </view>
          <!--基本信息-->
          <view class="center_info">
            <view class="center_name">
              <view>测试名称</view>
            </view>
          </view>
        </view>
      </view>
    </view>

    <!-- 其它 -->
    <view class="extra">
      <uni-list>
        <uni-list-item showArrow title="联系客服"></uni-list-item>
        <uni-list-item showArrow title="关于我们"></uni-list-item>
      </uni-list>

      <button @click="logout">退出登录</button>

    </view>


  </view>
</template>

<script>
export default {
  data()
  {
    return{

    }
  },
  onLoad(options) 
  {

  },
  methods:{
    /**登出 */
    logout()
    {
      this.$courseRequest({
        url:"/student/logout",
        method:'POST'
      }).then(res=>{
        console.log(res);
        //提示消息
        
        //回到登陆页面
        uni.navigateTo({
          url:'/pages/login/login',
        })
      })
    }
  }
}
</script>

<style lang="scss">
.container {
  height: 100%;
}

.top {
  width: 100%;
  height: 130px;
  // background: #23EBB9;
  background: #2979ff;
  padding-top: 15px;
  position: relative;
}

.center {
  width: 95%;
  height: 100px;
  background: white;
  display: flex;
  flex-direction: column;
  margin: 0 auto;
  border-radius: 5px;
}

.center_top {
  display: flex;
  flex-direction: row;
  width: 80%;
  height: 80px;
  margin: 0 auto;
  margin-top: 20rpx;
  border-bottom: 1px solid #EEEEEE;
}

.center_img {
  width: 66px;
  height: 66px;
  border-radius: 50%;
  overflow: hidden;
}

.center_img image {
  width: 100%;
  height: 100%;
  border-radius: 50%;
}

.center_img .user_head {
  width: 100%;
  height: 100%;
}

.center_info {
  display: flex;
  flex-direction: column;
  margin-top: 20rpx;
  margin-left: 30px;
}

.center_name {
  font-size: 18px;
}

.center_phone {
  color: #BEBEBE;
}

.extra {
  margin: 10rpx 20rpx;
  background-color: #fff;
  border-radius: 4rpx;

  .item {
    line-height: 1;
    padding: 25rpx 0 25rpx 20rpx;
    border-bottom: 1rpx solid #eee;
    font-size: 30rpx;
    color: #333;
  }
}
</style>