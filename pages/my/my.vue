<template>
  <!--主体-->
  <view class="wrapper">
    <!-- 个人资料 -->
    <view>
      <view class="top">
        <view class="center">

          <view class="center-top">

            <view class="center_img" >
								<!-- 这里可以放自己的静态头像 -->
								<image src="/static/me.jpg"></image>
								<!-- <open-data type="userAvatarUrl" class="user_head"></open-data> -->
						</view>

            <view class="center_info">
              <view class="center_name">
							      	特立独行的猫
							</view>
              <view class="center_vip">
                <view class="vip_text">
							      		<text>{{studentNumber}}</text>
							  </view>
              </view>
            </view>

          </view>

        </view>
      </view>
    </view>
    <!-- 其他 -->
    <view class="extra">
			<uni-list>
				<uni-list-item showArrow title="个人信息" @click="ToInfo()"></uni-list-item>
				<uni-list-item showArrow title="关于我们"></uni-list-item>
        <uni-list-item showArrow title="退出登录" @click="logout()"></uni-list-item>
				<!-- <uni-list-item showArrow title="关于我们" link="navigateTo" :to="'/pages/about/about?item=1'"></uni-list-item> -->
			</uni-list>
		</view>


  </view>
</template>

<script>
export default {
  data() {
    return {
      userName: "",//学生名称
      studentNumber: ""//学生学号
    }
  },
  onLoad(options) {
    //接收存储的登陆数据
    uni.getStorage({
      key: 'studentNumber',
      success: (res) => {

        this.studentNumber = res.data
      },
    });
    uni.getStorage({
      key: 'userName',
      success: (res) => { this.userName = res.data },
    })
  },
  methods: {
    /**登出 */
    logout() {
      this.$courseRequest({
        url: "/student/logout",
        method: 'POST'
      }).then(res => {
        console.log(res);
        //提示消息

        //回到登陆页面
        uni.navigateTo({
          url: '/pages/login/login',
        })
      })
    },

    /***跳转更改个人信息界面 */
    ToInfo()
    {
      uni.navigateTo({
        url:'/pages/Info/Info',
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.wrapper {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 100%;
  background-color: #F4F4F4;
}

.top {
  width: 100%;
  height: 200rpx;
  background: #2979ff;
  padding-top: 30rpx;
  position: relative;
}

.center {
  width: 95%;
  height: 160rpx;
  background: #55aaff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  /* 水平居中 */
  align-items: center;
  /* 垂直居中 */
  margin: 0 auto;
  border-radius: 5rpx;
}

.center_top {
  display: flex;
  min-width: 350rpx;
  flex-direction: row;
  //background: #ffaa7f;
  height: 100rpx;
  margin-top: 0rpx;
  border-bottom: 1rpx solid #5555ff;
}

.center_img {
		width: 90rpx;
		height: 90rpx;
		border-radius: 50%;
		overflow: hidden;
	}
 
	.center_img image {
		width: 100%;
		height: 100%;
	}
 
	.center_img .user_head {
		width: 100%;
		height: 100%;
	}

  .center_info {
		display: flex;
		flex-direction: column;
		margin-top: 20rpx;
		margin-left: 20rpx;
	}
 
	.center_name {
		font-size: 14px;
	}
 
	.center_phone {
		color: #BEBEBE;
	}

  .center_vip image {
		width: 20rpx;
		height: 20rpx;
		margin-top: 10rpx;
	}
 
	.vip_icon {
		width: 25rpx;
		height: 25rpx;
		margin-top: 5rpx;
	}
 
	.vip_text {
		font-size: 14rpx;
		margin-top: -33rpx;
		margin-left: 40rpx;
		color: #AAAAAA;
	}
 
	.center_rank image {
		width: 35rpx;
		height: 35rpx;
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
 
		button {
			text-align: left;
			background-color: #fff;
 
			&::after {
				border: none;
				border-radius: 0;
			}
		}
	}
</style>