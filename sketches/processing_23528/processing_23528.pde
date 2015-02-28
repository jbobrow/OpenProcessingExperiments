
//Initial position is 170x, 115y
int x_pos = 170; 
int y_pos = 115;

int xtemp = 0;
int ytemp = 0;

PImage b;

void setup() {
  size(300, 300);
  smooth();
  b = loadImage("http://www.studiosabine.com/Sand%20Patterns%20rocks.jpg");
  //image from http://www.studiosabine.com/Sand%20Patterns%20rocks.jpg
  background(b);
}

void mouseMoved() {
 //setting variable to mouse position
 x_pos=mouseX;
 y_pos=mouseY;
 println(x_pos);
 println(y_pos);
  
}

void draw() {
 background(b);
 fill (50, 120, 200);
 int count=0;
 
 //3rd Clipper Top
 beginShape();
 //using Temp to position vertex based on mouse position
 xtemp=x_pos+80;
 ytemp=y_pos-65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+30, xtemp-10, ytemp+40, xtemp-30, ytemp+50);
 bezierVertex(xtemp-50, ytemp+35, xtemp, ytemp+40, xtemp, ytemp);
 endShape();

 //2nd Clipper Top
 beginShape();
 xtemp=x_pos+30;
 ytemp=y_pos-65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+30, xtemp-10, ytemp+40, xtemp-30, ytemp+50);
 bezierVertex(xtemp-50, ytemp+35, xtemp, ytemp+40, xtemp, ytemp);
 endShape();

 //1st Clipper Top
 beginShape();
 xtemp=x_pos-20;
 ytemp=y_pos-65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+30, xtemp-10, ytemp+40, xtemp-30, ytemp+50);
 bezierVertex(xtemp-50, ytemp+35, xtemp, ytemp+40, xtemp, ytemp);
 endShape();
 
/* ******************************************* */

 //1st Clipper Bottom
 beginShape();
 xtemp=x_pos-20;
 ytemp=y_pos+65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-30, xtemp-10, ytemp-40, xtemp-30, ytemp-50);
 bezierVertex(xtemp-50, ytemp-35, xtemp, ytemp-40, xtemp, ytemp);
 endShape();
 
 //2nd Clipper Bottom
 beginShape();
 xtemp=x_pos+30;
 ytemp=y_pos+65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-30, xtemp-10, ytemp-40, xtemp-30, ytemp-50);
 bezierVertex(xtemp-50, ytemp-35, xtemp, ytemp-40, xtemp, ytemp);
 endShape();
 
 //3rd Clipper Bottom
 beginShape();
 xtemp=x_pos+80;
 ytemp=y_pos+65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-30, xtemp-10, ytemp-40, xtemp-30, ytemp-50);
 bezierVertex(xtemp-50, ytemp-35, xtemp, ytemp-40, xtemp, ytemp);
 endShape();
 
/* ******************************************* */

 //Face Clipper Top
 beginShape();
 fill(0,255,0);
 xtemp=x_pos-50;
 ytemp=y_pos-105;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+70, xtemp-40, ytemp+90, xtemp-40, ytemp+110);
 bezierVertex(xtemp-80, ytemp+90, xtemp-10, ytemp+100, xtemp, ytemp);
 endShape();
 
 //Face Clippter bottom
 beginShape();
 fill(0,255,0);
 xtemp=x_pos-50;
 ytemp=y_pos+105;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-50, xtemp-40, ytemp-90, xtemp-40, ytemp-110);
 bezierVertex(xtemp-80, ytemp-90, xtemp-10, ytemp-100, xtemp, ytemp);
 endShape();

/* ******************************************* */
 body();
}


void body() {
 colorMode(HSB, 255);
 color c = color(0, 126, 255);
 fill(c);
 //head positioned based on mouse centre(body ellipse centre)
 ellipse (x_pos-70, y_pos, 70, 50);
 float value = saturation(c);  // Sets "value" to "126"
 fill(value);
 //body centres on mouse position
 ellipse (x_pos, y_pos, 150, 60);
}

