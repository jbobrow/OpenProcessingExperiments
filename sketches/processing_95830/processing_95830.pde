
void setup() {                                  //  Execute when the program begins.
  size(400, 400);                               //  Size of window.
  
  
}

  int x = 0;                                    // Setting the value of X to 0.
  int speed = 1;                                // Setting the starting value of "speed" to 1. 

void draw() {
  background(255, 255, 255);                    // Set background colour to white. 
  stroke(0);
  
  smooth();                                     // Smooth changes the quality of the ellipse, giving it a more     rounded appearnce instead of edges. 
  
  line(200, 0, 200, 400);                       //  Position of line Horizontal 
  line(0, 200, 400, 200);                       //  Position of line Vertical

                                                // X = The position of the mouse in the X axis
                                                // Y = The position of the mouse in the Y axis
                                                // The position of these will decide which box's colour shows up. 
  
  {
 
   x = x + speed;                               // x = x + speed means that the x value will add speed (1) 

  if ((x > width) || (x < 0)) {                 // This sets up wall for the ball to bounce off (or so it seems)
                                                // It is really just taking away 1 instead of adding one when it reaches the edge
  
    speed = speed * -1;
  }

  
  stroke(0);  
  fill(0,255,100);                              //  This section creates the ellipse that moves across the screen.
  
  ellipse(x,200,40,40);                         //  X position of ellipse. As for this, it is half way down the screen. 
}
  
  
  if (mouseX < 200 && mouseY < 200) {           //  If position of mouse enters here do the following.
    fill(250, 250, 0);                          //  Rectangle 1 colour in RGB
    rect(0, 0, 200, 200);                       //  Size & Position of rectangle 1
  } 
  else if (mouseX > 100 && mouseY < 200) {
    fill(200, 0, 100);                          //  Rectangle 2 colour in RGB
    rect(200, 0, 200, 200);                     //  Size & Position of rectangle 2
  } 
  else if (mouseX < 200 && mouseY > 100) {
    fill(0, 100, 200);                          //  Rectangle 3 colourin RGB
    rect(0, 200, 200, 200);                     //  Size & Position of rectangle 3
  } 
  else if (mouseX > 200 && mouseY > 200) {
    fill(0, 200, 100);                          //  Rectangle 4 colour C
    rect(200, 200, 200, 200);                   //  Size & Position of rectangle 4
  }
}
