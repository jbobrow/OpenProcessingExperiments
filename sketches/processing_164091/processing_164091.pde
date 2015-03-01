
int[] Edad={19,20,20,19,21,20};
int[] Talla={167,174,169,173,182,168};
int[] Peso={58,60,78,77,54,55,89,68};
float[] PR={52,73,55,60,62,70};
float[] PA=new float[6];
float[] DP=new float[6];
int i;

for(i=0;i<6;i++)

{
  PA[i]=Talla[i]-100+(Edad[i]/10)*0.9;
  print("Para la edad "+Edad[i]+" y altura "+Talla[i]+" el peso ideal es "+PA[i]+".");
 
 DP[i]=abs(PA[i]-PR[i]);
  
  if (Peso[i]>PA[i])
  println(". Si tu peso es "+Peso[i]+" excedes el peso ideal. Deberías adelgazar "+DP[i]+" kilos.");
  else
  println(". Si tu peso es "+Peso[i]+" estás pero debajo del peso ideal. Deberías engordar "+DP[i]+" kilos.");
}
