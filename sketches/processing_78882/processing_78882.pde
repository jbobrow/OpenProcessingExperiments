
// Creative Coding 1
  // Assignment 2: Create a Dynamic Sketch

// Initiating & Declaring Global Variables:
int rectX = 0; // initial x co-ordinate of one of the '4x4' rectangles that fill the sketch window
int rectY = 0; // initial y co-ordinate of one of the '4x4' rectangles that fill the sketch window
int rectW = 150; // width of each '4x4' rectangle
int rectH = 125; // heigth of each '4x4' rectangle
int rectSpacX = 150; // x co-ordinate spacing between each of the '4x4' rectangles
int rectSpacY = 125; // y co-ordinate spacing between each of the '4x4' rectangles

float r = 0; // Variable determining the r-value (red) within RGB colour value initially set to 0
float g = 0; // Variable determining the g-value (green) within RGB colour value initially set to 0
float b = 0; // Variable determining the b-value (blue) within RGB colour value initially set to 0

boolean button1 = false; // Boolean variable representing the top-left interactive 'button' initially set to "false" (off) 
boolean button2 = false; // Boolean variable representing the top-right interactive 'button' initially set to "false" (off) 
boolean button3 = false; // Boolean variable representing the bottom-left interactive 'button' initially set to "false" (off) 
boolean button4 = false; // Boolean variable representing the bottom-right interactive 'button' initially set to "false" (off) 

int triX1 = 275; // 1st Variable x co-ordinate for the horizontal-moving triangle within the top-left button (button1)
int triY1 = 225; // 1st Variable y co-ordinate for the horizontal-moving triangle within the top-left button (button1)
int triX2 = 300; // 2nd Variable x co-ordinate for the horizontal-moving triangle within the top-left button (yutton1)
int triY2 = 200; // 2nd Variable y co-ordinate for the horizontal-moving triangle within the top-left button (button1)
int triX3 = 300; // 3rd Variable x co-ordinate for the horizontal-moving triangle within the top-left button (button1)
int triY3 = 250; // 3rd Variable y co-ordinate for the horizontal-moving triangle within the top-left button (button1)

float triX4 = 250; // 1st Variable x co-ordinate for the vertical-moving triangle within the top-left button (button1)
float triY4 = 250; // 1st Variable y co-ordinate for the vertical-moving triangle within the top-left button (button1)
float triX5 = 275; // 2nd Variable x co-ordinate for the vertical-moving triangle within the top-left button (button1)
float triY5 = 225; // 2nd Variable y co-ordinate for the vertical-moving triangle within the top-left button (button1)
float triX6 = 300; // 3rd Variable x co-ordinate for the vertical-moving triangle within the top-left button (button1)
float triY6 = 250; // 3rd Variable y co-ordinate for the vertical-moving triangle within the top-left button (button1)

float triX7 = 250; // 1st Variable x co-ordinate for the diagonal-moving triangle within the top-left button (button1)
float triY7 = 250; // 1st Variable y co-ordinate for the diagonal-moving triangle within the top-left button (button1)
float triX8 = 300; // 2nd Variable x co-ordinate for the diagonal-moving triangle within the top-left button (button1)
float triY8 = 200; // 2nd Variable y co-ordinate for the diagonal-moving triangle within the top-left button (button1)
float triX9 = 250; // 3rd Variable x co-ordinate for the diagonal-moving triangle within the top-left button (button1)
float triY9 = 200; // 3rd Variable y co-ordinate for the diagonal-moving triangle within the top-left button (button1)

int savMouseX = -1; // Variable x co-ordinate to save mouse's X co-ordinate within spider-web design in button2. Inititally set to -1 as 0 can be achieved through position (0,y)
int savMouseY = -1; // Variable y co-ordinate to save mouse's Y co-ordinate within spider-web design in button2. Inititally set to -1 as 0 can be achieved through position (x,0)

// Within 'void setup' only the following process(es) shall be processed once:
void setup () {
  size(600,500); // Dimensions of sketch window are 600px by 500px 
  frameRate(30); // Frame rate set to 30 to ease randomisation of colour within 4th quadrant (bottom-right main rectangle)
}

// Within 'void draw' the following process(es) shall be processed continously with no specification:
void draw () {
  background(r,g,b); // Background's colour defined by int. variables r,g,b representing red, green and blue respectively

// Drawing of buttons (initial appearance)
strokeWeight(3); 
stroke(255); // White outline
fill(200,50); // Very light-grey very transparent fill
rectMode(CORNERS);
rect(150,125,300,250); // Top-left semi-transparent rectangular 'button1'
rect(450,125,300,250); // Top-right semi-transparent rectangular 'button2'
rect(150,375,300,250); // Bottom-left semi-transparent rectangular 'button3'
rect(450,375,300,250); // Bottom-right semi-transparent rectangular 'button4'

// Drawing of 4x4 rectangles (created via. 'for' loop)
  // Initial Attributes:
strokeWeight(1);
stroke(0); // Thin, Black stroke
noFill(); // No Fill
rectMode(CORNER);
  // Construction:
for (int rectY = 0; rectY <= height-rectSpacY; rectY=rectY+rectSpacY) {
  rect (rectX, rectY, rectW, rectH); // Left-most column of 4 rectangles
  rect (rectX+rectSpacX,rectY,rectW,rectH); // 2nd from left column of 4 rectangles
  rect (rectX+(rectSpacX*2),rectY,rectW,rectH); // 2nd from right column of 4 rectangles
  rect (rectX+(rectSpacX*3),rectY,rectW,rectH); // Right-most column of 4 rectangles
  }

// Drawing of right-angle triangles within center of sketch window
noStroke();
fill(255,0,0);
triangle(250,250,300,250,300,200); // Top-left triangle (red)
fill(0,255,0);
triangle(300,200,300,250,350,250); // Bottom-left triangle (blue)
fill(0,0,255);  
triangle(250,250,300,250,300,300); // Top-right triangle (green)
fill(random(255),random(255),random(255));
triangle(300,300,300,250,350,250); // Bottom-right triangle (random colour)

// Drawing of quadrant dividers (2x2 lines)    
strokeWeight(5);
stroke(0,150);
line(300,0,300,500); // Vertical thick, black semi-transparent line 
line(0,250,600,250); // Horizontal thick, black semi-transparent line 

// Defining areas of RGB change based on mouse cursor's position
if(mouseX < width/2 && mouseY < height/2) { // If the mouse cursor is located within the 2ndt quadrant (top-left) the following process(es) will commence:
r = r+2; // r (red) increments by "2" within the background
} else { 
r = r; // r remains its value
} if(mouseX > width/2 && mouseY < height/2) { // If the mouse cursor is located within the 1st quadrant (top-right) the following process(es) will commence:
g = g+2; // g (green) increments by "2" within the background
} else {
g = g; // g remains it's value
} if (mouseX < width/2 && mouseY > height/2) { // If the mouse cursor is located within the 3rd quadrant (bottom-left) the following process(es) will commence:
b = b+2; // b (blue) increments by "2" within the background
} else {
b = b; // b remains its value
} if (mouseX > width/2 & mouseY > height/2) {  // If the mouse cursor is located within the 4th quadrant (bottom-right) the following process(es) will commence:
  r = random(255); // float variable 'r' (red) will generate a random value from "0" to "255"
  g = random(255); // float variable 'g' (green) will generate a random value from "0" to "255"
  b = random(255); // float variable 'b' (blue) will generate a random value from "0" to "255"
} else {
} if (r >= 255 && g >= 255 && b >= 255) { // Else if r (red) & g (green) & b (blue) are all equal to (or greater than) "255" then the following process(es) will commence:
r = 0; // r (red) value returns to "0"
g = 0; // g (green) value returns to "0"
b = 0; // b (blue) value returns to "0"
}

// Button Roll-overs - Top-left (button1)
  // When the mouse cursor 'rolls over' the top-left button (button1) the button's fill becomes semi-transparent white else it remains its default attributes
if (mouseX > 150 && mouseX < 300 && mouseY > 125 && mouseY < 250) { 
fill(255,225);
rect(150,125,150,125);
} else {
}
// Button Roll-overs - Top-right (button2)
  // When the mouse cursor 'rolls over' the top-right button (button2) the button's fill becomes semi-transparent white else it remains its default attributes
if (mouseX > 300 && mouseX < 450 && mouseY > 125 && mouseY < 250) {
fill(255,225);
rect(300,125,150,125);
} else {
}
// Button Roll-overs - Bottom-left (button3)
  // When the mouse cursor 'rolls over' the bottom-left button (button3) the button's fill becomes semi-transparent white else it remains its default attributes
if (mouseX > 150 && mouseX < 300 && mouseY > 250 && mouseY < 375) {
fill(255,225);
rect(150,250,150,125);
} else {
}
// Button Roll-overs - Bottom-right (button4)
  // When the mouse cursor 'rolls over' the bottom-right button (button4) the button's fill becomes semi-transparent white else it remains its default attributes
if (mouseX > 300 && mouseX < 450 && mouseY > 250 && mouseY < 375) {
fill(255,225);
rect(300,250,150,125);
} else { 
}

// Defining Top-left button (button1):
if (button1) { // If 'button1' is true (pressed) the following process(es) will commence:
  fill(0,200);
  noStroke();
  rect(150,125,150,125); // button1's appearance changes to having a slightly transparent black fill with no stroke to represent being pushed/activated
    strokeWeight(2);
    stroke(0);
    fill(255,0,0);
      triangle(triX1,triY1,triX2,triY2,triX3,triY3); // Creation of horizontal red triangle with black stroke that loops around 2nd quadrant (top-left) from right edge of quadrant to left
      triX1 = triX1 - 5;
      triX2 = triX2 - 5;
      triX3 = triX3 - 5;
        if(triX1 < -25) { // When horizontal triangle's 1st x co-ordinate reaches less than -25, it will return to it's original variable values causing the infinite loop until the button is de-activated
          triX1 = 275;
          triY1 = 225;
          triX2 = 300;
          triY2 = 200;
          triX3 = 300; 
          triY3 = 250;
   } triangle(triX4,triY4,triX5,triY5,triX6,triY6); // Creation of vertical red triangle with black stroke that loops around 2nd quadrant (top-left) from bottom edge of quadrant to top
     triY4 = triY4 - 4.6;
     triY5 = triY5 - 4.6;
     triY6 = triY6 - 4.6;
        if(triY4 < -25) {  // When vertical triangle's 1st y co-ordinate reaches less than -25, it will return to it's original variable values causing the infinite loop until the button is de-activated
          triX4 = 250;
          triY4 = 250;
          triX5 = 275;
          triY5 = 225;
          triX6 = 300;
          triY6 = 250;
   } triangle(triX7,triY7,triX8,triY8,triX9,triY9); // Creation of diagonal red triangle with black stroke that loops around 2nd quadrant (top-left) from bottom-right corner of quadrant to top-left
      triX7 = triX7 - 4.5;
      triY7 = triY7 - 3.6;
      triX8 = triX8 - 4.5;
      triY8 = triY8 - 3.6;
      triX9 = triX9 - 4.5;
      triY9 = triY9 - 3.6;
        if(triX7 < -25) { // When diagonal triangle's 1st x co-ordinate reaches less than -25, it will return to it's original variable values causing the infinite loop until the button is de-activated
         triX7 = 250;
         triY7 = 250;
         triX8 = 300;
         triY8 = 200;
         triX9 = 250;
         triY9 = 200;
        }    
} else {
  button1 = false;
}

// Defining Top-right button (button2):
if (button2) { // If 'button2' is true (pressed) the following process(es) will commence:
  fill(0,200);
  noStroke();
  rect(300,125,150,125); // button2's appearance changes to having a slightly transparent black fill with no stroke to represent being pushed/activated
  smooth();
  if (mouseX > width/2 && mouseX < width && mouseY > 0 && mouseY < height/2) { // If the mouse cursor is located within the 2nd quadrant (top right) then:
     stroke(0,abs(g-50),0); // Stroke colour equals the current, absolute g (green) RGB value - 50 to differentiate from the actual background
     strokeWeight(abs(mouseX-pmouseX)); // Stroke weight defined by the absolute value (speed) of the previous mouseX position to the current mouseX position
     line(pmouseX,pmouseY,mouseX,mouseY); // Line created based on the previous mouse x & y co-ordinate to the current mouse x & y co-ordinate that imitated a defined paintbrush tool
     }
} else {
  noSmooth();
  button2 = false;
}

// Defining Bottom-left button (button3):
if (button3) { // If 'button3' is true (pressed) the following process(es) will commence:
  fill(0,200);
  noStroke();
  rect(150,250,150,125); // button3's appearance changes to having a slightly transparent black fill with no stroke to represent being pushed/activated
  if (mouseX > 0 && mouseX < 300 && mouseY > 250 && mouseY < 500) {  // If the mouse cursor is located within the 3rd quadrant (bottom-left) and...
    if (mousePressed) { // When the mouse is pressed and...
      if (savMouseX == -1 && savMouseY == -1) { // When the saved mouse x co-ordinate & saved mouse y co-ordinate are saved to the default value of -1 then the following process(es) will commence:
        savMouseX = mouseX; // int. variable representing the saved mouse X co-ordinate within the 3rd quadrant's spider-web design
        savMouseY = mouseY; // int. variable representing the saved mouse Y co-ordinate within the 3rd quadrant's spider-web design
      } else {
        savMouseX = -1; // Save the saved mouseX value back to default value of -1
        savMouseY = -1; // Save the saved mouseY value back to default value of -1
      }
    }
    smooth();
    strokeWeight(3);
    stroke(0,100,255);
       if(savMouseX == -1 && savMouseY == -1) { // If the saved mouseX & mouseY value are -1 then the following process(es) commence:
          line(150,250,mouseX,mouseY); // Blue, pivot line fixed at the 12 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(50,250,mouseX,mouseY); // Blue, pivot line fixed at the 11 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(0,300,mouseX,mouseY); // Blue, pivot line fixed at the 10 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(0,375,mouseX,mouseY); // Blue, pivot line fixed at the 9 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(0,450,mouseX,mouseY); // Blue, pivot line fixed at the 8 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(50,500,mouseX,mouseY); // Blue, pivot line fixed at the 7 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(150,500,mouseX,mouseY); // Blue, pivot line fixed at the 6 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(250,500,mouseX,mouseY); // Blue, pivot line fixed at the 5 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(300,450,mouseX,mouseY); // Blue, pivot line fixed at the 4 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(300,375,mouseX,mouseY); // Blue, pivot line fixed at the 3 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(300,300,mouseX,mouseY); // Blue, pivot line fixed at the 2 o'clock position from mouse position within 3rd quadrant (bottom-left)
          line(250,250,mouseX,mouseY); // Blue, pivot line fixed at the 1 o'clock position from mouse position within 3rd quadrant (bottom-left)
    strokeWeight(10); 
    stroke(0,0,100);  
    fill(color(r,g,b)); // Fill with the colour of the current RGB value from the float variables r, g & b for the...
      ellipse(mouseX,mouseY,25,25);  // ... ellipse of x & y co-ordinate that follows the mouseX & mouseY position
       } else {
          line(150,250,savMouseX,savMouseY); // Blue, pivot line fixed at the 12 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(50,250,savMouseX,savMouseY); // Blue, pivot line fixed at the 11 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(0,300,savMouseX,savMouseY); // Blue, pivot line fixed at the 10 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(0,375,savMouseX,savMouseY); // Blue, pivot line fixed at the 9 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(0,450,savMouseX,savMouseY); // Blue, pivot line fixed at the 8 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(50,500,savMouseX,savMouseY); // Blue, pivot line fixed at the 7 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(150,500,savMouseX,savMouseY); // Blue, pivot line fixed at the 6 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(250,500,savMouseX,savMouseY); // Blue, pivot line fixed at the 5 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(300,450,savMouseX,savMouseY); // Blue, pivot line fixed at the 4 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(300,375,savMouseX,savMouseY); // Blue, pivot line fixed at the 3 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(300,300,savMouseX,savMouseY); // Blue, pivot line fixed at the 2 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
          line(250,250,savMouseX,savMouseY); // Blue, pivot line fixed at the 1 o'clock position from the saved mouse position within 3rd quadrant (bottom-left)
       }
  }
} else {
  button3 = false;
}

// Defining Bottom-right button (button4):
if (button4) { // If 'button4' is true (pressed) the following process(es) will commence:
  fill(0,200);
  noStroke();
  rect(300,250,150,125); // button4's appearance changes to having a slightly transparent black fill with no stroke to represent being pushed/activated
    fill(random(255),random(255),random(255)); // Random fill colour with RGB range
    strokeWeight(3); 
    stroke(random(255),random(255),random(255),random(255)); // Random, medium-thickness stroke colour with RGB range
    line(random(width/2+25,width-25),random(height/2+25,height-25),random(width/2+25,width-25),random(height/2+25,height-25)); // Random lines being produced within the 4th quadrant (bottom right)
    rect(random(width/2+25,width-25),random(height/2+25,height-25),random(150),random(150)); // Random rectangles being produced within the 4th quadrant (bottom right)
    ellipse(random(width/2+25,width-25),random(height/2+25,height-25),random(150),random(150)); // Random ellipses being produced within the 4th quadrant (bottom right)
} else {
  button4 = false;
}

// Constraining Values:
r = constrain(r,0,255); // Constrain r (red) float values from "0" to "255"
g = constrain(g,0,255); // Constrain g (green) float values from "0" to "255"
b = constrain(b,0,255); // Constrain b (blue) float values from "0" to "255"

print(r);print(' ');print(g);print(' ');println(b); // Prints "r g b" (RGB) value each process 
}

// Defining Mouse Presses within Sketch
void mousePressed() { 
  if (mouseX > 150 && mouseX < 300 && mouseY > 125 && mouseY < 250) { // If top-left button (button1) is pressed it will change the boolean button from 'true' to 'false' and vice versa
    button1 = !button1;
    }
  
  if (mouseX > 300 && mouseX < 450 && mouseY > 125 && mouseY < 250 && mousePressed) { // If top-right button (button2) is pressed it will change the boolean button from 'true' to 'false' and vice versa
    button2 = !button2;
    }
  
  if (mouseX > 150 && mouseX < 300 && mouseY > 250 && mouseY < 375 && mousePressed) {  // If bottom-left button (button3) is pressed it will change the boolean button from 'true' to 'false' and vice versa
    button3 = !button3;
    }  
  
  if (mouseX > 300 && mouseX < 450 && mouseY > 250 && mouseY < 375 && mousePressed) { // If bottom-right button (button4) is pressed it will change the boolean button from 'true' to 'false' and vice versa
  button4 = !button4;
    } 
  
}
// Copyright Brandon McCann [Creative Technologies]
  // Created 08/11/2012 to 13/11/2012

