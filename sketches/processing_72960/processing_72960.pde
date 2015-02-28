
//to rotate rect around the center, take x2,y2 value and add to translate (x,y) but remove from x1,y1

int x;

int numboxes;

int boxwidth;
int boxheight;

Box[] boxes;

void setup() {
  size(350, 410);

  noStroke();
  numboxes = 100;  
  boxwidth = 5;
  boxheight = 5;

  boxes = new Box[numboxes];
  for (int i = 0; i < numboxes; i++) {
    boxes[i] = new Box();
  }
}

void draw() {

  background(219, 213, 197);

  rectMode(CENTER);

  //yellow rectangle
  translate(55, 243);
  rotate(radians(37));
  fill(237, 170, 0);
  noStroke();
  rect(0, 0, 28, 20); //small yellow rect, bottom
  resetMatrix();

  translate(83, 205);
  rotate(radians(36));
  rect(0, 0, 33, 45); //med yellow rect, middle
  resetMatrix();

  fill(255, 100);
  for (int i = 0; i < numboxes; i++) {
    boxes[i].draw();
  }
}

class Box {
  float x;
  float y;
  float xvel;
  float yvel;

  Box() {
    x = (height/2)-boxwidth;
    y = (width/2)-boxheight;
    xvel = random(-5, 5);
    yvel = random(-5, 5);
  }


 

    void draw() {
      
      fill(mouseX, mouseY, mouseX-75);
      rect(x, y, boxwidth, boxheight);

      if (x >= width-boxwidth) {
        xvel = -abs(xvel);
      }
      if (x <= 0) {
        xvel = abs(xvel);
      }
      if (y >= height-boxheight) {
        yvel = -abs(yvel);
      }
      if (y <= 0) {
        yvel = abs(yvel);
      }

      x = x + xvel;
      y = y + yvel;
    }
}


void mouseDragged() {

  int h = hour();    // Values from 0 - 23

  //black quad mid
  fill(0, 0, 0);
  noStroke();
  quad(227, 290, 180, 368, 134, 340, 182, 263);

  //blue rectangle small
  translate(0, 0);
  rotate(h); //radians(28)
  fill(27, 26, 100);
  noStroke();
  rect(325, 125, 40, 10);
  resetMatrix();
  translate(0, 0);

  //black quad mid
  fill(0, 0, 0);
  noStroke();
  quad(227, 290, 180, 368, 134, 340, 182, 263);

  //black quad big
  fill(0, 0, 0);
  noStroke();
  //rotate(h);
  quad(132, 182, 49, 286, 120, 350, 202, 230);

  rotate(radians(29));
  fill(0);
  noStroke();
  rect(362, 190, 40, 45);

  //small blue rect
  rotate(radians(-5)); //radians(28)
  fill(27, 26, 100);
  noStroke();
  rect(320, 145, 40, 10);
  resetMatrix();
}

void mouseMoved() { 
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  //red rectangles
  translate(95, 82);
  rotate(m);//radians(-5)
  fill(162, 0, 11);
  noStroke();
  rect(58, 17, 150, 9); //bottom large
  rect(20, 0, 40, 4); //top small
  resetMatrix();

  //yellow rectangle, large
  translate(142, 124);
  fill(237, 170, 0);
  rotate(s); //radians(39)
  rect(0, 0, 44, 135); //large yellow rect top
  resetMatrix();

  //yellow rect set, right cluster
  translate(171, 125);
  fill(237, 170, 0);
  rotate(s);//radians(39)
  rect(10, 29, 16, 49); //long yellow rect, left
  rect(36, 19, 30, 35); //med yellow square, middle
  resetMatrix();

  translate(180, 200);
  rotate(s);
  rect(0, 0, 20, 15); //small yellow rect, right
  resetMatrix();

  //blue rectangle big
  translate(60, 350);
  rotate(h); //radians(29)
  fill(27, 26, 100);
  noStroke();
  rect(0, 0, 73, 16);
  resetMatrix();

  //yellow rectangle
  translate(55, 243);
  rotate(radians(37));
  fill(237, 170, 0);
  noStroke();
  rect(0, 0, 28, 20); //small yellow rect, bottom
  resetMatrix();

  translate(83, 205);
  rotate(radians(36));
  rect(0, 0, 33, 45); //med yellow rect, middle
  resetMatrix();
}
