
int[]Edat = {19, 20, 20, 19, 21, 20};
int[]Talla = {167, 174, 169, 173, 182, 168};
float[]Pes = {52.5, 65, 73.1, 68.6, 55.9, 61.2};
float[]DP = new float[6];
float[]PIdeal = new float[6];

for (int i = 0; i<6; i++) {
  PIdeal[i] = Talla[i]-100+(Edat[i]/10)*0.9;
  DP[i] = abs(PIdeal[i]-Pes[i]);
  println("Para la edad "+Edat[i]+" y altura "+Talla[i]+" el peso ideal es "+PIdeal[i]);
  if (PIdeal[i]>Pes[i]) {
  println("T'has d'engreixar "+DP[i]);
} 
else {
  if (Pes[i] == PIdeal[i]) {
    println("Estás perfecta");
  }
  else {
    println("T'has d'aprimar "+DP[i]);
  }
}
}

