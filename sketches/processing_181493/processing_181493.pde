
/*
Joanna Ngai
Design 479
Exercise 3: Time
Creates a spinning set of ellipses which form a pattern.

Circular Motion referenced from chapter 7 of 
Getting Started With Processing by Casey Reas and Ben Fry
*/

float currentColor; //declares start color
float destColor; //declares end color
float dampen = 0.9; // declares dampening effect

float angle = 0.0; //declares angle 
float offset = 60; // declares offset
float scalar = 15; //decares scalar 
float speed = 0.05; //declares speed

int halfTime = 30000; //declares int and sets time
int fullTime = 60000; //declares int and sets time

void setup() {
  size(400, 400); //set up canvas
  
  currentColor = 0; // set start color
  destColor = 255; // set end color
}

void draw() {
  int currentTime = millis(); //returns number of time since program started
   
  background(0); //make background black

  currentColor = currentColor + (destColor - currentColor) * dampen; // sets up current color
  
  stroke(currentColor, mouseX, mouseY); //sets stroke color
  fill(currentColor, mouseX, mouseY); //sets fill color
 
  float x = offset + cos(angle) * scalar; //sets up x circular motion
  float y = offset + sin(angle) * scalar; //sets up y circular motion
  ellipse(width/3 + x, height/3 + y, 8, 8); //creates ellipse
  
  stroke(currentColor, mouseX + 60, mouseY + 60); //sets stroke color
  fill(currentColor, mouseX + 60, mouseY + 60); //sets fill color
  
  float a = offset + cos(angle) * (2 * scalar); //sets up a circular motion
  float b = offset + sin(angle) * (2 * scalar); //sets up b x circular motion
  ellipse(width/3 + a, height/3 + b, 8, 8); //creates ellipse
  
  stroke(currentColor, mouseX + 100, mouseY + 100); //sets adjusted stroke color
  fill(currentColor, mouseX + 100, mouseY + 100); //sets adjusted  fill color
  
  float c = offset + cos(angle) * (3 * scalar); //sets up c circular motion
  float d = offset + sin(angle) * (3 * scalar); //sets up d circular motion
  ellipse(width/3 + c, height/3 + d, 8 , 8); //creates ellipse
    
  stroke(currentColor, mouseX + 80, mouseY+ 80); //sets adjusted stroke color
  fill(currentColor, mouseX + 80, mouseY+ 80); //sets adjusted fill color
  
  float e = offset + cos(angle) * (4 * scalar); //sets up e circular motion
  float f = offset + sin(angle) * (4 * scalar); //sets up f circular motion
  ellipse(width/3 + e, height/3 + f, 2 , 2); //creates ellipse
  
  float g = offset + cos(angle) * (5 * scalar); //sets up g circular motion
  float h = offset + sin(angle) * (5 * scalar);  //sets up h circular motion 
  ellipse(width/3 + g, height/3 + h, 2  , 2); //creates ellipse
  
  if (currentTime <= halfTime || currentTime >= fullTime) { //sets up if statement
    speed = speed + 0.0025; //increases speed
    angle = angle + (speed/2); //sets angle 
  } else {
    speed = speed - 0.0025; //decreases speed
    angle = angle - (speed/2); //sets angle
  }  //closes if statement
}


