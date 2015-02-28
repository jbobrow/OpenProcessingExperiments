
float cirR; // Declare a variable named cirR
float cirG; // Declare a variable named cirG
float cirB; // Declare a variable named cirB

int v = 0;  // Set a variable named v to the value of 0
int x = 50; // global variable for location 
int speed = 1; // variable for ball's speed. When (+) it moves right, when (-) it moves left


void setup() {
  size(200,200); // Size of sketch window
  smooth(); // Smooth edges

}

void draw() { 
  background(255); // White background 
  
  // Left Wall
  stroke(0); // Black outline
  fill(x); // set colour in relation to the ball's position on x. 
  rect(12,36,20,80); // Coordinates and size 
 
 // Right Wall
  stroke(0); // Black outline
  fill(v,x); // set colour in relation to the ball's position on x and to the vaule of v. 
  rect(168,36,20,80); // Coordinates and size

  
   
   // Display circle at x location
   
  stroke(0); // Black outline 
   cirR = random(255); // Declare the variables cirR a random vaule between 0 and 255
   cirG = random(255); // Declare the variables cirR a random vaule between 0 and 255
   cirB = random(255); // Declare the variables cirR a random vaule between 0 and 255
  
  fill(cirR,cirG,cirB); // Random colour fill
   
  ellipse(x,100,32,32); // moves along the x-axis from 50 to 150 and is 100y down. Its size is 32 by 32.
}

 void mouseClicked() { // Adds 1 to the x axis of the ball everytime the mouse is clicked. 

  
  x = x + speed; // Add the current speed to the x location i.e move by 1 pixel to the right on each cycle through Draw()
  
  if ((x > 150) || (x < 50)) { // starts at point 50x and ends at point 150x.
    speed = speed * -1; // Reversing the polarity by multiplying by -1
   
 }
  }
