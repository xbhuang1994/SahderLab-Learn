Shader "Sbin/vf" {
	
	SubShader {
		pass{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			void vert(in float2 objPos:POSITION,out float4 pos:POSITION, out float4 col:COLOR)
			{
				pos = float4(objPos,0,1);
				col = pos;
			}

			void frag(inout float4 col:COLOR)
			{
//				col = float4(0,1,0,1);
			}

			ENDCG
		}
	}
}
