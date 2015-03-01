
/* CÃ¡lculo de peso ideal segÃºn la fÃ³rmula de Perroult */

String[] Nombre= {
  "Maria", "Pepe", "Teresa", "Paco", "Miguel", "Juana"
};

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

int i=int(random(6));

PI[i]=Talla[i]-100+(Edad[i]/10)*0.9;
DP[i]=abs(PI[i]-Peso[i]);

Perder=Peso[i]-PI[i];
Ganar=PI[i]-Peso[i];

print(Nombre[i]+ " tiene "+Edad[i]+" aÃ±os, pesa " +Peso[i]+ " kg y mide "+Talla[i]+" cm. Su P.I. es "+PI[i]);

if (Peso[i]>PI[i]) {
  println (", por lo tanto deberÃ­a perder " +Perder+ " kg.");
} else {
  if (Peso[i]==PI[i])println (", por lo tanto estÃ¡Â¡s en tu peso ideal");
  else println (", por lo tanto deberÃ­a ganar " +Ganar+ " kg.");
}

