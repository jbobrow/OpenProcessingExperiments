
float[] circ_x; // abcissa da circunferẽncia
float[] circ_y; // oredenada da circunferência
int arcos = 20;

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

  int dx=mouseX/2;
  int dy=mouseY/2;
  noStroke();
  translate(50, 50);
  for (int i=0; i<arcos; i++) {
    //percorre o array alturas
    fill(i*255/arcos,255,255,5);
    ellipse(circ_x[i]*dx, circ_y[i]*dy, 5, 5);
    }
  }
