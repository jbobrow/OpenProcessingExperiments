
// Allison Etheredge
// Lab 4.3 
// September 19, 2011

void setup() {
  size(400, 400);
  background(0); 
  frameRate(20);
}

// set variables
int x = 1; // sets the primary rotation
int y = 1; // sets the rotation at the radius

void draw() {
  noFill();
  stroke(255, 0, 0); 
  ellipse(width/2, height/2, 300, 300); 

  for (int y = 0; y < 100; y += 1) {
    pushMatrix();
    translate(width/2, height/2);  //move the origin to the center
    rotate(radians(x));     //rotate from the center, convert degrees to radians
    stroke(150, 20); 
    line(0, 0, width, height); 
    translate(200, 0);     //set the radius
    stroke(130, 30);
    line(0, 0, width, height); 
    rotate(radians(y + 45));     //rotate the ellipse about the next axis
    triangle(0, 0, 40, 40, 5, 5);    //draw the ellipse
    popMatrix();

    // increments the rotation
    y+=10;
    x++;
  }
  
  // tops the loop after a designated number of lines have been set
  if (x > 899) { 
    noLoop(); 
  }
}


