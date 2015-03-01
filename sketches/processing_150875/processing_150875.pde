
//==========================================================
import ddf.minim.*;

Minim minim;
AudioInput input;
//==========================================================

float xPos = 0;
float diameter = 30;
float angle;
float dia;
void setup() {
  size(600, 600, P3D);
  smooth();
  colorMode(HSB, width, 100, 100);
  //========================================================== 
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  //==========================================================
}
void draw() {
  background(0);
  float dia = input.mix.level() * 1000;

  xPos = xPos + 1;
  // fill(255, 1);

  if (xPos > width + diameter) xPos = -diameter;

  translate(width/2, height/2, 0);
  for (int j = 0; j < 20; j = j + 1) {
    strokeWeight(30);
    noFill();
    rotate(radians(-angle*5)); 
    scale(0.85);
    rotateX(radians(angle));
    rotateY(radians(angle));
    stroke(width,100);
    box(300+dia);
        translate(0,100, 0);
        box(50);
    translate(0, -100, 0);
     stroke(xPos, 100, 100, 30);
    fill(xPos,100);
    sphere(100);
  }
  angle = angle + 0.1;
}

