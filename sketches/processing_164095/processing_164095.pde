
/* Cálculo de peso ideal según la fórmula de Perroult */

float[] DP=new float [6];
float[] PI=new float [6];
int[] Edad= {
  18, 19, 20, 21, 22, 23
};
int[] Talla= {
  165, 160, 170, 180, 175, 165
};
float[] Peso= {
  70, 65, 80, 75, 60, 85
};
float Perder, Ganar;
for (int i=0; i<6; i++)
{
  PI[i]=Talla[i]-100+(Edad[i]/10)*0.9;
  DP[i]=abs(PI[i]-Peso[i]);

  Perder=Peso[i]-PI[i];
  Ganar=PI[i]-Peso[i];

  print("Tengo "+Edad[i]+" años, peso " +Peso[i]+ " kg y mido "+Talla[i]+" cm, mi P.I. es "+PI[i]);

  if (Peso[i]>PI[i]) {
    println (", por lo tanto debería perder " +Perder+ " kg.");
  } else {
    if (Peso[i]==PI[i])println (", por lo tanto estás en tu peso ideal");
    else println (", por lo tanto debería ganar " +Ganar+ " kg.");
  }
}

