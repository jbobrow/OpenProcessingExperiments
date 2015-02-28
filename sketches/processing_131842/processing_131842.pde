
//global variables

int circleOpac = 255;
int redValue = 0;
int greenValue = 255;
int blueValue = 0;

void setup() {  //setup function called initially, only once
  size(500, 500);
  
}

void draw() {  //draw function loops 
  background(255);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 300, 300);
  
  //mouse controls opacity -- make sure you limit the values to an acceptable RGB range 0-255
  circleOpac = map(mouseX, 0, width, 0, 255);
  
  //mouse controls the green value -- set to the y values and limited to values between 0-255
  greenValue = map(mouseY, 0, height, 0, 255);
  
  //set the fill to the new values
  fill(redValue, greenValue, blueValue, circleOpac);
}

void mouseClicked() {
    //set the red value randomly when the mouse is clicked, make sure the random value is rounded to a whole number
    
    //redValue = floor(random(255));
    //blueValue = floor(random(255));
}
