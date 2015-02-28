
float angle = 0.0;
PImage mysnow1;

void setup() {
  size (1000, 1000);
  mysnow1= loadImage ("mysnow1.png");
  smooth();
}

void draw () {
  translate(500, 500);
  rotate (angle);
  //rect(-15,-15,30,30);
  image(mysnow1, -200, -500, 250, 250);
  image(mysnow1, -300, -600, 150, 150);
  image(mysnow1, -100, -250, 70, 70);
  image(mysnow1, -200, -500, 250, 250);
  image(mysnow1, -90, -190, 90, 90);
  image(mysnow1, -55, -95, 40, 40);
  image(mysnow1, -40, -60, 37, 37);
  image(mysnow1, -20, -40, 30, 30);
  angle+=8;
}


