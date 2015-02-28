
int rad = 60;        // Width of the shape
// circle 1
float xpos, ypos;     // Starting position of shape
float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
// circle 2
float xpos1, ypos1;    // Starting position of shape    
float xspeed1 = 3.8;  // Speed of the shape
float yspeed1 = 3.2;  // Speed of the shap
int xdirection1 = 1;  // Left or Right
int ydirection1 = 1;  // Top to Bottom
//circle3
float xpos2, ypos2;    // Starting position of shape    
float xspeed2 = 4.8;  // Speed of the shape
float yspeed2 = 4.2;  // Speed of the shap
int xdirection2 = 1;  // Left or Right
int ydirection2 = 1;  // Top to Bottom
//circle4
float xpos3, ypos3;    // Starting position of shape    
float xspeed3 = 5.8;  // Speed of the shape
float yspeed3 = 5.2;  // Speed of the shap
int xdirection3 = 1;  // Left or Right
int ydirection3 = 1;  // Top to Bottom
// circle5
float xpos4, ypos4;     // Starting position of shape
float xspeed4 = 6.8;  // Speed of the shape
float yspeed4 = 6.2;  // Speed of the shape
int xdirection4 = 1;  // Left or Right
int ydirection4 = 1;  // Top to Bottom
// circle5
float xpos5, ypos5;     // Starting position of shape
float xspeed5 = 7.8;  // Speed of the shape
float yspeed5 = 7.2;  // Speed of the shape
int xdirection5 = 1;  // Left or Right
int ydirection5 = 1;  // Top to Bottom
// circle5
float xpos6, ypos6;     // Starting position of shape
float xspeed6 = 8.8;  // Speed of the shape
float yspeed6 = 8.2;  // Speed of the shape
int xdirection6 = 1;  // Left or Right
int ydirection6 = 1;  // Top to Bottom
// circle 6
float xpos7, ypos7;     // Starting position of shape
float xspeed7 = 9.8;  // Speed of the shape
float yspeed7 = 9.2;  // Speed of the shape
int xdirection7 = 1;  // Left or Right
int ydirection7 = 1;  // Top to Bottom

void setup() 
{
  size(640, 360);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  
  xpos1 = (width/2)-1;
  ypos1 = (height/2)-1;
  
  xpos2 = (width/2)-5;
  ypos2 = (height/2)-5;
  
  xpos3 = (width/2)-10;
  ypos3 = (height/2)-10;
  
  xpos4 = (width/2)-15;
  ypos4 = (height/2)-15;
  
  xpos5 = (width/2)-20;
  ypos5 = (height/2)-20;
  
  xpos6 = (width/2)-25;
  ypos6 = (height/2)-25;
  
  xpos7 = (width/2)-30;
  ypos7 = (height/2)-30;
  
  
  
}

void draw() 
{
  background(#AB15E8);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  xpos1 = xpos1 + ( xspeed1 * xdirection1 );
  ypos1 = ypos1 + ( yspeed1 * ydirection1 );
  
  xpos2 = xpos2 + ( xspeed2 * xdirection2 );
  ypos2 = ypos2 + ( yspeed2 * ydirection2 );
  
  xpos3 = xpos3 + ( xspeed3 * xdirection3 );
  ypos3 = ypos3 + ( yspeed3 * ydirection3 );
  
  xpos4 = xpos4 + ( xspeed4 * xdirection4 );
  ypos4 = ypos4 + ( yspeed4 * ydirection4 );
  
  xpos5 = xpos5 + ( xspeed5 * xdirection5 );
  ypos5 = ypos5 + ( yspeed5 * ydirection5 );
  
  xpos6 = xpos6 + ( xspeed6 * xdirection6 );
  ypos6 = ypos6 + ( yspeed6 * ydirection6 );
  
  xpos7 = xpos7 + ( xspeed7 * xdirection7 );
  ypos7 = ypos7 + ( yspeed7 * ydirection7 );
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
  
  if (xpos1 > width-rad || xpos1 < rad) {
    xdirection1 *= -1;
  }
  if (ypos1 > height-rad || ypos1 < rad) {
    ydirection1 *= -1;
  }
  if (xpos2 > width-rad || xpos2 < rad) {
    xdirection2 *= -1;
  }
  if (ypos2 > height-rad || ypos2 < rad) {
    ydirection2 *= -1;
  }
    if (xpos3 > width-rad || xpos3 < rad) {
    xdirection3 *= -1;
  }
  if (ypos3 > height-rad || ypos3 < rad) {
    ydirection3 *= -1;
  }
  if (xpos4 > width-rad || xpos4 < rad) {
    xdirection4 *= -1;
  }
  if (ypos4 > height-rad || ypos4 < rad) {
    ydirection4 *= -1;
  }
  if (xpos5 > width-rad || xpos5 < rad) {
    xdirection5 *= -1;
  }
  if (ypos5 > height-rad || ypos5 < rad) {
    ydirection5 *= -1;
  }
  if (xpos6 > width-rad || xpos6 < rad) {
    xdirection6 *= -1;
  }
  if (ypos6 > height-rad || ypos6 < rad) {
    ydirection6 *= -1;
  }
  if (xpos7 > width-rad || xpos7 < rad) {
    xdirection7 *= -1;
  }
  if (ypos7 > height-rad || ypos7 < rad) {
    ydirection7 *= -1;
  }
  // Draw the shape
  fill (#F8FC00);
  ellipse(xpos, ypos, rad, rad);
  
  fill (#24FFEF);
  ellipse(xpos1, ypos1, rad, rad);
  
  fill (#F53E84);
  ellipse(xpos2, ypos2, rad, rad);
  
  fill (#ED114C);
  ellipse(xpos3, ypos3, rad, rad);
  
  fill (#1124ED);
  ellipse(xpos4, ypos4, rad, rad);
  
  fill (#ED6911);
  ellipse(xpos5, ypos5, rad, rad);
  
  fill (#1EED11);
  ellipse(xpos6, ypos6, rad, rad);
  
    fill (#11ED75);
  ellipse(xpos7, ypos7, rad, rad);
  
  
  
  rect (12,33,25,10);
  
  strokeWeight (10);
  stroke (#E32082);
  point (30,20);
  
  strokeWeight (2);
  line (32,10,20,13);
  
  beginShape();
vertex(10, 20);
vertex(12, 10);
vertex(13, 15);
vertex(8, 12);
endShape(CLOSE);

}

//http://processing.org/examples/bounce.html


  
  

