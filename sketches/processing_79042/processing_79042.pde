
int x = 0; // setting global variables for sketch
int y = 130;
int speed = 3; 


void setup() { //setting the window size 350 X 350 pixels and adding smooth animation
  size(350,350);
  smooth();
  
}

void draw() { // set void draw to loop the sketch 
  background(0); // the background set to black
  move();  // set functions for move bounce and display
  bounce();
  display();
  
 
}

void move() {  // the speed of the balls are determined 
  x = x + speed;
  y = y + speed;
}



void bounce() { 
  
  if(( y > height) || ( y < 0))   // tells processing to reverse the polarity of the moving shapes to 
  
                                   // allow them to change direction when they reach the edges of the sketch window
  if (( x > width) || (x < 0)) {
    speed = speed * -1;
  }
}

 void display() {
  stroke(255);   // sets the display up to have a white stroke when the mouse position moves
  fill(255,0,0); // fill of the square and circle to red
  strokeWeight(12); // stroke wieght is enlarged 
 
  
if(mouseX > width/2 && mouseY > height/2) //if the mouseX position is less than half the width and half the hieght of the sketch window 
  ellipse(x,40,40,40);                    // draw a stroke of 12 around the red circle
 

 
  
if(mouseX < width/2 && mouseX < height/2) // makes the red square appear when the mouse is placed in the top right of the sketch window
 
  noStroke();
  rect(x,150,55,55); // sets no stroke to the square and ellipse unless the mouse is placed on the bottom right of the window
  
  
  if(mouseX > width/2 && mouseY < height/2) // if mouse is position over the top right side of the screen
                                        // change the colour of the ball from red to blue 
  fill(0,220,220); //sets the blue for the circle
 ellipse(x,250,50,50); //set the location and size for the circle
 
 if (mouseY > height/2 && mouseX < width/2)
 background(50,0,150);    // if the mouse position is on the lower left and side of the screen change the background to blue
 fill(35,90,0); //sets the fill for the squares and circles to green
 ellipse(x,310,y,40); // draws another circle at the bottom of the screen that changes size along the length of the Y axis
 rect(10,x,20,20); // first square going along the y axis 
 rect(30,y,x,30); //second rect changing length
  
 }
  




