
//magnetic field moved by mouse

//int x = 0;
//int y = 0;

boolean newLine;

void setup() {
  size(400, 400);
  //background(255);
  smooth();
  newLine = false;
}

void draw() {
  background(255);
  stroke(200);
  //draw short separated lines across 
  //width and height of page
  for (int x =0; x < width; x += 20) {
    for (int y = 0; y < height; y += 20) {
      //line(x, y+10, x+10, y);
      //every top right corner x-value falls on 20, 40, 60, 80, etc.
      //when mouseX goes over the x-value, flip the line to the other direction
      if (dist(mouseX, mouseY, x, y+10) >= 45) {
        newLine = true;
      } 
      else {
        newLine = false;
      }

      if (newLine) {
        line(x, y+10, x+10, y);
      } 
      else {
        line(x, y+10, x-10, y);
      }
    }
  }
}

void redraw(float newX, float newY) {
  //float mouseX = x;
  //line(newX-10, newY+10, newX-20, newY-10);
  //println(x);
}


//noStroke();
//float d = dist(mouseX, mouseY, x, y);
//stroke(200);
//line(x-10, y, x-d, y-10);
//println(d);



//when mouseX and mouseY are over a certain position, the xPosVal has to go back 20 units.
//first set rectangular parameters around each slanted line
//getMagFieldValue(mouseX, mouseY);
//if (mouseX == x) {
//line(x, y+10, x-20, y);
//}
//}

//dist
//map

//class Line {
  
//  boolean flipped;


