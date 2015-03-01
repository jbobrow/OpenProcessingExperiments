
color ellFillOn = color(23, 244, 89); 
//this is th color to be used when the mouse is ON the ellipse
color ellFillOff = color(89, 23, 244); 
//this is the color to be used when the mouse is OFF the ellipse
color ellFill; 
//this variable will be the color of the ellipse, we will change its value
 
float across, down;
 
void setup() {
  // runs the code only once
  size(500, 400); 
  //sets canvas size to 500px in width by 400px in height
  across =  50; 
  //sets circles to 50 px in width
  down =  50; 
  //sets circles to 50 px in height
  smooth(); 
  //smoothe it out
}
 
void draw() {
  // runs the code as a loop at the default frame rate
  background(0);
  //sets background color to black
  noStroke();
  //sets it so that there is no stroke 
  for (int i = 0; i < width/across; i++) { 
    //width of the canvas divided by width of the circle gives us the number of objects across
    for (int j = 0; j < height/down; j++) { 
      //same goes for the y axis
      float distance = dist(mouseX - across/2, mouseY - down/2, across * i, down * j); 
      //constantly computing the distance form the cursor/mouse to the center of the circle being drawn
 
      if (distance < across/2) { 
        //check if the distance is less than half the diameter of the circle
        ellFill = ellFillOn; 
        //if so, change the fill 
        println("Over the ellipse.");
      } else {
        ellFill = ellFillOff; 
        //else, use that other color
        println(" ");
      }
      ellipseMode(CORNER);
      //draws ellipse from the corner
      fill(ellFill); 
      //fills ellipse    
      ellipse(i * across, j * down, across, down); 
      //finally draw your ellipse 
    }
  }
}



