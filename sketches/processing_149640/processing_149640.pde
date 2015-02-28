
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hong Jiyae
// ID: 201420117
import ddf.minim.*;

Minim minim;
AudioInput input;
float x = 0;
float y = 0;
//========================================================== 

void setup() {
  size (600,600);
  smooth();
  //noLoop();
  //========================================================== 
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  //==========================================================
}

void draw() {
  background(255);
  noStroke();
  fill (35, 54, 60, 30);
  float dia = input.mix.level() * 1000;

  x += input.mix.level() * 100;

  for (int i = 0; i < width; i = i + 100) {
    for (int j = 0; j < height; j = j +50) {
      rect(j,i,30,30+dia);
      rect(i,j,30+dia,30);
    }
  }
        title();
}
  void keyPressed() {
    background(0);
    redraw();
  } 
void title() { 
  fill(127);
  textAlign(RIGHT);
  text("HONG Jiyae, pattern, Dynamic Media, 2014", width-50, height-20);
}
