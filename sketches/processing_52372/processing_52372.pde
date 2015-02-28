
/****************************************************************
* Assignment #3
* Kelli Breeden
* kbreeden@brynmawr.edu
* CS 110 - Section 2
* Submitted 2/14/2012
*
* This sketch depicts a cathedral at night, based off the Lincoln
* Family Church in Springfield, IL. A for loop is present in the
* creation of the night sky. 
*****************************************************************/
void setup() {
  size(500, 500);
  background(0, 56, 112);
  smooth();

  for (int i=0;i<150;i++) {
    //puts 150 stars in the night sky
    stroke(255);
    point(random(width), random(height));
  }

  stroke(20);
  building();
  roof();

  //left tower
  window(55, 280, 1, 1); //main windows
  window(85, 280, 1, 1);

  window(47, 180, 1.5, 1.5); //top windows
  window(74, 180, 1.5, 1.5);
  window(102, 180, 1.5, 1.5);

  window(47, 392.5, 1.5, 1.5); //bottom windows
  window(74, 392.5, 1.5, 1.5);
  window(102, 392.5, 1.5, 1.5);

  door(65, 465, 2, 2);
  brickDesigns(30);


  //right tower
  window(388, 280, 1, 1); //main windows
  window(418, 280, 1, 1);

  window(378, 180, 1.5, 1.5); //top windows
  window(404, 180, 1.5, 1.5);
  window(432, 180, 1.5, 1.5);

  window(378, 392.5, 1.5, 1.5); //bottom windows
  window(404, 392.5, 1.5, 1.5);
  window(432, 392.5, 1.5, 1.5);

  door(400, 465, 2, 2);
  brickDesigns(360);

  //middle
  window(182, 350, 1.5, 1.5);
  window(212, 350, 1.5, 1.5);
  window(242, 350, 1.5, 1.5);
  window(272, 350, 1.5, 1.5);
  window(302, 350, 1.5, 1.5);
  fill(185);
  rect(172, 380, 155, 10); //accent under windows

  door(215, 450, 1, 1);
  fill(0);
  ellipse(251, 300, 50, 50); //circular window
}

void building() {

  fill(145, 0, 0);
  beginShape();
  vertex(30,height);
  vertex(30,110);
  vertex(140,110);
  vertex(140,250);
  vertex(360,250);
  vertex(360,110);
  vertex(470,110);
  vertex(470,height);
  endShape(CLOSE);
  
  line(140,250,140,height);
  line(360,250,360,height);
}

void roof () {
  fill(185);
  triangle(140, 250, 250, 180, 360, 250);
  line(250,180,250,140); //creates the cross
  line(240,155,260,155); //creates the cross

  drawTriangle(25, 110, 48);
  drawTriangle(125, 110, 148);
  triangle(33, 115, 85, 80, 135, 115);
  drawTriangle(20, 110, 43);
  drawTriangle(130, 110, 152);

  drawTriangle(358, 110, 380);
  drawTriangle(453, 110, 473);
  triangle(365, 115, 415, 80, 465, 115);
  drawTriangle(353, 110, 375);
  drawTriangle(458, 110, 478);
}

void drawTriangle(float a, float b, float c) {
  triangle(a, b, (a+c)/2, b-10, c, b);
}

void window(float x, float y, float scaleX, float scaleY) {
  fill(0);
  beginShape();
  vertex(x, y+(50/scaleY));
  vertex(x, y);
  arc(x+(12.5/scaleX), y, 25/scaleX, 25/scaleY, -PI, 0);
  vertex(x+(25/scaleX), y);
  vertex(x+(25/scaleX), y+(50/scaleY));
  endShape(CLOSE);
}

void door(float w, float z, float scaleW, float scaleZ) {
  fill(112, 30, 15);
  beginShape();
  vertex(w, z+(75/scaleZ));
  vertex(w, z);
  arc(w+(37.5/scaleW), z, 75/scaleW, 75/scaleW, -PI, 0);
  vertex(w+(75/scaleW), z);
  vertex(w+(75/scaleW), z+(75/scaleZ));
  endShape();

  //to show the double doors:
  line(w+(37.5/scaleW), z, w+(37.5/scaleW), z+(75/scaleZ));
}

void brickDesigns(float a) {
  //puts accents under the rows of windows
  fill(185);
  rect(a, 214, 110, 8);
  rect(a, 162, 110, 8);
  rect(a+12.5, 330, 80, 10);
  rect(a+10, 426, 85, 8);
}


