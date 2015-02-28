
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: Seo Yu Mi
 // ID: 201420082 Seo Yu Mi
 
float xPos;
float destination;
float diameter = 70;
float x=0;
float y=0;
float xSpeed = 5;
float ySpeed = 3;

void setup () {
  size(600, 600);
  smooth ();
  
  xPos = 0;
    destination = width + diameter * 3;
}

void draw () {
  background (#FFFFFF);
  noStroke();
  
  x=xSpeed;
  y=ySpeed;
  
if ((x > width) || (x < 200)) {
  xSpeed=xSpeed*-1;
  }
   if ((y > height) || (y < 50)) {
     ySpeed=ySpeed*-1;
  }

  float distance = destination - xPos;

  xPos = xPos + distance / 60;
  if (xPos > width + diameter) {
    xPos = -diameter;
  }

  fill(random(255), random(255), random(255), 150);
  ellipse (xPos, height / 4, diameter, diameter);
  fill(255);
  ellipse(xPos, height/4,diameter-35,diameter-35);
  fill(#FFDA74);
  quad(x,y,width-x,height-y,0,width-x,height-y,0);
}


