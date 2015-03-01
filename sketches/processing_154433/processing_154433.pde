
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65949*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float[] randos;
float[] noisos;
float xinc;
void setup() {
  size(500, 300);
  smooth();
  colorMode(HSB, 360, 100, 100);
  randos = new float[100];
  noisos = new float[100];

  for (int i=0; i<randos.length; i++) {
    randos[i] = random(100);
  }
  for (int i=0; i<noisos.length; i++) {
    noisos[i] = noise(i/50.0)*100.0;
  } 
  xinc = (width - 1) / 100.0;
}

void draw() {
  background(50, 10, 90);
  for (int i=0; i<randos.length; i++) {
    fill(randos[i], 90, 90);
    rect(i*xinc, height/2, xinc, -randos[i]);
    fill(noisos[i], 90,90);
    rect(i*xinc, height-50, xinc, -noisos[i]);
  }
}



