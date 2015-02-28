
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;


int x;
int angle;
int i;
int f;

void setup() {
  


  size(512, 512, P3D);
  x=0;
  angle=0;

  minim= new Minim(this);


  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  
  smooth();

  angle=10;
  x=4;
  translate(256, 50, -300);

  background(0);
  noStroke();

  for (int f=0; f<360; f++) {
    for (int i = 0; i<512; i+=5) {

      rotate(radians(f));
      translate(f*x, 0); 
      point(i, 256+in.left.get(i)*500);
      ellipse(i, 256, in.left.get(i)*100, in.left.get(i)*100);

      fill(random(0, 255), random(100, 255), 0);
    }
  }
}


