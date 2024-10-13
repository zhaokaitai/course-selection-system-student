<template>
  <view class="wrapper">

    <!--个人资料-->
    <view>
      <view class="top">
        <view class="center">
          <view class="center_top">

            <view class="center_img">
              <!-- #ifndef MP-WEIXIN -->
							<image :src="image"></image>
							<!-- #endif -->
							<open-data type="userAvatarUrl" class="user_head"></open-data>
            </view>

            <view class="center_info">
              <!-- 这里可以放自己的名称图片 -->
							
								<view>曹哲</view>
								
            </view>

            <view style="margin-left: 140rpx;margin-top: 15rpx;">
							<image style="width: 30px;height: 30px;" src="@/static/icon/setting.png"></image>
						</view>

          </view>

        </view>

        <image src='@/static/icon/waterflow.gif' mode='scaleToFill' class='gif-wave'></image>

      </view>

      <view class="extra">
        <view @click="logout()" class="item icon-arrow">退出登录</view>
      </view>

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
Page {
		font-size: 14px;
	}

	.top {
		width: 100%;
		height: 130px;
		background: #23EBB9;
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
		font-size: 20px;
	}

	.center_phone {
		color: #BEBEBE;
	}

	// .center_down {
	// 	display: flex;
	// 	flex-direction: row;
	// 	width: 80%;
	// 	height: 35px;
	// 	margin: 0 auto;
	// 	margin-top: 20rpx;
	// }

	.center_rank {
		width: 50%;
		height: 35px;
		display: flex;
		flex-direction: row;
	}

	.rank_text {
		height: 35px;
		line-height: 35px;
		margin-left: 10rpx;
		color: #AAAAAA;
	}

	.center_vip image {
		width: 25px;
		height: 25px;
		margin-top: 15rpx;
	}

	.vip_icon {
		width: 25px;
		height: 25px;
		margin-top: -10rpx;
	}

	.vip_text {
		margin-top: -55rpx;
		margin-left: 50rpx;
		color: #AAAAAA;
	}

	.center_rank image {
		width: 35px;
		height: 35px;
	}

	.center_score {
		width: 50%;
		height: 35px;
		display: flex;
		flex-direction: row;
	}

	.center_score image {
		width: 35px;
		height: 35px;
	}

	.gif-wave {
		position: absolute;
		width: 100%;
		bottom: 0;
		left: 0;
		z-index: 99;
		mix-blend-mode: screen;
		height: 100rpx;
	}

	.wrapper {
		position: absolute;
		top: 0;
		bottom: 0;

		width: 100%;
		background-color: #F4F4F4;
	}

	.profile {
		height: 375rpx;
		background-color: #ea4451;
		display: flex;
		justify-content: center;
		align-items: center;

		.meta {
			.avatar {
				display: block;
				width: 140rpx;
				height: 140rpx;
				border-radius: 50%;
				border: 2rpx solid #fff;
				overflow: hidden;
			}

			.nickname {
				display: block;
				text-align: center;
				margin-top: 20rpx;
				font-size: 30rpx;
				color: #fff;
			}
		}
	}

	.count {
		display: flex;
		margin: 0 20rpx;
		height: 120rpx;
		text-align: center;
		border-radius: 4rpx;
		background-color: #fff;

		position: relative;
		top: 10rpx;

		.cell {
			margin-top: 10rpx;
			flex: 1;
			padding-top: 20rpx;
			font-size: 27rpx;
			color: #333;
		}

		text {
			display: block;
			font-size: 24rpx;
		}
	}

	.orders {
		margin: 20rpx 20rpx 0 20rpx;
		padding: 40rpx 0;
		background-color: #fff;
		border-radius: 4rpx;

		.title {
			padding-left: 20rpx;
			font-size: 30rpx;
			color: #333;
			padding-bottom: 20rpx;
			border-bottom: 1rpx solid #eee;
			margin-top: -30rpx;
		}

		.sorts {
			padding-top: 30rpx;
			text-align: center;
			display: flex;
		}

		[class*="icon-"] {
			flex: 1;
			font-size: 24rpx;

			&::before {
				display: block;
				font-size: 48rpx;
				margin-bottom: 8rpx;
				color: #ea4451;
			}
		}
	}

	.address {
		line-height: 1;
		background-color: #fff;
		font-size: 30rpx;
		padding: 25rpx 0 25rpx 20rpx;
		margin: 10rpx 20rpx;
		color: #333;
		border-radius: 4rpx;
	}

	.extra {
		margin: 0 20rpx;
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

	.icon-arrow {
		position: relative;

		&::before {
			position: absolute;
			top: 50%;
			right: 20rpx;
			transform: translateY(-50%);
		}
	}
</style>