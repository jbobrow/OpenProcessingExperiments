

PImage logo;


void setup() {
  background(255);
  size(200, 200);
  logo = loadImage("lo-01.png");
  logo.loadPixels();
  frameRate(500);
}

void draw() {

  //image(logo,0,0);
  fill(255, 4);
  //rect(0,0,width,height);
  stroke(0, 40);

  int xpos = int( random( width ));
  int ypos = int( random( height));
  int xpos2 = int( random( width ));
  int ypos2 = int( random( height));
  int r =  int (random (10));
  xpos = constrain(xpos, xpos2+r, ypos2+r);
    //ypos =  constrain(ypos, width/2, -200);
  ypos = constrain(ypos, xpos2+r, ypos2+r);
  //ypos2 =  constrain(ypos2, width/2, 200);

    color c = logo.get(xpos, ypos);
  color c2 = logo.get(xpos2, ypos2);

  if ((blue(c) < 100 && blue(c2) < 100)) {

    line (xpos, ypos, xpos2, ypos2);
  }
}


