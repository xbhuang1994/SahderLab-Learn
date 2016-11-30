Shader "Sbin/ff1" //fixed function shader
{
	Properties //属性
	{
		_Color("Main Color",color) = (1,1,1,1)
		_Ambient("Ambient",color)=(0.3,0.3,0.3,0.3)
		_Specular("Specular",color) = (1,1,1,1)
		_Shininess("Shininess",range(0,8)) = 4
		_Emission("Emission",color) = (1,1,1,1)

	}
	SubShader 
	{
		pass//渲染通道
		{
//			color(0.5,1,1,1)
			//color[_Color]
			material//材质
			{
				diffuse[_Color] //默认着色
				ambient[_Ambient] //环境光
				specular[_Specular] //高光着色
				shininess[_Shininess] //高光大小亮度
				emission[_Emission] //自发光
			}
			lighting on //光照效果开关
			separatespecular on //高光开关
		}
	}
}
