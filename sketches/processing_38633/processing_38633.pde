
// Annelie Berner, Assignment for ICM with Chris Kairalla at ITP

int x = 20;
int y = 200;
int xSpeed = 2; // if only I could find a way to make the clocky go faster when the x and y get bigger
int ySpeed = 2;
int ellipseRadiusX = mouseX/2;
int ellipseRadiusY = mouseY;

void setup() {
  size (500, 500);
  smooth();
}


void draw() {
  background (255);
  x = x + xSpeed;
  y = y + ySpeed;
  if (x > width || x < 0) { // are we out of bounds?
    xSpeed = xSpeed *-1; //reverse direction of x
  } 
  if (y > height || y < 0) {// are we out of bounds?
    ySpeed = ySpeed *-1; //reverse direction of y
  } 
  
  
rectMode(CENTER);
ellipseMode(CENTER);

     //draw rectangle clock face is in
   stroke (0);
 fill(0);
  rect (x, y, mouseX, mouseY);
  
  //draw clock face
   fill(255);
  ellipse (x, y, mouseX/2, mouseY);
  
  //draw center ball of clock face
  fill (255,0,0);
  ellipse (x, y, 10, 10); // a little ball that tries to follow time or does time try to follow it?
  
  //draw short first hand
  stroke (0);
  line (x, y, mouseX-200, mouseY-200);
  
  //draw minute hand
  stroke(0);
  line (x, y, mouseX/4, mouseY); 
  
  //draw red second hand
  stroke(255,0,0);
  line (x, y, mouseX, mouseY);
  
  
  //draw chronological lines on clock how???
  stroke (255,0,0);
  line (x-mouseX/4, y, x-mouseX/4+10, y);
  line (x+mouseX/4, y, x+mouseX/4-10, y);
  line (x, y-mouseY/2, x, y-mouseY/2+10);
  line (x, y+mouseY/2, x, y+mouseY/2-10);  
  

  
  
}
    

