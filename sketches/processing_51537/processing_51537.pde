
/*******************************************
 
 * Assignment 2
 * Name: Vivien Chen
 * E-mail: vtchen@brynmawr.edu
 * Course: CS 110- Section 02
 * Submitted: 2/7/2012
 
 * My Assignment 2 consists of a portrait of the ground and sky, divided equally in half: 
 green representing the grass on the ground and blue representing the sky. I also used
 a concentric circle with transparency to depict the horizon on the upper left hand corner. 
 Iteration is also used for the clouds in the sky, which forms multiple white ellipses. When 
 you mouseclick in the sky portion of the portrait, birds appear (which were formed by multiple curve vertices).
 The birds decrease in size as you click closer to the horizon line of the portrait. In addition
 if you click on the ground (grass) portion of the portrait, apple trees appear (which were 
 formed by a triangle, rectangle, and various small ellipses). As you click closes to the horizon
 line, the trees decrease in size.
 
 *********************************************/

void setup() {
  size (500, 500);
  stroke (0, 250, 100);
  fill (0, 250, 80);
  rect (0, 250, 500, 250); // Land/Ground

  stroke (100, 180, 180);
  fill (100, 180, 180);
  rect (0, 0, 500, 250); // Sky

  stroke (25, 20, 0);
  smooth();
  strokeWeight (2);
  fill (120, 100, 0);
  quad (350, 250, 370, 250, 450, 500, 250, 500);// pathway


  for (int i= 200; i>20; i-=5) {
    noStroke ();
    fill (255, 50, 0, 15);
    ellipse (150/2, 150/2, i, i);// concentric Horizon



    /*
    noStroke ();
     smooth();
     fill (100);
     beginShape();
     curveVertex (250, 100);
     curveVertex (250, 100);
     curveVertex (235, 85);
     curveVertex (220, 85);
     curveVertex (250, 100);
     curveVertex (250, 100);
     endShape ();// bird left wing
     
     noStroke ();
     smooth();
     fill (100);
     beginShape();
     curveVertex (250, 100);
     curveVertex (250, 100);
     curveVertex (275, 85);
     curveVertex (300, 85);
     curveVertex (250, 100);
     curveVertex (250, 100);
     endShape(); // bird right wing 
     
     smooth();
     noStroke();
     fill(0, 50, 20);
     ellipse (250, 365, 35, 35);
     ellipse (270, 350, 35, 35);
     ellipse (250, 336, 35, 35);
     ellipse (235, 350, 35, 35);//top tree
     smooth();
     fill (255, 0, 0);
     noStroke();
     ellipse (247, 350, 8, 8);
     ellipse (270, 370, 8, 8);
     ellipse (253, 325, 8, 8);
     ellipse (238, 365, 8, 8);//apples
     fill (50, 50, 0);
     noStroke ();
     rect (243, 380, 15, 30); // tree trunk
     */
  }
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
}

void mousePressed() {
  if (mouseY<= height/2) {
    drawBird(mouseX, mouseY, (250-mouseY)/250.0);
    println(mouseY);
    println((250-mouseY)/250.0);
  }
  else if (mouseY>= height/2) {
    drawAppletree(mouseX, mouseY, ((mouseY-250)/250.0)+0.4);
    println (mouseY); // conditional for drawBird and drawAppletree
  }
  
}


void drawBird(int x, int y, float scal) {
  noStroke ();
  fill (100);
  beginShape();
  curveVertex (x, y);
  curveVertex (x, y);
  curveVertex (x-15*scal, y-15*scal);
  curveVertex (x-30*scal, y-15*scal);
  curveVertex (x, y);
  curveVertex (x, y);
  endShape ();// bird left wing

  noStroke ();
  fill (100);
  beginShape();
  curveVertex (x, y);
  curveVertex (x, y);
  curveVertex (x+25*scal, y-15*scal);
  curveVertex (x+50*scal, y-15*scal);
  curveVertex (x, y);
  curveVertex (x, y);
  endShape();// bird right wing
}

void drawAppletree (int x, int y, float scal) {
  smooth();
  noStroke();
  fill(0, 50, 20);
  ellipse (x+7*scal, y-15*scal, 35*scal, 35*scal);
  ellipse (x+27*scal, y-30*scal, 35*scal, 35*scal);
  ellipse (x+7*scal, y-44*scal, 35*scal, 35*scal);
  ellipse (x-8*scal, y-30*scal, 35*scal, 35*scal);//top tree//top tree
  smooth();
  fill (255, 0, 0);
  noStroke();
  ellipse (x+4*scal, y-30*scal, 8*scal, 8*scal);
  ellipse (x+27*scal, y-10*scal, 8*scal, 8*scal);
  ellipse (x+10*scal, y-55*scal, 8*scal, 8*scal);
  ellipse (x-5*scal, y-15*scal, 8*scal, 8*scal);//apples
  fill (50, 50, 0);
  noStroke ();
  rect (x, y, 15*scal, 30*scal); // tree trunk
}
/*
    smooth();
 noStroke();
 fill(0, 50, 20);
 ellipse (250, 365, 35, 35);
 ellipse (270, 350, 35, 35);
 ellipse (250, 336, 35, 35);
 ellipse (235, 350, 35, 35);//top tree
 smooth();
 fill (255, 0, 0);
 noStroke();
 ellipse (247, 350, 8, 8);
 ellipse (270, 370, 8, 8);
 ellipse (253, 325, 8, 8);
 ellipse (238, 365, 8, 8);//apples
 fill (50, 50, 0);
 noStroke ();
 rect (243, 380, 15, 30); // tree trunk
 */

void drawCloud (int x, int y, int w, int h) {
  fill(230);
  int z = x+25;
  for (int i=x; i< z; i++) {
    i = i + 19;
    ellipse (i, y, w, h);// cloud drawn by iteration
  }
}


