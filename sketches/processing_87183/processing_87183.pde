
// Ethan Frier
// homework 4 - user input 2
// copywrite 2013

/*
Circle follows the mouse cursor. 
When the mouse is clicked the circle flashes a random color. 
Use 'l' key to make circle bigger and 'a' key to make it smaller
*/


float x, y;
float x1, y1;
float newx1, newy1;
float follow;


void setup() {
  
  size(400, 400);
  smooth();
  noStroke();
  background(255);
  
  x1 = 20;
  y1 = 20;
  
  follow = .05;
  
}


void mousePressed() {
 
 // when the mouse is clicked teh circles flashes a random fill color
 fill(random(0, 255), random(0, 255), random(0, 255));
 ellipse(x, y, x1, y1);
  
}


void draw() {
  
 // circle with no fill and black stroke follows the mouse
  
 fill(255, 5); 
 rect(0, 0, width, height);
  
 fill(255, 1); 
 stroke(200);
 ellipse(x, y, x1, y1); 
 
 float distX = mouseX - x;
 float distY = mouseY - y;

 x = x + (distX * follow);
 y = y + (distY * follow); 
  
}


void keyPressed() {
  
  if (key == 'l') // when 'l' key is pressed, circle diam grows by 10 px
  {   
    x1 = x1 + 10;
    y1 = y1 + 10;
  }
  
    if (key == 'a') // when 'a' key is pressed, circle diam shrinks by 10 px
  {  
    x1 = x1 - 10;
    y1 = y1 - 10;  
  }
  
}



