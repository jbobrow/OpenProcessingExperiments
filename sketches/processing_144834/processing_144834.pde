
float R = 0.0;

import ddf.minim.*;

Minim minim;
AudioInput in;



void setup() {
  size(800,600);
  background(0);
    minim = new Minim(this);
in = minim.getLineIn();
}

void draw() {
R = 0.0;
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
  R = R + in.left.get(i)*5 + in.right.get(i)*5 + in.right.get(i+1)*5 + in.left.get(i+1)*5;
  }
    noFill();
  stroke(255);
   background(0);


 

 ellipse(width/2, height/2, R, R);
  triangle(width/3 + random(+R), height/1.5 + random(-R), width/2 + random(-R), height/3 + random(+R), width/1.5 + random(-R), height/1.5 + random(+R));
  stroke(0,200,50);
  triangle(width/3 + random(-R), height/1.5 + random(+R), width/2 + random(+R), height/3 + random(-R), width/1.5 + random(+R), height/1.5 + random(-R));
    stroke(200,0,50);
  triangle(width/3 + random(+R), height/1.5 + random(-R), width/2 + random(-R), height/3 + random(+R), width/1.5 + random(-R), height/1.5 + random(+R));
    stroke(0,50,200);
  triangle(width/3 + random(-R), height/1.5 + random(+R), width/2 + random(+R), height/3 + random(-R), width/1.5 + random(+R), height/1.5 + random(-R));

}


