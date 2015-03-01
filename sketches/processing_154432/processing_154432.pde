
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65949*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float[] randos;
float[] noisos;
float xinc, prevx = 0;
void setup() {
  size(500, 300);
  smooth();
  colorMode(HSB, 360, 100, 100);
  randos = new float[100];
  noisos = new float[24];

  for (int i=0; i<randos.length; i++) {
    randos[i] = random(100);
  }
  
  xinc = (width) / noisos.length;
  for (int i=0; i<noisos.length; i++) {
    noisos[i] = noise(50*i/noisos.length)*height/2;
  } 
  
  rectMode(CORNERS);
  noLoop();
}

void draw() {
  background(50, 10, 90);
  for (int i=0; i<randos.length; i++) {
    // xinc depends on the number of columns
    xinc = (width - 1.0) / randos.length;
    fill(randos[i], 90, 90);
    rect(i*xinc, height/2, xinc, -randos[i]);
  }
  
  for (float i = 0; i<noisos.length; i++){
    // xinc depends on the number of columns
    xinc = (width - 1.0) / noisos.length;
    fill(noisos[i], 90,90);
    if(prevx != i*xinc) console.log("prevx != i*xinc: " + prevx +"!="+ i*xinc);
    rect(i*xinc, height-50, (i+1)*xinc, height-50-noisos[i]);
    prevx = (i+1)*xinc;
  }
}
