
//Tangly Lines and Splotches
//This project is a dynamic sketch that allows the user...
//... to create a variety of textures from masses curved lines...
//...and splotches (made from tiny iterations of a photograph)
//This sketch uses both mouse and keyboard input.

//A detailed description of the project is included in my documentation

//INSTRUCTIONS FOR INTERACTING WITH THE SKETCH...


//Press and hold the mouse to draw.

//Use keys 'w', 'e', 'r' and 't' to change colors.
//Use keys 'y', 'u', 'i', and 'o' to rotate (changing angle of lines)
//Press 'z' to turn on photo "splotches" and 'x' to turn them off.
//Press 'q' to clear the screen
//Press 's' to save a screenshot.

//For best results, drag mouse back and forth repeatedly in various...
//...parts of the screen, then change color and rotation and repeat.
//Doing this multiple times will create dense and rich textures.



//Global variables

float strokeweight;
float rotate;
int tint;

//PImage variables

PImage orange;
PImage garden;

//setup()

void setup() {
  size(900, 700); 
  colorMode(HSB, 360, 100, 100);
  background(200);
orange = loadImage("Orange.jpg");
 garden = loadImage("garden.jpg");
      tint(255, 35);
   image(orange, 0, 0);
   tint(255, 12);
   image(garden, 0, 0);
   
   strokeweight = 0.01;
   rotate = 1;
}

//draw()

void draw() {
  pushMatrix();
  //key control for rotation
   if (key == 'y' || key == 'Y')rotate = 0.01;
   if (key == 'u' || key == 'U')rotate = 0.3;
   if (key == 'i' || key == 'I')rotate = 6;
   if (key == 'o' || key == 'O')rotate = 7;
  rotate(rotate);
  
  
  //drawing the lines (actually ellipses that exceed canvas size)
  if (mousePressed) {
      for (int i = 0; i < 40; i +=5) { 
        drawLine(i * 3, random(2, 11), random(1, 7), random(3, 6));
       //drawing the "splotches" using tiny photos from my garden
       if (key == 'z' || key == 'Z')tint = 120;
      if (key == 'x' || key == 'X')tint = 0;  
        tint (255, tint);
        image(garden, random (900), random(0, 700), random(15), random(15));
      
      }  
  }
  popMatrix();
}


//drawLine()
//these are really ellipses that mostly exceed bounds of the canvas.
//so...they appear as curved lines

void drawLine(float x, float y, float m, float n) {
  strokeWeight(strokeweight);

//Keyboard input to control stroke color
  if (key == 'w' || key == 'W')stroke(random(10, 205), random(100, 205), random(90, 199));
  if (key == 'e' || key == 'E')stroke(random(80, 285), random(1, 60), random(1, 30));
  if (key == 'r' || key == 'R')stroke(random(254, 299), random(4, 80), random(130, 180));
  if (key == 't' || key == 'T')stroke(random(27, 50), random(1, 200), random(70, 101));

//the ellipses
noFill();
  ellipse(x + mouseX/1, y + mouseX/3, mouseX * m, mouseY * n);
}


//Keyboard input to clear background and to save screenshot

void keyPressed() {
  if (key == 'q' || key == 'Q') background(200);
  if (key=='s' || key=='S') saveFrame("screenshot.png");
  
}



