
int diameter = 80;
int ydistance = diameter/2;
int xdistance = diameter/2;

int speed = 5;
int ydirection = 1;
int xdirection = 1;
int s = 0;

void setup() {
  size(800, 600);
  background(50);
  noStroke();
  fill(252, 232, 243);
}

void draw() {
  colorMode(HSB);
  background(355,61,76);
  fill(355,39,93);
  ellipse(xdistance, ydistance, diameter, diameter);
  fill(#FFF8C4);
  rectMode(CENTER);
  rect(mouseX, height-100, 150, 25);
  //Move me
  ydistance += speed*ydirection;
  xdistance += speed*xdirection;
  text("Score is " + s, 30,30);
 if (ydistance>=height-150 && mouseX-75 < xdistance && xdistance < mouseX+75) {
     ydirection = -ydirection; 
       s=s+1;
  println("paddle"); }

    //Did I hit the bottom?
    if (ydistance > height-diameter/2) {
      ydirection = -ydirection;
      println("bottom");
      
      
    }

    //Did I hit the top?
    if (ydistance < 0+diameter/2) {           
      ydirection = -ydirection;           
      println("top");
    }       

    //Did I hit the right side?       
    if (xdistance > width-diameter/2) {
      xdirection = -xdirection;
      println("right side");
    }

    //Did I hit the left side?
    if (xdistance < 0+diameter/2) {
      xdirection = -xdirection;
      println("left side");
    }
  }


