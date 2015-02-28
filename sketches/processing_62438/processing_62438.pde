
import ddf.minim.*;

Minim minim;
AudioInput in;
float rx;
float ry;
void setup() {
  size(512, 512, P2D);
  minim= new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  colorMode(HSB, 512);
  noFill(); 
  smooth();
  rx=random(0, 200);
  ry=random(0, 200);
}


void draw() {
  background(0);
  //stroke(255);
  for (int i = 0;i<512; i+=20)
  {
    //line(0, 0, 512, 512);
    strokeWeight(5);
    stroke(512);
     point(i, 256+in.left.get(i)*50);

     fill(i,512,512);
    ellipse(i, 256,in.left.get(i)*50,in.left.get(i)*50);
    pushMatrix();
    translate(256, 256);
    rotate(radians(in.left.get(i)*180)+random(1,360));
    //rotateX(rad8ahs(rx));
    rotateY(radians(rx));
    arc(0, 0, i, i, radians(rx), radians(ry));
    popMatrix();
  }
}


