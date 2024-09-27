<template>
	<!--主体-->
	<view style="height: 100vh; background: #fff">
		<!--抬头标题-->
		<view class="img-a">
			<view class="t-b"> 修改密码 </view>
		</view>

		<!--登录-->
		<view class="login-view">
			<!--登录主体-->
			<view class="t-login">
				<!--账号密码-->
				<form class="cl">
					<view class="t-a">
						<text class="txt">请输入手机号：</text>
						<input name="studentNumber" placeholder="请输入您的密保手机号" maxlength="12" v-model="phone" />
					</view>

					<view class="t-a">
						<text class="txt">验证码</text>
						<view class="wrap">
							<input name="code" placeholder="请输入您的验证码" v-model="code" />
							<button>发送验证码</button>
						</view>
					</view>

					<view class="t-a">
						<text class="txt">请输入新密码:</text>
						<input type="password" name="password" maxlength="18" placeholder="请输入您的密码"
							v-model="newPassword" />
					</view>
					<view class="t-a">
						<text class="txt">请重复新密码:</text>
						<input type="password" name="password" maxlength="18" placeholder="请输入您的密码"
							v-model="rePassword" />
					</view>
					<button @click="handleLogin()">确 认</button>
				</form>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			phone: "", //密保手机号
			code: "", //验证码
			newPassword: "", //新密码
			rePassword: "", //重复密码
		};
	},
};
</script>

<style lang="scss">
.img-a {
	width: 100%;
	height: 450rpx;
	background-image: url(https://zhoukaiwen.com/img/loginImg/head.png);
	background-size: 100%;
}

.t-b {
	text-align: left;
	font-size: 42rpx;
	color: #ffffff;
	padding: 130rpx 0 0 70rpx;
	font-weight: bold;
	line-height: 70rpx;
}

.login-view {
	width: 100%;
	position: relative;
	margin-top: -120rpx;
	background-color: #ffffff;
	border-radius: 8% 8% 0% 0;
}

.head-nav {
	margin: 20rpx auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: #cccccc;
}

.inv-h {
	font-size: 30upx;
	flex: 1;
	text-align: center;
	height: 100upx;
	line-height: 100upx;
}

.inv-h-se {
	color: #075cef;
	font-weight: bold;
	border-bottom: 6rpx solid #075cef;
}

.t-login {
	width: 600rpx;
	margin: 0 auto;
	font-size: 28rpx;
	padding-top: 80rpx;
}

.cl {
	zoom: 1;
}

.cl:after {
	clear: both;
	display: block;
	visibility: hidden;
	height: 0;
	content: "\20";
}

.txt {
	font-size: 32rpx;
	font-weight: bold;
	color: #333333;
}

.t-login button {
	font-size: 28rpx;
	background: #2796f2;
	color: #fff;
	height: 90rpx;
	line-height: 90rpx;
	border-radius: 50rpx;
	font-weight: bold;
}

.t-login input {
	height: 90rpx;
	line-height: 90rpx;
	margin-bottom: 50rpx;
	border-bottom: 1px solid #e9e9e9;
	font-size: 28rpx;
}

.t-login .t-a {
	position: relative;
}

.wrap {
	display: flex;
	/* 启用 Flexbox 布局 */
	align-items: center;
	/* 垂直居中对齐 */
	justify-content: space-between;
	/* 两端对齐 */
}
</style>
