
/*******************************************
 
 * Assignment 2
 * Name: Vivien Chen
 * E-mail: vtchen@brynmawr.edu
 * Course: CS 110- Section 02
 * Submitted: 2/14/2012
 
 * My assignment 3 (fairy-tale themed) includes iteration, mouse-press, and various functions.
 I first started off with the background hills which are composed of various shapes
 and bezier curves. The clouds in the sky are done by iteration, and the trees in the
 hills are scaled so that they decrese in size as you click closer to the tops of the
 hills, and slightly increase in size as you click towards the bottom of the window. 
 Rapunzel's braid is composed by function calling multiple ellipses, and the stones on
 the tower are composed by curve vertices and are called with functions. 
 
 *********************************************/


void setup () {

  size (600, 600);
  background (100, 180, 200);


  noStroke();
  smooth();
  fill(15, 120, 0);
  bezier(0, 500, 200, 400, 600, 400, 800, 350);
  triangle(600, 350, 600, 500, 300, 437);
  fill(20, 145, 0);
  quad(0, 400, 800, 500, 800, 600, 0, 600);//hills in background

  smooth();
  fill (125);
  rect (350, 200, 200, 500);//tower

  smooth();
  fill (100, 14, 0);
  triangle (300, 200, 450, 100, 600, 200);//roof

  smooth();
  stroke (0);
  fill (150, 150, 0);
  strokeWeight (2);
  rect (380, 250, 70, 120);//window

  arc(415, 280, 66, 52, -PI, 0);//arc in window

  /*
  fill (255, 255, 0);
   stroke (200, 200, 0);
   ellipse (400, 380, 10, 40); //hair braid
   

  smooth();
  noStroke();
  fill (5, 25, 0);
  triangle (200, 500, 210, 520, 190, 520);//top tree

  smooth();
  noStroke();
  fill (50, 50, 0);
  rect (196, 520, 7, 15); //tree trunk
  */
}
void draw() {
  drawCloud  (300, 50, 30, 30);
  drawCloud (280, 67, 30, 30);
  drawCloud (320, 67, 30, 30);// iteration for cloud1

  drawCloud (445, 25, 25, 23);
  drawCloud (455, 15, 25, 23);// iteration for cloud2

  drawCloud (200, 25, 30, 25);
  drawCloud (180, 20, 30, 25);
  drawCloud (210, 10, 30, 25);
  drawCloud (170, 10, 30, 25);//iteration for cloud3

  drawCloud (50, 75, 45, 45);
  drawCloud (25, 55, 50, 50);//iteration for cloud4


  drawStones (420, 600);
  drawStones (470, 520);
  drawStones (425, 490);
  drawStones (460, 430); //calling drawStones function

  drawHair (400, 380);
  drawHair (400, 430);
  drawHair (400, 480);
  drawHair (400, 520);
  drawHair (400, 570); // calling drawHair function
}

void drawHair(int x, int y) {
  fill (255, 255, 0);
  stroke (200, 200, 0);
  ellipse (x, y, 10, 40);
  ellipse (x, y+25, 10, 40);
}  

void drawStones (int x, int y) {

  fill (100);
  stroke (0);
  beginShape ();
  curveVertex (x, y);
  curveVertex (x, y);
  curveVertex (x-20, y+20);
  curveVertex (x-80, y+30);
  curveVertex (x-20, y-45);
  curveVertex (x, y);
  curveVertex (x, y); 
  endShape ();

  beginShape ();
  curveVertex (x, y-40);
  curveVertex (x, y-40);
  curveVertex (x+65, y-20);
  curveVertex (x+30, y);
  curveVertex (x, y-40);
  curveVertex (x, y-40);
  endShape (); // stones on tower made by vertex curves.
}

void mousePressed() {
  if (mouseY>= 400) {
    drawTree(mouseX, mouseY, (mouseY-250)/250.0);
    println(mouseY);
    println((mouseY-250)/250.0);// mousepress tree on the hills
  }
}


void drawTree (int x, int y, float scal) {
  smooth();
  noStroke();
  fill (5, 25, 0);
  triangle (x+4*scal, y-20*scal, x+14*scal, y, x-4*scal, y);//top tree

  smooth();
  noStroke();
  fill (50, 50, 0);
  rect (x, y, 7*scal, 15*scal); //tree trunk
}

void drawCloud (int x, int y, int w, int h) {
  fill(230);
  noStroke();
  int z = x+50;
  for (int i=x; i< z; i++) {
    i = i + 25;
    ellipse (i, y, w, h);// cloud drawn by iteration
  }
}


