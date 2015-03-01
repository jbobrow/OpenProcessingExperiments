
/*
Caitlin Donahue
Exercise II: Repetition and Variation
Create a 400x400 pixel composition using repetition and variation. 
Strive to create a visually interesting image.
*/

size(400,400); //size of canvas
background(0,0,0); //set background color

//set the variables for triangles 
int x=0; 
int y=0;

//set variables for color
colorMode(HSB);
float hue, sat, bright, alpha;
hue=200;
alpha=105;

noStroke();

//smallest triangle in the back (green)
for (int j=y; j<=height; j=j+40){ //outer loop_Move vertically 
  for(int i=x; i<=width; i=i+40){ //inner loop_Move horizontally 
    hue=random(45,55);
    alpha=random(100,200);
    fill(hue, 255, 255, alpha); //set fill color
    
    triangle(i+30, j+10, i+50, j+10, i+40, j+35); //draw the triangle
  } //close inner loop
} //close outer loop


//original triangle (red)
for (int j=y; j<=height; j=j+30){ //outer loop_move vertically
  for(int i=x; i<=width; i=i+30){ //inner loop_move horizontally 
    hue=random(370-400);
    alpha=random(100,200);
    fill(hue, 255, 255, alpha); //set fill color
    
    triangle(i, j, i+30, j, i+15, j+30); //draw triangle
  } //close inner loop
} //close outer loop 

//teal triangle 
for (int j=y; j<=height; j=j+40){ //outer loop_move vertically 
  for(int i=x; i<=width; i=i+40){ //inner loop_move horizontally 
    hue=random(100,125);
    alpha=random(100,200);
    fill(hue, 255, 255, alpha); //set fill color
    
    triangle(i, j, i+30, j, i+15, j+30); //draw triangle
  } //close inner loop
} //close outer loop

//Small blue triangle (bottom layer)
for (int j=y; j<=height; j=j+40){ //outer loop_move vertically
  for(int i=x; i<=width; i=i+40){ //inner loop_move horizontally 
    hue=random(145,155);
    alpha=random(100,200);
    fill(hue, 255, 255, alpha); //set fill color 
    
    triangle(i+20, j+5, i+40, j+5, i+30, j+25); //draw triangle
  } //close inner loop
} //close outer loop

