
//make the coordinates of the particles an array so we can put them wherever!!!

int radius = 20;
float p = 1;
float x = -radius;
float s = 100;
float speed = 15;
int direction = 1;



int startX1 = 380;
int stopX1 = 360;
//int startY1 = 
//int stopY1 =

int startX2 =  380;
int stopX2 = 360;
//int startY2 = 
//int stopY2 =

//int startX3 = 
//int stopX3 =
//int startY3 = 
//int stopY3 =

float a = startX1;
//float b = startY1;
float c = startX2;
//float d = startY2;
//float e = startX3;
//float f = startY3;
float step = 0.025;
float pct = 0.0;

void setup () {
  size (600, 600);
  frameRate (2);
}

void draw () {


  background (7, 5, 75);

  p += speed;
  fill (255, 0, 0);
  rect(random, random 2, 2);
  if (p > 600) {
    p = -30;
  }
  fill (0, 0, 0);
  rect(random, random 2, 2);
  if (p > 600) {
    p = -30;
  }
    fill (0, 255, 0);
  rect(random, random, 2, 2);
  if (p > 600) {
    p = -30;
  }
    fill (255, 0, 255);
  rect(random, random, 2, 2);
  if (p > 600) {
    p = -30;
  }

  if (pct <1.0) {
    a = startX1 + ((stopX1-startX1) * pct);
    c = startX2 + ((stopX2-startX2) * pct);
    pct += step;
  }

  else if (pct > .1) {
    a = startX1 + ((stopX1-startX1) * -pct);
    c = startX2 + ((stopX2-startX2) * -pct);
    pct -= step;
  }
  fishy();
}

void fishy() {
  ellipseMode (CENTER);
  noFill();
  stroke(255);
  ellipse(width/2-60, height/2, 60, 50); //angler
  noStroke();
  fill (7, 5, 75);
  rect(width/2-100, height/2, 100, 60);
  fill(206, 10, 164);
  ellipse(width/2, height/2, 100, 75);
  noStroke();
  triangle(width/2+30, height/2, a, height/2+25, c, height/2-25);
  ellipseMode(CENTER);
  fill (0);
  ellipse(width/2-25, height/2-10, 20, 20);
  //  arc(width/2-50, height/2, radius, radius, radians(3.14), radians(6.13));
  fill(255);
  frameRate (10);
  // dancing light
  ellipse(width/2-90, height/2, 10, 10);
  stroke(random(216, 255), random(11, 255), 3); 
  line(width/2-80, height/2, width/2-70, height/2);
  line(width/2-100, height/2, width/2-110, height/2);

  line(width/2-90, height/2-10, width/2-90, height/2-20);
  line(width/2-90, height/2+10, width/2-90, height/2+20);

  line( width/2-80, height/2-8, width/2-65, height/2-20);
  line( width/2-100, height/2-8, width/2-115, height/2-20);

  line(width/2-80, height/2+8, width/2-65, height/2+20);
  line( width/2-100, height/2+8, width/2-115, height/2+20);
}

