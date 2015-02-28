
int xpos = width/2;
int ypos = height/2;
int xspeed = 4;
int yspeed = 4;

void setup() {
  size(300, 500);
  rectMode(CENTER);
}

void draw() {
  
  background(30);
  
  // If the cube hits the left edge then move it in the other direction
  // Example: if the cube was travelling with a speed of -4, when it hits the left side it changes to +4.
  if (xpos < 0) {
    xspeed = -1*xspeed;
  }
  
  // If the cube hits the right edge then move it in the other direction
  // Example: if the cube was travelling with a speed of +4, when it hits the right side it changes to -4.
  if (xpos > width) {
    xspeed = -1*xspeed;
  }
  
  // If the cube hits the top edge then move it in the other direction
  // Example: if the cube was travelling with a speed of -4, when it hits the top side it changes to +4.
  if (ypos < 0) {
    yspeed = -1*yspeed;
  }
  
  // If the cube hits the bottom edge then move it in the other direction
  // Example: if the cube was travelling with a speed of +4, when it hits the bottom side it changes to -4.
  if (ypos > height) {
    yspeed = -1*yspeed;
  }
  
  // Fill the values of xpos and ypos after running all the if statements
  // The xspeed and yspeed are added to the current x and y position
  xpos = xpos + xspeed;
  ypos = ypos + yspeed;
  // Draw the rectangle using the xpos and ypos
  rect(xpos, ypos, 10, 10);
}
