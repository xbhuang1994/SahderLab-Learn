Shader "Sbin/sf" {
	Properties {
//		颜色
		_Color ("Color", Color) = (1,1,1,1)
//		主纹理
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
//		表面的光滑度
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
//		金属光泽
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
//		不透明的物体标记
		Tags { "RenderType"="Opaque" } 
//		层级细节，暂时忽略
		LOD 200
//		代码块，表示下列使用CG语法，直到ENDCG
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
//		编译指令 surf:函数名称 Standard：光照模型 fullforwardshadows : 支持所有光照阴影（默认的话只支持环境光阴影）
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
//		使用shader model 3.0的目标，可以得到一个更完美的光照
		#pragma target 3.0

//		结构体，用于描述UV的纹理坐标 
//		成员变量必须使用“uv”开头 ，后面与_MainTex保持一致
		struct Input {
			float2 uv_MainTex;
		};

//		声明主纹理
		sampler2D _MainTex;
//		声明光泽度参数
		half _Glossiness;
//		声明金属光泽参数
		half _Metallic;
//		声明颜色参数
		fixed4 _Color;

//		无返回 inout 输入并且输出并在外部可以直接使用的。
		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
