
float[] DP=new float[6];
float[] Pi=new float[6];
int[] Edad={19,20,20,19,21,20}; //declaración+inicialización
int[] Talla={167,174,169,173,182,168};
float[] Peso={52,73,55,60,62,70};

for( int i=0; i<6; i++)
{
  Pi[i]=Talla[i]-100+(Edad[i]/10)*0.9;
  DP[i]=abs(Pi[i]-Peso[i]);


println("El individuo tiene "+Edad[i]+" ,pesa "+Peso[i]+" y mide "+Talla[i]+" por tanto su P.I es "+Pi[i]+" ");

if (Peso[i]>Pi[i]) {println("Has de adelgazar "+DP[i]);}
else {
if (Peso[i]==Pi[i]) {println("¡Estas genial!");}
else  {println("Debes engordar "+DP[i]);}
}
}
