
//draw polygon with number of sides

import ddf.minim.*;
AudioInput in;
Minim soundengie;
float R;

void setup() {
  size(displayWidth, displayHeight);
  soundengie=new Minim(this);
  soundengie.debugOn();
  in=soundengie.getLineIn(Minim.STEREO, width);
}

void draw() {
  for (int i=0; i<in.bufferSize()-1; i+=1) {
    R=in.right.get(i)*2000;
  }
  fill(0, 5);
  rect(0, 0, width+5, height+5);


  //background(5);

  int xLoc = width/2;
  int yLoc = height/2;
  int slvl = int(R);

  float rotation = -HALF_PI;
  int sides = slvl/2;

  int radius = width/2-10;
  strokeWeight(5);
  noFill();
  //stroke(240);

  beginShape();

  for (int i=0; i<sides+3;i++) {
    float theta = TWO_PI*i/sides;
    float rf;//radius factor

    if (i%2==0) {
      rf = R*.001;
      stroke(R,365-R,365-R);
    }

    else {
      rf=-.5*R;
    }
    if (R<=80) {
      rf=0;
      stroke(0, 256);
    }
    if (slvl%2==1){
      slvl+=1;
    }
    float x = rf*radius/5 * cos(theta+rotation)+xLoc;
    float y = rf*radius/5 * sin(theta+rotation)+yLoc;

    curveVertex(x, y);
  }
  endShape(CLOSE);
}



