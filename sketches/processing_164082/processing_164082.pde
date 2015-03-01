

int[] talla={167,174,169,173,182,168};
int[] edat={19,20,20,19,21,20};

float[] PR={52,73,55,60,62,70};
float[] PID=new float [6];
float[] DP=new float [6];


for(int i=0; i<6; i++){

 PID[i] = talla[i] - 100 + (edat[i]/10) * 0.9;
 DP[i] = abs(PID[i] - PR[i]);
 
 
print("Per l'edat " +edat[i]+" i l'alçada " +talla[i]+ " PI és " +PID[i] +" kg");
if(PID[i]>PR[i]) {
  println("El seu metge li recomana que s'engreixi " + DP[i] + " kg"); }
else{
  if(PR[i] == PID[i]){println("Continua així!");}
  else{println("El seu metge li recomana que s'aprimi " + DP[i] + " kg");}
     }
}
