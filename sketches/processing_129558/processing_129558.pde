
float x =300;
float y=200;

float redX=50;
float redY=350;

float blueX=550;
float blueY=350;

float greenX=300;
float greenY=50;

void setup() {
  size(600, 400);
  background(255);
  frameRate(600);
  fill(255, 0, 0);
  ellipse(redX, redY, 5, 5);
  fill(0, 0, 255);
  ellipse(blueX, blueY, 5, 5);
  fill(0, 255, 0);
  ellipse(greenX, greenY, 5, 5);
}

void draw() {
  float choice = random(1);
  if (choice < 1/3.0) {
    x=(x+blueX)/2;
    y=(y+blueY)/2;
    stroke(0,0,255);
    point(x,y);
  }
  else if (choice < 2/3.0) {
   x=(x+redX)/2;
    y=(y+redY)/2;
    stroke(255,0,0);
    point(x,y);
  }
  else {
    x=(x+greenX)/2;
    y=(y+greenY)/2;
    stroke(0,255,0);
    point(x,y);
  }
}


