
//load two images
PImage cage; 
PImage cage2;

//declare variables for the first (square) button
int buttonX1; //x position of button
int buttonY1; //y position of button
int buttonSize1; //size of button
int hover1; //used to determine strokeWeight if hover
boolean button1; //the switch that turns the image on/off

//declare variables for the second (circle) button. 
int buttonX2; //x position of button
int buttonY2; //y position of button
int buttonSize2; //size of button
int hover2; //used to determine strokeWeight if hover
boolean button2; //the switch that turns the image on/of

void setup() {

  //load the first image and set the canvas to be the image's width and height
  cage = loadImage("nickcage.jpg"); 
  size(628,340);

  //initialize variables for the square button
  buttonX1 = 10;
  buttonY1 = 10;
  buttonSize1 = 25;
  button1 = false;

  //load the second image
  cage2 = loadImage("cage2.jpg");

  //initialize variables for the circular button
  buttonX2 = 23;
  buttonY2 = 70;
  buttonSize2 = 13;
  button2 = false;

  ellipseMode(RADIUS); //change the ellipse mode to radius (better to find distance)
}

void draw() {
  
  background(255); //every frame we will cover the background with white

  //this conditional checks to see if the "switch" for the first image is on or off
  if (button1 == true) {
    image(cage, 0, 0); //if button is set to TRUE, draw the image
  }
  
   //this conditional checks to see if the "switch" for the second image is on or off
  if (button2 == true) {
    image(cage2, 0, 0); //if button is set to TRUE, draw the image
  }
  
  //this conditional checks to see if the mouse is touching the square button. AKA hover
  if (mouseX > buttonX1 && mouseX < buttonX1+buttonSize1 && 
    mouseY > buttonY1 && mouseY < buttonY1+buttonSize1) {
    hover1 = 5; //if hovering, change the variable for strokeWidth to 5
  }
  
  else {
    hover1 = 1; //if not hovering, leave the strokeWidth at 1
  }
  
  strokeWeight(hover1); //Change the stroke weight depending on the hover

  //if the square button is clicked, draw a red button.
  if (button1 == true) { 
    fill(255, 0, 0);
    rect(buttonX1, buttonY1, buttonSize1, buttonSize1);
  }
  
  //if it is not clicked, draw a white button.
  else {
    fill(255);
    rect(buttonX1, buttonY1, buttonSize1, buttonSize1);
  }
  
  
  //find the distance from the mouse to the center of the circle button
  float d = dist(mouseX, mouseY, buttonX2, buttonY2);

  //if this distance is less than the radius of the circle button (inside the circle)
  if (d < buttonSize2) {
    hover2 = 5; //if hovering, change the variable for strokeWidth to 5
  }
  else {
    hover2 = 1; //if not hovering, leave the strokeWidth at 1
  }

  strokeWeight(hover2); //Change the stroke weight depending on the hover
  
  //if the circle button has been clicked, make it green
  if (button2 == true) {
    fill(0, 255, 0);
    ellipse(buttonX2, buttonY2, buttonSize2, buttonSize2);
  }
  
  //if the circle button has not been clicked, make it white
  else {
    fill(255);
    ellipse(buttonX2, buttonY2, buttonSize2, buttonSize2);
  }
}


//use mouseClicked to run code whenever the user clicks the mouse.
//unlike the draw() function, this code will only run whenever Processing detects a mouse click
void mouseClicked() {
  //check to see if the user has clicked inside the boundaries of the square button
  if (mouseX > buttonX1 && mouseX < buttonX1+buttonSize1 && 
    mouseY > buttonY1 && mouseY < buttonY1+buttonSize1) {
    button1 = !button1; //change from TRUE to FALSE, or from FALSE to TRUE. (flip the switch on or off)
  }

  //find the distance between the mouse and the center of the circle button.
  //use this method because a circle does not have four sides like the square
  float d = dist(mouseX, mouseY, buttonX2, buttonY2);

  //if the distance from the mouse to the circle is less than the radius (inside the circle)
  if (d < buttonSize2) {
    button2 = !button2; //change from TRUE to FALSE, or from FALSE to TRUE. (flip the switch on or off)
  }
}



