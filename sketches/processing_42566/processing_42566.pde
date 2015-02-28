
PFont font, font2, font3;
float c=0;
float d=0;
float a=0;
float b=0;
float speedC=5;
float speedD=1;

void setup() {
  size(500, 500); 
  background (240, 245, 250);
  smooth();
  noStroke();
  font=loadFont ("UniversCE-Light-20.vlw");
  font2=loadFont ("UniversLT-Bold-40.vlw");
  font3=loadFont ("UniversLT-ExtraBlack-60.vlw");
a=400;
  d=-60;
  c=-100;
}

void draw() {
  fill(240, 245, 250);
  rect (0, 0, width, 180);
  fill(111, 165, 100);
  rect (0, 180, width, height);


  textFont (font, 20);
  fill(100);
  text("mouse", c, a, -60);

  textFont (font2, 40);
  fill(0);
  text("cat", c-90, a);

  textFont (font3, 60);
  fill(126, 73, 15);
  text("DOG", c-270, a, +50);

  if (c>width + 300) {
    c=-70;
    a=random(180, 500);
  }


  textFont (font, 20);
  fill(252, 103, 50);
  text("bird", d, 180-b, +50);
  b=random(100, 120);

  if (d>width + 50) {
    d=-30;
    b=random(1, 300);
  }

  c=c+speedC;
  d=d+speedD;
}


