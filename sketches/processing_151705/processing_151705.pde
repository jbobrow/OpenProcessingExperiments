
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. 
 * 
 */

// variable used to store the current frame rate value
int param;
color c1, c2;

void setup() {
  size(500, 500);

  param = 6;
  rectMode(CENTER);
  background(255);
  
  c1 = color(0);
  c2 = color(128);
}


void draw() {

  background(255);

  int num = 20;
  float margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  margin = cellsize/2;

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float f = param * circleNum;
  
  int dx = sign(cos(f*33));
  int dy = sign(sin(f));  
  
  float sect = calculate_sect(dx, dy);

  noFill();
  stroke(c1);
  arc(x, y, size, size, HALF_PI*sect, HALF_PI*(sect+1));


  // Big arcs

  float bsect = sect + ((int)(cos(circleNum))*5) % 4;
  float bx = x + dx * size;
  float by = y + dy * size;

  stroke(c2);
  arc(bx, by, 3*size, 3*size, HALF_PI*sect, HALF_PI*(sect+1));

}

int calculate_sect(int dx, int dy) {
  if (dx == -1 && dy == -1) return 0;
  if (dx == 1  && dy == -1) return 1;
  if (dx == 1  && dy == 1) return 2;
  if (dx == -1 && dy == 1) return 3;
  return 0;
}  

int sign(float x) {
  if (x < 0) return -1;
  return 1;
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase param
  if (keyCode == RIGHT ) {
    param++;
  }

  // left arrow -- decrease param
  if ( keyCode == LEFT ) {
    param--;
  }

  println("Current param is: " + param);

  // Swap Color
  if ( keyCode == UP || keyCode == DOWN ) {
    color t = c1;
    c1 = c2;
    c2 = t;
  }


  if ( key == 's') {
    saveFrame("yourName.jpg");
  }


}

