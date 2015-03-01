
int[]Edat={19,20,20,19,21,20};
int[]Talla={167,174,169,173,182,167};
float[]PR={52,73,55,60,62,70};
float[]PIdeal=new float[6];
float[]DP=new float[6];
int i;
for(i=0; i<6; i++)


{
  PIdeal[i]= Talla[i]-100+(Edat[i]/10)*0.9;
println("Per l'edat "+Edat[i]+" i l'alçada "+Talla[i]+" el PI és "+PIdeal[i]);

DP[i]=abs(PIdeal[i]-PR[i]);

if (PR[i]>PIdeal[i]){println("Aprima't plis tens "+DP[i]+ "kg de més" );}
else 
  {if (PR[i]==PIdeal[i]) {println("Molt bé, estàs al teu pes ideal! Carpe diem baby!");}
else 
  {println("Engreixa't tens "+DP[i]+" kg de menys");} 
}
}

