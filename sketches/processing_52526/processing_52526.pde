
/***
 Assignment 3
 Rachel Genovese
 rgenovese@brynmawr.edu
 CS 110, Section 2, Professor Xu
 2/14/12 
 
 This assignment is an updated version of the first assignment.
 There are two main functions in this program: a function to draw a cow
 and a function to draw an a robot abducting a cow.  The clouds in the
 sky are iterations and the cows appear smaller as you click higher on
 the program.
 ***/

int horizon;
float scal;

void setup () {
  size (500, 500);

  //Color for the sky
  background (0, 0, 75);

  //Color for the ground using a rectangle
  fill (0, 50, 25);
  smooth ();
  stroke (0, 50, 25);
  int horizon = 300; //Defines Y-horizon line
  rect (0, horizon, 500, 500 - horizon);

  //Left Cloud
  drawCloud (50, 25, 30, 25);
  drawCloud (35, 40, 30, 25);
  drawCloud (55, 50, 30, 25);
  //Middle Cloud
  drawCloud (300, 70, 30, 30);
  drawCloud (280, 90, 30, 30);
  drawCloud (320, 90, 30, 30);
  //Right Cloud
  drawCloud (400, 25, 25, 23);
  drawCloud (415, 15, 25, 23);

  drawAbduction (180, 180);
}

void draw () {
}

//When mouse is clicked below the horizon, a cow will appear!
void mousePressed () {
  if (mouseY > horizon) {
    scal = (mouseY-horizon)*0.0025;
    drawCow (mouseX, mouseY, scal);
  }
}

//Function to draw cows
void drawCow (int x, int y, float scal) {
  //Cow (tail)
  smooth ();
  strokeJoin (ROUND);
  strokeWeight (2*scal);
  noFill ();
  stroke (255);
  curve (x-67*scal, y+1*scal, x-23*scal, y, x-35*scal, y+5*scal, x-86*scal, y-50*scal);

  //Cow (body)
  smooth ();
  fill (255);
  stroke (0);
  //ellipse ((x+134)*scal, (y+245)*scal, (50)*scal, (25)*scal);
  ellipse (x, y, (50)*scal, (25)*scal);

  //Cow (spots)
  fill (0);
  ellipse (x+15*scal, (y), (10)*scal, (10)*scal);
  //ellipse ((x+133)*scal, (y+245)*scal, (10)*scal, (10)*scal);
  ellipse (x, y, (10)*scal, (10)*scal);
  ellipse ((x-15*scal), y, (10)*scal, (10)*scal);

  //Cow (tip of tail)
  stroke (0);
  strokeWeight (2*scal);
  fill (0);
  ellipse (x-34*scal, y+5*scal, (3)*scal, (3)*scal);

  //Cow (legs)
  strokeWeight (4*scal);
  line (x-14*scal, y+12*scal, x-14*scal, y+15*scal);
  line (x-19*scal, y+9*scal, x-19*scal, y+20*scal);
  line (x+19*scal, y+9*scal, x+19*scal, y+20*scal);
  line (x+14*scal, y+12*scal, x+14*scal, y+15*scal);  

  //Cow (head and nose)
  stroke (0);
  strokeWeight (2*scal);
  fill (255);
  ellipse (x+25*scal, y-12*scal, 20*scal, 16*scal);
  ellipse (x+25*scal, y-9*scal, 7*scal, 5*scal);

  //Cow (eyes)
  fill (0);
  strokeWeight (0);
  ellipse (x+21*scal, y-14*scal, 4*scal, 4*scal);
  ellipse (x+30*scal, y-14*scal, 4*scal, 4*scal);

  //Cow (nostrils)
  ellipse (x+24*scal, y-9*scal, 1*scal, 1*scal);
  ellipse (x+26*scal, y-9*scal, 1*scal, 1*scal);

  //Cow (ears)
  fill (255);
  strokeWeight (1*scal);
  beginShape (TRIANGLES);
  //Left ear
  vertex (x+17*scal, y-18*scal);
  vertex (x+20*scal, y-23*scal);
  vertex (x+25*scal, y-20*scal);
  //Right ear
  vertex (x+30*scal, y-19*scal);
  vertex (x+35*scal, y-16*scal);
  vertex (x+35*scal, y-21*scal);
  endShape();
}

//Function to draw spaceship and robot
void drawAbduction (int x, int y) {
  //Body of spaceship (gray part)
  fill (150);
  stroke (150);
  ellipse(x, y, 275, 100);

  //Lights on spaceship; red dots with black outline **MATH CHECKED
  fill (255, 0, 0);
  stroke (0, 0, 0);
  strokeWeight (10);
  ellipse (x, y, 25, 25);
  ellipse (x-55, y, 25, 25);
  ellipse (x+55, y, 25, 25);
  ellipse (x+110, y, 25, 25);
  ellipse (x-110, y, 25, 25);

  //Glass cockpit of spaceship **MATH CHECKED
  stroke (150);
  strokeWeight (1);
  fill (255, 255, 255, 50);
  arc (x, y-42, 150, 190, PI, TWO_PI-PI/2);
  arc (x, y-42, 150, 190, TWO_PI-PI/2, TWO_PI);

  //Portal of spaceship (on bottom of spaceship) **MATH CHECKED
  strokeWeight (0);
  fill (250, 250, 0, 50);
  arc (x, y+50, 50, 25, PI, TWO_PI-PI/2);
  arc (x, y+50, 50, 25, TWO_PI-PI/2, TWO_PI);

  //Tractor beam **MATH CHECKED
  stroke (250, 250, 0, 50);
  quad (x-23, y+50, x+23, y+50, x+220, y+270, x+85, y+270);

  //Robot
  noSmooth();
  stroke (55);
  strokeWeight (0);
  strokeJoin (BEVEL);
  fill (80);

  //Robot (head) **MATH CHECKED
  rect (x-28, y-123, 55, 55); 

  //Robot (neck) **MATH CHECKED
  rect (x-11, y-68, 19, 17);

  //Robot (eyes) **MATH CHECKED
  fill (120, 0, 0);
  stroke (200, 0, 0);
  ellipse (x-13, y-100, 15, 15);
  ellipse (x+13, y-100, 15, 15);

  //Robot (mouth) **MATH CHECKED
  rect (x-15, y-85, 30, 8);

  //Robot (angry eyebrows) **MATH CHECKED
  stroke (255, 0, 0);
  strokeWeight (5);
  line (x-20, y-115, x-7, y-110);
  line (x+21, y-115, x+6, y-110);

  //Robot (triangles) **MATH CHECKED
  fill (80);
  strokeWeight (0);
  stroke (55);
  beginShape (TRIANGLES);
  vertex (x, y-135);
  vertex (x+10, y-123);
  vertex (x-10, y-123);
  vertex (x+27, y-105);
  vertex (x+27, y-89);
  vertex (x+35, y-97);
  vertex (x-28, y-105);
  vertex (x-28, y-89);
  vertex (x-37, y-97);
  endShape ();

  //Cow (tail)
  smooth ();
  strokeJoin (ROUND);
  strokeWeight (2);
  noFill ();
  stroke (255);
  curve (x+70, y+195, x+109, y+245, x+99, y+250, x+220, y+195);

  //Cow (body)
  smooth ();
  fill (255);
  stroke (0);
  ellipse (x+134, y+245, 50, 25);

  //Cow (spots)
  fill (0);
  ellipse (x+148, y+245, 10, 10);
  ellipse (x+133, y+245, 10, 10);
  ellipse (x+119, y+245, 10, 10);

  //Cow (tip of tail)
  stroke (0);
  strokeWeight (2);
  fill (0);
  ellipse (x+99, y+250, 3, 3);

  //Cow (legs)
  strokeWeight (4);
  line (x+116, y+254, x+116, y+265);
  line (x+124, y+258, x+124, y+261);
  line (x+145, y+257, x+145, y+265);
  line (x+153, y+254, x+153, y+261);  

  //Cow (head and nose)
  stroke (0);
  strokeWeight (2);
  fill (255);
  ellipse (x+160, y+234, 20, 16);
  ellipse (x+161, y+237, 7, 5);

  //Cow (eyes)
  fill (0);
  strokeWeight (0);
  ellipse (x+156, y+233, 4, 4);
  ellipse (x+166, y+233, 4, 4);

  //Cow (nostrils)
  ellipse (x+160, y+237, 1, 1);
  ellipse (x+162, y+237, 1, 1);

  //Cow (ears)
  fill (255);
  strokeWeight (1);
  beginShape (TRIANGLES);
  //Left ear
  vertex (x+151, y+228);
  vertex (x+159, y+226);
  vertex (x+154, y+221);
  //Right ear
  vertex (x+163, y+226);
  vertex (x+168, y+222);
  vertex (x+170, y+230);
  endShape();
}

void drawCloud (int x, int y, int w, int h) {
  fill (0);
  noStroke ();
  int z = x+25;
  for (int i = x; i < z; i++) {
    i = i + 19;
    ellipse (i, y, w, h);
  }
}


