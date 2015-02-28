
PShape keel, rail, cabin, stack1, stack2, w1, w2, w3;
int X;
int Y;
color bgcolor;
void setup(){
  size(400, 400, P2D);
  bgcolor = color(random(100),random(100), random(100));
  background(bgcolor);
smooth();
 
}
void draw(){
  background(color(mouseY*random(2)),mouseX*random(2), mouseX*mouseY*random(5));
  fill(random(255),random(255),random(255));
  keel = rect(X, Y, 200, 30, 6, 6, 50, 50);
  //rail
  fill(000000);
 rail = rect(X, Y-5, 200, 5, 4, 4, 4, 4);
  //cabin
    fill(random(255),random(255),random(255));
 cabin = rect(X+10, Y-65 , 90, 60, 5, 5, 5, 5);
  //stacks
    fill(random(255),random(255),random(255));
 stack1 =  rect(X +55, Y - 85, 10, 20, 3, 3, 0, 0);
  stack2 = rect(X+70, Y-100, 10, 35, 3, 3, 0, 0);
 fill(bgcolor);
 w1 = rect(X +20, Y-55, 10, 10, 2, 2, 2, 2);
 w2 = rect(X+50, Y-55, 10, 10, 5, 5, 2, 2);
 fill(255);
 w3 = rect(X+15, Y-30, 30, 10, 2, 6, 2, 6);
 
 X = random(width);
 Y = random(height);
}


