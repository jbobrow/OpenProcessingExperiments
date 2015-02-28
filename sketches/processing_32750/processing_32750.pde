
PImage sworddown;
PImage swordup;

int x=20;
int y=20;
int xcoordinate=0;
int ycoordinate=0;

void setup() {
  sworddown = loadImage ("data/sworddown.jpg");
  swordup = loadImage ("data/swordup.jpg");
  smooth();
  strokeWeight(4);
  size( 1680, 1000);
}

void draw() {

  background( 182, 255, 0);

  if (keyPressed) {
    if (keyCode== LEFT) {
      xcoordinate=xcoordinate-2;
      translate (xcoordinate, ycoordinate);
      image(swordup, xcoordinate, ycoordinate);
    }


    else if (keyCode== RIGHT) {
      xcoordinate=xcoordinate+2;
      translate (xcoordinate, ycoordinate);
      image(swordup, xcoordinate, ycoordinate);
    }


    else if (keyCode== DOWN) {
      ycoordinate=ycoordinate+2;
      translate (xcoordinate, ycoordinate);
      image(swordup, xcoordinate, ycoordinate);
    }


    else if (keyCode== UP) {
      ycoordinate=ycoordinate-2;
      translate (xcoordinate, ycoordinate);
      image(swordup, xcoordinate, ycoordinate);
    }

    else if (keyCode== CONTROL) {
      translate (xcoordinate, ycoordinate);
      image(sworddown, xcoordinate, ycoordinate);
    }
  }
  else {
    translate (xcoordinate, ycoordinate);
    image(swordup, xcoordinate, ycoordinate);
  }
}


