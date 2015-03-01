
import ddf.minim.*;
Minim minim;
AudioInput input;

float P;
float xoff;

void setup() {
  size(600, 600, P3D);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}
void draw() {
  fill(#1DAA65);
  float mic = input.mix.level() * 1000;

  P = P*0.90 + mic*0.8;

  //camera(mouseX, mouseY, 220, 0, 0, 0, 0, 1, 0);

  background(#ADFFCD);
  lights();


  for (int i=60; i<width; i+=150) {
    for (int j=40; j<height; j+=160) {
      xoff += 0.001;
      float n = noise(xoff)*500;

      pushMatrix();
      translate(i, j, -300);
      rotate(radians(30));
    
      sphere(30); 
      box(10,300,mic); 
      popMatrix();
    }
  }
}

