
float x = 360;
float y = 428;
int bodyHeight=20;
int radius = 100;
float easing = 0.02;
PImage img;



void setup() {
  size(720, 480);
  smooth();
  ellipseMode(RADIUS);
  img = loadImage("moon.jpg");
}

void draw() {
 //background(img);
  image(img, 0, 0, width, height);
   
  int targetX = mouseX;
  x +=(targetX - x) * easing;
  
  if (mousePressed) {
    bodyHeight=50;
  }else {
    bodyHeight=20;
  }

float ny = y - bodyHeight - radius;

//LEFT ARM
  fill(0);
  strokeWeight(2);
  line(x-60, y-178 - bodyHeight, x-160, 360 - bodyHeight);

//LEFT ELBOW
  fill(0);
  ellipse(x-160, y-68 - bodyHeight, 4, 4);

//LEFT WRIST
  fill(0);
  strokeWeight(2);
  line(x-160, y-68 - bodyHeight, x-160, 400 - bodyHeight);

//LEFT PALM
  fill(0);
  ellipse(x-160, y-28 - bodyHeight, 8, 8);

//LEFT FINGERS
  fill(180);
  strokeWeight(1);
  line(x-160, y-28 - bodyHeight, x-180, 420 - bodyHeight);
  fill(180);
  strokeWeight(1);
  line(x-160, y-28 - bodyHeight, x-160, 428 - bodyHeight);
  fill(180);
  strokeWeight(1);
  line(x-160, y-28 - bodyHeight, x-140, 420 - bodyHeight);
//
//
//RIGHT ARM
  fill(0);
  strokeWeight(2);
  line(x+60, y-168 - bodyHeight, x+120, 360 - bodyHeight);

//RIGHT ELBOW
  fill(0);
  ellipse(x+120, y-68 - bodyHeight, 4, 4);

//RIGHT WRIST
  fill(0);
  strokeWeight(2);
  line(x+120, y-68 - bodyHeight, x+120, 400 - bodyHeight);

//RIGHT PALM
  fill(0);
  ellipse(x+120, y-28 - bodyHeight, 8, 8);

//RIGHT FINGERS
  fill(180);
  strokeWeight(1);
  line(x+120, y-28 - bodyHeight, x+140, 420 - bodyHeight);
  fill(180);
  line(x+120, y-28 - bodyHeight, x+120, 428 - bodyHeight);
  fill(180);
  line(x+120, y-28 - bodyHeight, x+100, 420 - bodyHeight);

//MAINBODY
  fill(0);
  ellipse(x-10, y-178 - bodyHeight, 100, 80);

//RECTANGLE EYEPEICE
  fill(180);
  strokeWeight(0);
  rect(x-10, y-228 - bodyHeight, 100, 20);

//GRILL
 fill(225);
 strokeWeight(0);
 for (int i = 225; i > 225 - bodyHeight; i -= 3) {
   rect(x-10, i - 3, 100, 2);
 }

//LEFT EYE
  fill(0);
  ellipse(x+10, y-218 - bodyHeight, 5, 5);
  fill(225);
  ellipse(x+10, y-218 - bodyHeight, 2, 2);

//RIGHT EYE
  fill(0);
  ellipse(x+60, y-218 - bodyHeight, 5, 5);
  fill(225);
  ellipse(x+60, y-218 - bodyHeight, 2, 2);


}



