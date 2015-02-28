
int w = 500;
int h = 500;
int grass = color(0, 200, 0);
int yellow = color(255, 255, 0);
int brown = color(139, 69, 19);


void setup() {
  size(500, 500);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  background(255);
  house();
}

void house() {
  int H = (h/2)+100;
  //draw the hill
  fill(grass);
  stroke(grass);
  arc(w/2, H, w, h, PI, TWO_PI);
  rect(w/2, ((h/4)*3)+100, w, 250);
  
  //draw the house
  fill(0);
  stroke(0);
  strokeWeight(10);
  line(25, h/2-10, w/2, 135);
  line(w/2, 135, w-25, h/2-10);
  fill(brown);
  stroke(brown);
  strokeWeight(1);
  triangle(20, h/2-5, w/2, 140, w-20, h/2-5);
  rect(w/2, h/2+25, w-44, 60);
  
  //draw the windows
  fill(222, 184, 135);
  stroke(222, 184, 135);
  rect(100, h/2, 30, 30);
  rect(400, h/2, 30, 30);
  fill(0, 191, 255);
  stroke(0, 191, 255);
  ellipse(100, h/2, 30, 30);
  ellipse(400, h/2, 30, 30);
  fill(245, 245, 220);
  stroke(245, 245, 220);
  rect(100, h/2, 30, 6);
  rect(100, h/2, 6, 30);
  rect(400, h/2, 30, 6);
  rect(400, h/2, 6, 30);
  
  //draw the door
  fill(0);
  stroke(0);
  ellipse(w/2, (h/2)-26, 150, 150);
  fill(yellow);
  stroke(yellow);
  ellipse(w/2, (h/2)-26, 140, 140);
  fill(0);
  stroke(0);
  ellipse(w/2, (h/2)-26, 15, 15);
  //line(w/2, 149, w/2, 299);
}


