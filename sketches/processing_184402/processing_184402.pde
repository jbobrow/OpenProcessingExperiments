
/*------------------------------
"Practice: For/While"
Simple programming sketch using "while" to create an array of lines.

Created February 4, 2015
By Megan Cattey
megancattey@gmail.com

Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
 ------------------------------*/
 
int x1;
int y1;
int x2;
int y2;


void setup() {
  size(500, 500);
  background(0);
  smooth();
}

void draw() {
  x1=0;
  y1=height/5;
  x2=width/8;
  y2=0;
  
  while (x1<width) {
    stroke(0, 239, 255);
    line(x1, y1, x1, height);
    x1= x1+5;
    y1=y1+5;
  }

  while (x2<width) {
    stroke(255, 137, 0);
    line(x2, y2, width, y2); 
    x2=x2+1;
    y2=y2+7;
  }
}

