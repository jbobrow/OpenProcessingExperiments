
//based on 
// Learning Processing
// Daniel Shiffman
// Example 5-2: More conditionals
//IS
// Three variables for the background color.
float r = 0;
float b = 0;
float g = 0;

void setup() {
  size(400,400);
}

void draw() {
  // Color the background and draw lines to divide the window in quadrants.
  background(r,g,b);  
  stroke(255);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  
  // If the mouse is on the right hand side of the window, increase red.  
  // Otherwise, it is on the left hand side and decrease red.
  if (mouseX > width/2) {
    r = r + 1; 
  } else {
    r = r - 1;
  }
  
  // If the mouse is on the bottom of the window, increase blue.  
  // Otherwise, it is on the top and decrease blue.
  
  if (mouseY > height/2) {
    b = b + 1;
  }else{
    b = b - 1;
  }
  
 //your code goes here

  // If the mouse is pressed (using the system variable mousePressed)
  //set the background to color of your choice
  if (mousePressed) {
    
  background (237, 231, 50);
   
  }  
  
  // Constrain all color values to between 0 and 255.
  //your code goes here
  
  r=constrain(r,0,255);
  b=constrain(b,0,255);
}



