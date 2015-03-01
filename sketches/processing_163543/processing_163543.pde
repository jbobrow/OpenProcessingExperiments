
int diameter = 40;
int ydistance = diameter/2;
int xdistance = diameter/2;
int addscore = 0;
 
int speed = 5;
int ydirection = 1;
int xdirection = 1;
 
void setup() {
  size(800, 600);
  background(50);
  fill(random(150), 150, 220);
}
 
void draw() {
  background(225,225,18);
  stroke(255,255,255);
  ellipse(xdistance, ydistance, diameter, diameter);
 
  rectMode(CENTER);
  rect(mouseX, height-100, 200, 20);
 
  //Move me
  ydistance += speed*ydirection;
  xdistance += speed*xdirection;
 
  //Did I hit the bottom?
  if (ydistance > height-diameter/2) {
    ydirection = -ydirection;
    println("I hit the bottom");
  }
 
  //Did I hit the top?
  if (ydistance < 0+diameter/2) {           
    ydirection = -ydirection;           
    println("I hit the top");   
  }       
 
  //Did I hit the right side?       
  if (xdistance > width-diameter/2) {
    xdirection = -xdirection;
    println("I hit the right side");
  }
 
  //Did I hit the left side?
  if (xdistance < 0+diameter/2) {
    xdirection = -xdirection;
    println("I hit the left side");
  }
  
  //Did I hit the bar?
  if (xdistance < mouseX + 100 && xdistance > mouseX - 100 && ydistance == height-110)
  {
    ydirection = -ydirection;
  }
 
  //counter
  text("what is your score? " + addscore, width/2, height/3);
  if (xdistance < mouseX + 100 && xdistance > mouseX - 100 && ydistance == height-110)
  {
  addscore = addscore + 1;
  
 
  }
}

