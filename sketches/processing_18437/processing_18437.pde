
import ddf.minim.*;

Minim minim;
AudioInput in;

float r = 0;

void setup() {
  size(400, 400);
  smooth();

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  background(0);
  r -= abs((in.left.get(0) + in.right.get(0))*5);
  pushMatrix();
  translate(width/2, height/2);
  rotate(r*PI/60);
  
  for (int i = 0; i < 4; i++){
    quad(0, 0, 0, -height/4, width/8, -width/8, width/8, 0);
    rotate(PI/2);
  }
  
  popMatrix();
}


void stop() {
  in.close();
  minim.stop();

  super.stop();
}

