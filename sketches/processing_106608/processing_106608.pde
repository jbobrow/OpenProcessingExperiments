
float[] circ_x; // abcissa da circunferẽncia
float[] circ_y; // oredenada da circunferência
int arcos = 36;

void setup() {
  // equação de uma circunferência representada
  // por equações paramétricas
  // x = R*cos(t)
  // y = R*sin(t)

  circ_x = new float[arcos];
  circ_y = new float[arcos];

  for (int t=0; t<arcos; t++)
  {
    circ_y[t] = sin(t*PI*2/arcos);
    circ_x[t] = cos(t*PI*2/arcos);
    //  println(circ_x[t]+" "+circ_y[t]);
  }
  background(0);
  colorMode(HSB);
}

void draw() {
  int dx=70;
  int dy=35;
  int aux; 
  aux = floor(85.0*mouseY/height);
if(aux>80)
  { fill(200);
    rect(0,85,100,8);
    fill(50,255,255);
    rect(50,78,20,60);
  }
  noStroke();
  translate(60, 40);
  for (int i=7; i<12; i++) {
    //percorre o array alturas
    fill(i*255/arcos, 255, 255, 5);
    ellipse(circ_x[i]*dx, circ_y[i]*dy, 5, 5);
  }

  dx=50;
  dy=70;

  translate(0, aux);
  for (int i=23; i<32; i++) {
    //percorre o array alturas
    fill(i*255/arcos, 255, 255, 5);
    ellipse(circ_x[i]*dx, circ_y[i]*dy, 5, 5);
  }
}
