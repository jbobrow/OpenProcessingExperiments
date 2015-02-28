
// JU Hwiyeon
// 201420109

  
//import ddf.minim.*;

//Minim minim;
//AudioInput input;
 
float angle;
float x, y;

void setup() {
  //size (displayWidth, displayHeight);
  size (800,800);
  smooth();
//minim = new Minim (this);
//input = minim.getLineIn (Minim.MONO, 512);

}

void draw() {
  background(0);
//float dia = input.mix.level() * 1000;
 
  fill(255);
  stroke(0);
  strokeWeight(mouseY/5);

  translate(x, y);

  if (mousePressed) {
    x=mouseX;
    y=mouseY;
  }

  for (float i=0; i<100; i++) {
    rotate((angle)/200);

    scale(0.9);
    rectMode(CENTER); 
    rect(0, 0, 2*width, 2*width);
    
  }

  angle = lerp(angle, mouseX, 0.001);
  x = lerp(x, mouseX, 0.005);
  y = lerp(y, mouseY, 0.005);
}

 
