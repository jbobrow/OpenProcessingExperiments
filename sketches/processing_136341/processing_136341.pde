
/* A program that has user controlled changing backgrounds 
  */

void setup() {
  size(500,500);

}
//Many of our integers represent the number used to makes the color 
int rotateValue = 0;
int x = mouseX;
int y = mouseY;
int r = 255;

int b = 255;
int g = 255;
int red = 0;
int blue = 0;


 void keyPressed() {
  
 
 }
 

void draw() {
 
  background(255);
  
 
  
//Draws Grid
 strokeWeight(5);
 fill(0,255,0);//green
 rect(250,250,100,100);
 line(250,0,250,500);
 line(0,250,500,250);
 
//Draws rectangles to fill grid quadrants
rectMode(CORNER);  
  fill(r, 0, 0);
  rect(0,0,250,250);
  r--;

  fill(r, g, 0);
  rect(250,0,500,250);
  g--;
  fill(0,g,0);
  rect(0,250,250,500);
  
  fill(0,0,b);
  rect(250,250,500,500);
  b--;

//Makes the background pulse
if (r == 170 && g == 170 && b == 170) {
  r = 255;
  b = 255;
  g= 255;
}


//Draws triangle that follows the mouse
  fill(red, 0, blue);
  translate(mouseX, mouseY);
  rotate(rotateValue*1.4);
  triangle(0,-25,-50,50,25,50);

//Makes the triangle spin  
 rotateValue++;

//Makes the triangle turn different shades of purple 
 red++;
 blue++;
 if (red == 255 && blue == 255) {
   red = 100;
   blue = 100;
 }
 
//Draws top left spinning square
resetMatrix();
translate(125,125);
rotate(rotateValue/8);
fill(0,255,255);
rectMode(CENTER);
rect(0,0,100,100);

//Draws top right spinning square
resetMatrix();
translate(375,125);
rotate(-rotateValue/8);
fill(100,255,100);
rect(0,0,100,100);

//Draws bottom left spinning square
resetMatrix();
translate(125,375);
rotate(-rotateValue/8);
fill(255,200,0);
rect(0,0,100,100);

//Draws bottom right spinning square
resetMatrix();
translate(375,375);
rotate(rotateValue/8);
fill(255,75,100);
rect(0,0,100,100);  
 
}

 


