
void setup(){
  size(500, 500);
  smooth();
  background(255);
}

void draw(){
  noStroke();
  int x, y;
  background(255);
  x = mouseX;
  y = mouseY;
  fill(255,153,102);
  ellipse(x, y-10, 300, 270);
  fill(255, 51, 0);
  ellipse(x, y, 100, 80);
  ellipse(x-90, y, 80, 100);
  ellipse(x+90, y, 80, 100);
  fill(255);
  rect(x-30, y-20, 15, 15);
  rect(x-90, y-10, 10, 10);
  rect(x+90, y-10, 10, 10);
  fill(0);
  ellipse(x-50, y-60, 30, 40);
  ellipse(x+50, y-60, 30, 40);
  noFill();
  stroke(0);
  strokeWeight(3);
  arc(x-50, y-90, 50, 40, PI, TWO_PI);
  arc(x+50, y-90, 50, 40, PI, TWO_PI);
  arc(x, y+50, 100, 50, 0, PI);
  arc(x, y, 100, 80, 0, TWO_PI);
  arc(x-90, y, 80, 100, PI+PI/2, TWO_PI+PI/2);
  arc(x+90, y, 80, 100, PI/2, PI+PI/2);
  
}


