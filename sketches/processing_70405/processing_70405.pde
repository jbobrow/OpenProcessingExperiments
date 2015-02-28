
int circle_X = 200;

void setup(){
  size(500, 500);
};
void draw(){
background(200);
  fill(100, 30, 40, 25);
  ellipse (circle_X, 250, 100, 100);
  circle_X = circle_X + 2;
  //fill(40, 60, 100, 30);
  //ellipse(mouseX, mouseY, 100, 100);
 

//println(mouseX);
};
