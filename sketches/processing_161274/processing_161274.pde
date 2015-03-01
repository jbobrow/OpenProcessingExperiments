

void setup() {  //setup function called initially, only once
  size(500,500);
  background(255);  //set background white
  noStroke()
 
}

void draw() {  //draw function loops 
if (mousePressed && (mouseButton == LEFT)) {
    fill(255,0,0);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(0,255,0);
  } else {
    fill(255,0,255);
  }
  rect(0,0,100,100);
  rect(400,0,100,100);
  rect(0,400,100,100);
  rect(400,400,100,100);
int circleSize = 10;
  int circleXpos = mouseX;
  int circleYpos = mouseY;
  fill(mouseX,mouseY,(20,200));
  ellipse(circleXpos,circleYpos,circleSize,circleSize);
fill(250,100,random(0,255));
ellipse(250,250,100,100);
if (mousePressed && (mouseButton == LEFT)) {
    fill(0,255,255);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255,175,0);
  } else {
    fill(255,255,0);
  }
ellipse(175,175,50,50);
ellipse(175,325,50,50);
ellipse(325,325,50,50);
ellipse(325,175,50,50);



}
