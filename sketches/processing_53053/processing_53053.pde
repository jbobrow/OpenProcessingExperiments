
float x1;
float y1;
float w1;
float h1;
color rectColor;
float i = 1;

void setup(){
  background(230,100,70);
  size (600, 400);
  colorMode(HSB);
  frameRate(10);
  x1=random(100,570);
  y1=height/2;
  w1=15;
  h1=15;
}
void draw() {
  if (mousePressed == true) {
    //background(230,100,70);
    background(random(1,255),random(1,255),random(1,255));
  }
  colorChange();
  drawRects();
}
void drawRects() {
 
  x1 = x1 + random(-5,5);
  y1 = y1 + random (-5,5);
  x1 = constrain(x1,0,(width-200));
  y1 = constrain(y1,0,(height-20));
  w1 = w1 + random(-20,20);
  h1 = h1 + random(-20,20);
  w1 = constrain(w1,0,100);
  h1 = constrain(h1,0,100);
  noFill();
  stroke(rectColor);
  rect(x1,y1,w1,h1);
}
void colorChange(){
  i = random(1,150);
  rectColor = color(i, 110,255);
   }

  

