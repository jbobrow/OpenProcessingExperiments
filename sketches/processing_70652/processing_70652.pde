
// Sunday, September 16th of 2012
// Creative Computing; Ben Norsky
// Devon Moscoso - Button.


// I had ... so much trouble trying to figure things out with this things. 
// The book was helpful and so were a lot of people online!

int circle_radius = 0;
int circleX = 0;
int circleY = 100;
boolean OverCircle = false;

void setup() {
  size (500,400);
}

void draw() {
  background (255);
  stroke (0);
  fill (175);
  ellipse (mouseX,mouseY,circle_radius,circle_radius);
  
if (dist (width/2, height/2, mouseX, mouseY) < circle_radius/2) {
    fill (20, 30, 120); 
    OverCircle = true;
  } 
  else {
 
    OverCircle=false;
  }
  if ((mousePressed == true) && (OverCircle == true)) {
    ellipse (mouseX, mouseY, 40, 40);
  }

  
  circle_radius ++;
  
}

