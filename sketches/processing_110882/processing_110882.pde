
//53463247 Young Hiu Ting Assignment 2

float colorR, colorG, colorB, alpha; //declare colorR, colorG, colorB and alpha are floating-point numbers
PFont font; //locate the font in the sketch

void setup() {
  //background setting
  size (600,600);
  background (255);
  frameRate (10);
  
  font=loadFont("Monospaced-20.vlw"); //Create Font
  textAlign(CENTER); //make the align point of the font to be center
  textFont(font, 32); //set font size
  
  noStroke();
  smooth();
}

void draw() {
  //set the variables of x and y, and draw the square repeatedly until the screen is full of square
  int dx = 60, dy = 60;
  for (int y = 0; y <= 600-60; y = y + dy){
    for (int x = 0; x <= width - 60; x = x + dx){
      rect (x, y, 60, 60);
      
      //set the colors to be random values
      colorR = random(255);
      colorG = random(255);
      colorB = random(255);
      alpha = random(255);
      
      ellipse (300, 300, mouseX, mouseX); //draw a circle on the middle of the screen, can scale the circle when the mouse is moving around 
      
      fill (255); //set font color
      text("CLICK", 300, 300); //the text will be shown on the middle of the screen
 
      
      if (mousePressed == true){
        fill(colorR, colorG, colorB, alpha); //it would be full of color when the mouse button is pressed
      } else {
        fill (alpha); //set the color to black and white when the mouse is not pressed
      }
    }
  }
}


