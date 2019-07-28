Shader "Custom/xjinesample"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_VertexX("VertexThreshold-X",Range(-35,65)) = 0
		_VertexY("VertexThreshold-Y",Range(-38,40)) = 0
		_VertexZ("VertexThreshold-Z",Range(0,200)) = 200
	}

		SubShader
	{
		Pass
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _VertexX;
			float _VertexY;
			float _VertexZ;

			v2f vert(appdata v)
			{
				v2f o;
				if (v.vertex.x > _VertexX)
				{
					v.vertex.x += 180;
				}
				if (v.vertex.y > _VertexY)
				{
					v.vertex.y += 200;
				}
				if (v.vertex.z > _VertexZ)
				{
					v.vertex.z += 100;
				}
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				fixed4 color = fixed4(i.uv.y, 0, i.uv.x, 1);
				return color;
			}

			ENDCG
		}
	}
	
}
