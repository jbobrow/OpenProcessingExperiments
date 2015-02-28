
Penguin myPenguin, yourPenguin, ourPenguin, theirPenguin;

void setup() {
  size (640, 480);
  myPenguin = new Penguin(100, 100,.5);
  yourPenguin = new Penguin(200,200,1);
  ourPenguin = new Penguin(100,200,.7);
  theirPenguin = new Penguin(200,100,.2);
}

void draw () {
  background(216,15,66);

  myPenguin.make();
  myPenguin.motion();
  yourPenguin.make();
  yourPenguin.motion();
  ourPenguin.make();
  ourPenguin.motion();
  theirPenguin.make();
  theirPenguin.motion();
}
class Penguin {
  float geoX;
  float geoY;
  float scaleSize;
  Penguin (float locX, float locY, float scSz) {
    geoX=locX;
    geoY=locY;
    scaleSize=scSz;
  }
  void motion () {
    float nx= int(random(-2, 2));
    float ny= int(random(-2, 2));
    float geoSpeed = 1;
    float geoDirection = 1;

    if (geoX>width || geoX<100) {
      geoDirection = geoDirection*-1;
    }
    geoX=geoX+geoSpeed*geoDirection;
    make();
  }

  void make () {
    //pushMatrix();
    scale(scaleSize);
    noStroke();
    fill(0); // black
    rect(geoX+32, geoY+3, 35, 20); //hat
    rect(geoX+27, geoY+14, 45, 5);
    fill(200, 0, 230); // magenta
    rect(geoX+32, geoY+11, 35, 3); // hat band
    fill(87); // charcoal
    ellipse(geoX+50, geoY+55, 70, 75); // body and wings
    ellipse(geoX+19, geoY+65, 12, 40);
    ellipse(geoX+81, geoY+65, 12, 40);
    fill(0); // black
    ellipse(geoX+48, geoY+40, 2, 2); // eyes
    ellipse(geoX+52, geoY+40, 2, 2);
    fill(250); // white
    ellipse(geoX+50, geoY+75, 30, 35); // tummy
    fill(geoX+200, geoY+150, 0); // orange
    ellipse(geoX+39, geoY+93, 15, 5); // feet
    ellipse(geoX+61, geoY+93, 15, 5);
    triangle(geoX+44, geoY+44, geoX+56, geoY+44, geoX+50, geoY+49); // beak
    //popMatrix ();
  }
}
