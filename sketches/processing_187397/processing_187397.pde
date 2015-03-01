
/*=======================================
Working with Trigonomentry & Functions to Create Fractals
Project #1

Modified 2/26/15
     
Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com
     
Created for Art 3001
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626

This code made possible through research & inspiration from:
"Learning Processing: by Daniel Shiffman 
Chapter 13.8: Trigonometry
Also: Using trigonometry in processing, working with fuctions
Tutorial Credit: https://processing.org/tutorials/trig/
-float x = cos(radians(angle)) * radius;
-float y = sin(radians(angle)) * radius;
     
=======================================*/

int maxFractal = 5; //controls number of branching attributes (accumulates) 
float maxFractalAngle = 90; //angle/spacing of lines
float minFractalLength = 50; //minimum length, proceed from
float maxFractalLength = 170; //maximunm length, will not exceed
 
void setup() {
  size(420, 520); //4200x5200 = 14"x18" print
  stroke(0);
  fill(0);
  strokeWeight(0.5);
  smooth();
}
 
void draw() {
  background(255); //draws bg first, sends to back, draws on top 
  Fractal(width*0,height,-45,10); //branching attributes
  noLoop(); 
}

//setup function 
void Fractal(float X, float Y, float direction, float depth) {
  if (depth <= 0) {
    return; //function returns the constrained value, assigned back to the variable
  }
  
  //Extends the 'if' structure, specifies a block of code to execute when the expression in if is false
  int fractals = int(random(1,maxFractal));
  for (int i = 0; i < fractals; i++) {
    float newFractalAngle = random(direction-maxFractalAngle/2, direction+maxFractalAngle/2);
    if (newFractalAngle >= 330) {
      newFractalAngle -= 330;
    }
    else if (newFractalAngle < 0) {
      newFractalAngle += 330;
    }
   
   
  //Function allows for branching effect
  //Determines the distance between points, randomizes each brancing angle
    float fractalLength = random(minFractalLength, maxFractalLength);
       //randomizes length of each line within fractal branches
    float newX = X+cos(radians(newFractalAngle)) * fractalLength;
       //Calculates the cosine of newFractalAngle
    float newY = Y+sin(radians(newFractalAngle)) * fractalLength;
       //Calculates the sine of newFractalAngle
  //Call for line function  
    line(X, Y, newX, newY);
    Fractal(newX, newY, newFractalAngle, depth-1);
  }
}

//Press mouse to re-randomize drawing 
void mouseClicked() {
  loop();
}

//save image
void keyPressed() {
  saveFrame("RIGHT.tif");
}
