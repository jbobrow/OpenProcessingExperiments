
void setup() {
  background(255);
  size(1000, 1000); //sets the canvas to 1000 by 1000 pixels
}
float angle = 0; //sets the initial position of the circle
float speed = 0.1; //sets the speed of rotation
int radius = 100; //sets the distance between the smaller and bigger circles

//defines the function circle and sets parameter angle
void circle(float angle) {
  float x = mouseX + sin(angle) * radius; // sets the x coordinate to be (radius) units away from the position of mouseX 
  float y = mouseY + cos(angle) * radius; // sets the y coordinate of the circle to be (radius) units away from the position of mouseX 
  fill(random(255), random(255), random(255)); // sets the color of the ellipse to a random color
  ellipse(x, y, 50, 50); // draws an ellipse based on the variables x and y, where x represents the x coordinate of the circle while y represents the y coordinate of the circle 
  angle = angle + speed; // moves the circle
}

void draw() {
//if the mouse is pressed, then a white layer will cover the original, making it appear as if the background was resetted
if (mousePressed) {   
background(255);
  }
  strokeWeight(5); //thickens the stroke of the line  
//a loop that repeats once 
for (float i=width/3; i<width; i+= width/3) { 
    line(i, 0, i, height); //draws a line
  }
  ellipse(mouseX, mouseY, 100, 100); //draws an ellipse that follows the mouse
  circle(angle + HALF_PI);//draws an ellipse to the right relative to the center circle
  circle(angle + PI);//draws an ellipse to the top relative to the center circle
  circle(angle + 1.5 * PI);//draws an ellipse to the left relative to the center circle
  circle(angle); //draws an ellipse on the bottom relative to the center circle
  //Creates a condition to test whether the x coordinate of the mouse is less than ⅓ of the width or greater than ⅔ of the width. The speed will increase by 0.1 if the width is less than ⅓ of it and increase by 0.5 if the width is greater than ⅔ of the width. If neither condition is true, the speed will increase by 0.2
if (mouseX<=width/3) {     
speed = speed + 0.1; // increase speed by 0.1
    angle = angle + speed;
  } else if (mouseX>=width * 2/3) {
    speed = speed + 0.5; //increases speed by 0.5
    angle = angle + speed;
  } else {
    speed = speed + 0.2; // increases speed by 0.2
    angle = angle + speed;
  }
  speed= 0.1; //resets speed back to 0.1
}




