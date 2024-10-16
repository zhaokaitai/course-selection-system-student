const baseURL = 'http://localhost:8080'//基础url

export const courseRequest = (options) =>{
    //加载loading
	uni.showLoading({
		title:'加载中'
	})

    return new Promise((resolve, reject) => {
        uni.request({
            // 开发者服务器接口地址（请求服务器地址 + 具体接口名）
			url: baseURL + options.url,
			// 请求方式（若不传，则默认为 GET ）
			method: options.method || 'GET',
			// 请求参数（若不传，则默认为 {} ）
			data: options.data || {},
			// 请求成功

            success:(res)=>{
            	if(res.data.code === 40000)
				{
					uni.showToast({
						title: '请求参数错误',
						icon: 'error',
						mask: true
					})
				}else if(res.data.code === 40001)
				{
					uni.showToast({
						title: '请求数据为空',
						icon: 'error',
						mask: true
					})
				}else if(res.data.code === 40100)
				{
					uni.showToast({
						title: '未登录',
						icon: 'error',
						mask: true
					})
				}else if(res.data.code === 40101)
				{
					uni.showToast({
						title: '无权限',
						icon: 'error',
						mask: true
					})
				}else if(res.data.code === 40301)
				{
					uni.showToast({
						title: '禁止操作',
						icon: 'error',
						mask: true
					})
				}else if(res.data.code === 50000)
				{
					uni.showToast({
						title: '系统内部错误',
						icon: 'error',
						mask: true
					})
				}else
				{
					resolve(res);
				}



            },

            //请求失败
            fail: (err) => {
				reject(err)
			},

            //请求结束之后，执行的回调函数（成功或失败都会执行）
			complete() {
				//隐藏loading
				uni.hideLoading()
			}

        })
    })

}