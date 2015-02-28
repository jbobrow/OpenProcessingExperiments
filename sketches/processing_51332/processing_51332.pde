
/******************************************************
 
 * Assignment 2
 * Name: Stephen Lazzaro
 * Email: slazzaro@haverford.edu
 * Course: CS110- Section 02
 * Submitted: 2/6/2012
 *
 * The following file creates a picture of a sunset on a beach which progresses into the nightime on mouse clicks.  When you click above the horizon,
 * the sky will turn darker into a night sky, and darker clouds as well as a moon will appear at y coordinates which depend on the position of the mouse click.
 * When you click below the horizon within the area of the ocean, a darker color of the ocean will appear with three boats that have y coordinates which again
 * will depend on the position of the mouse click.  When you click below the ocean (in the area of the sand), the sand will turn to a darker brown and rocks
 * will appear that have y coordinates which depend on the position of the mouse click.  As mouse clicks get closer to the horizon, objects will get smaller.
 * 
 *
 * 
 * 
 * 
 
 *********************************************************/

float hzny; //horizon y coordinate

/* The following code creates a function which draws a light colored cloud made up of ellipses at coordinates x, y
 and the width and height (ie size) are altered by s while the color is altered by c
 */

void drawlightcloud (float x, float y, float s, float c) {

  float cloudw = min(s, 20); // this variable limits the size of the cloud so it doesn't get too large
  float cloudc = max(245, c); // this variable assures that the color of the cloud won't be too dark
  stroke(200);
  strokeWeight(1.0);
  fill (cloudc, 230);
  float i=0;
  while (true) {
    ellipse (x + 3*cloudw*sin(i), min(y + cloudw*cos(i), hzny), 4*cloudw, 2.1*cloudw);
    i = i+.785;
    if (i>=6.28) break;
  }
}

void setup () {

  size (800, 800);
  hzny= height/2;
  background (255);
  noStroke();
  fill (0, 190, 255, 170);
  rect (0, 0, width, hzny);  // This creates the background color of the daytime sky

    //The following commands create the sun and a glow from the sun

  fill(255, 150, 0, 245);
  arc(width/2, hzny, width/8, 2*hzny/11, PI, 2*PI);  // This command created the main arc of the sun
  float i=1;
  while (true) {
    fill(255, 255*i, 0, 55*i);
    arc (width/2, hzny, width/(8*i), 2*hzny/(11*i), 3.14, 6.28);
    i = .94*i;
    if (i<.1) break;
  }  //This loop created the glow of the sun

  /* The following commands draw clouds randomly in the daytime sky using loops. The first two entries in the "drawlightcloud" 
   are the width and height of the clouds starting point, the third entry is the size, and the fourth entry is the color 
   (with range of 245-255)
   */
  float z=1;
  while (true) {
    drawlightcloud (random(0, width/2), hzny/random(4, 10), hzny/random(15, 30), random(245, 255));
    z = 1.1*z;
    if (z>20) break;
  }

  float q=1;
  while (true) {
    drawlightcloud (random(width/2, width), hzny/random(4, 10), hzny/random(15, 30), random(245, 255));
    q = 1.1*q;
    if (q>20) break;
  }

  // The following commands draw a hot air balloon in the sky

  // The following set of commands draw the outline of the hot air balloon
  strokeJoin (BEVEL);
  stroke(255, 0, 0);
  strokeWeight(1.8);
  smooth();
  beginShape();
  vertex (4*width/5, hzny/2);
  bezierVertex(4*width/5, hzny/3, 9*width/10, hzny/3, 9*width/10, hzny/2);
  bezierVertex(9*width/10, hzny/2, 9*width/10, hzny/1.9, 8.75*width/10, hzny/1.6);
  vertex (8.25*width/10, hzny/1.6);
  bezierVertex(8*width/10, hzny/1.9, 8*width/10, hzny/2, 8*width/10, hzny/2);
  endShape ();

  // The following set of commands shades the left fifth of the hot air balloon red 
  fill(255, 0, 0);
  beginShape();
  vertex (8.25*width/10, hzny/1.6);
  bezierVertex(7.9*width/10, hzny/2, 7.9*width/10, hzny/2.2, 8.25*width/10, 3.9*hzny/10);
  endShape();

  // The following set of commands shades the middle fifth of the hot air balloon blue
  stroke(0, 0, 230);
  fill(0, 0, 255);
  beginShape();
  vertex (8.40*width/10, hzny/1.6);
  vertex (8.60*width/10, hzny/1.6);
  vertex (8.60*width/10, 3.9*hzny/10);
  bezierVertex(8.60*width/10, hzny/2.7, 8.40*width/10, hzny/2.7, 8.40*width/10, 3.9*hzny/10);
  endShape(CLOSE);

  // The following set of commands shades the right fifth of the hot air balloon red 
  stroke(255, 0, 0);
  fill(255, 0, 0);
  beginShape();
  vertex (8.75*width/10, hzny/1.6);
  bezierVertex(9.1*width/10, hzny/2, 9.1*width/10, hzny/2.2, 8.75*width/10, 3.9*hzny/10);
  endShape();

  // The following set of commands creates the platform of the hot air balloon
  fill (255, 100, 0, 190);
  stroke(255, 100, 0, 190);
  quad(8.30*width/10, hzny/1.55, 8.70*width/10, hzny/1.55, 8.65*width/10, hzny/1.425, 8.35*width/10, hzny/1.425);
  strokeWeight(1.0);
  line(8.30*width/10, hzny/1.55, 8.25*width/10, hzny/1.6);
  line(8.70*width/10, hzny/1.55, 8.75*width/10, hzny/1.6);

  // The following set of commands create an ocean below the horizon

  noStroke();
  int steps = 1000;
  float a = 0.0;
  float b = hzny;
  float w = width;
  float h = (height-hzny)/(2*steps);

  color startC, endC;
  startC = color(240, 100, 255, 50); //Very transparent lighter blue, practically white
  endC = color(0, 160, 180, 255); //Blue that is only a small bit transparent

  float startR, startG, startB, startT;
  float endR, endG, endB, endT;
  float deltaR, deltaG, deltaB, deltaT;

  startR = red (startC);
  startG = green (startC);
  startB = blue (startC);
  startT = alpha (startC);
  endR = red (endC);
  endG = green (endC);
  endB = blue (endC);
  endT = alpha (endC);
  deltaR = (endR-startR)/(steps-1);
  deltaG = (endG-startG)/(steps-1);
  deltaB = (endB-startB)/(steps-1);
  deltaT = (endT-startT)/(steps-1);

  int e=0;
  while (e< steps) {
    fill (startC);
    rect(a, b, w, h);

    startR += deltaR;
    startG += deltaG;
    startB += deltaB;
    startT += deltaT;
    startC = color(random(startR-1, startR+1), random(startG-1, startG+1), random(startB-2, startB+2), random(startT-1, startT+1));
    b +=h;
    e++;
  }

  //The following code creates an image of sand below the ocean

  fill (255, 100, 0, 190);
  rect (0, hzny+(height-hzny)/2, width, height-hzny/2);
  float sand=0;
  while (true) {
    noStroke();
    fill (random(220, 255), random(150, 170), random(40, 90), random(180, 255));
    ellipseMode(CENTER);
    ellipse (random(0, width), random(hzny+(height-hzny)/2, height), width/150, height/150);
    sand = sand+1;
    if (sand >=100000) break;
  }
}


/* The following code creates a function to draw a dark grey colored cloud made up of ellipses where x and y give
 the initial positions of the cloud.  y is based off of mouseY when the mouse is clicked.
 */

void drawdarkcloud (float x, float y) {

  stroke(0);
  float hznydiff = hzny-mouseY; //variable which is the difference between the horizon y coordinate and mouseY
  strokeWeight(10*hznydiff/height);
  fill (160);
  float i=0;
  while (true) {
    ellipse (x+ hznydiff/4*sin(i), min(hzny-(hznydiff)/3, mouseY + y) + hznydiff/12*cos(i), (hznydiff)/3, (hznydiff)/6);
    i = i+.785;
    if (i>=6.28) break;
  }
}

/* The following code creates a function to draw boats in the nightime ocean where sx and sy give the
 initial positions of the boat.  y is based off of mouseY when the mouse is clicked.
 */

void drawboat (float sx, float sy) {

  float sbegin = hzny+(height-hzny)/2;
  noStroke();
  fill(0);
  beginShape();
  vertex(sx, min(sy+mouseY, sbegin-(height-sbegin)/6));
  bezierVertex(sx+(mouseY-hzny)/6, min(sy+mouseY, sbegin-(height-sbegin)/6)+(mouseY-hzny)/5, sx+(mouseY-hzny)/2, 
  min(sy+mouseY, sbegin-(height-sbegin)/6)+(mouseY-hzny)/5, sx+2*(mouseY-hzny)/3, min(sy+mouseY, sbegin-(height-sbegin)/6));
  endShape (CLOSE);  // This shape created the base of the boat

  strokeWeight(max(1, (mouseY-hzny)/40));
  stroke(20, 255);
  strokeCap(SQUARE);
  line(sx+(2*(mouseY-hzny)/3)/2, min(sy+mouseY, sbegin-(height-sbegin)/6), 
  sx+(2*(mouseY-hzny)/3)/2, min(sy+mouseY, sbegin-(height-sbegin)/6)-(mouseY-hzny)/5);
  fill(0, 100, 0);
  stroke(0);
  triangle(sx+(2*(mouseY-hzny)/3)/2, min(sy+mouseY, sbegin-(height-sbegin)/6)-(mouseY-hzny)/5, sx+(2*(mouseY-hzny)/3)/2, 
  min(sy+mouseY, sbegin-(height-sbegin)/6)-(mouseY-hzny)/3, sx+(2*(mouseY-hzny)/3)/4, min(sy+mouseY, sbegin-(height-sbegin)/6)-(mouseY-hzny)/4);
}

/* The following code creates a function to draw grey rocks made up of ellipses and rectangles where rx and ry give the
 initial positions of the rock.  y is based off of mousY when the mouse is clicked.
 */

void drawrock (float rx, float ry) {

  float sbegin = hzny+(height-hzny)/2; // variable which gives the y coordinate of where the sand starts
  noStroke();
  float i=0;
  ellipseMode(CORNER);
  while (true) {
    fill(60, random(80, 100));
    strokeWeight(0.05);
    stroke(10);
    rect (rx+ (mouseY-sbegin)/24*sin(i), mouseY+ ry + (mouseY-sbegin)/24*cos(i), (mouseY-sbegin)/3, (mouseY-sbegin)/6);
    fill(62, random(20, 40));
    noStroke();
    ellipse (rx+ (mouseY-sbegin)/24*sin(i), mouseY+ ry + (mouseY-sbegin)/24*cos(i), (mouseY-sbegin)/3, (mouseY-sbegin)/6);
    i = i+.785;
    if (i>=6.28) break;
  }
}

void draw() {
}

void mousePressed() {

  float hznydiff = hzny-mouseY;
  ellipseMode(CENTER);

  if (mouseY < hzny) {

    smooth();
    noStroke();
    fill (0, 0, 120);
    rect (0, 0, width, hzny);
    fill(255);
    ellipse (9*width/10, mouseY, hznydiff/3, hznydiff/3); //This command created the moon

    // The following commands create a glow around the moon
    float i=1;
    while (true) {
      fill(255, 23-i);
      ellipse (9*width/10, mouseY, i*hznydiff/16, i*hznydiff/16);
      i = i+.5;
      if (i>16) break;
    }

    /* The following code creates clouds in the nightime sky that get smaller as you click closer to the horizon
     where the entries give the x and y positions of the cloud (y position in relation to where you click)
     */

    drawdarkcloud (10, 0);
    drawdarkcloud (50, 5);
    drawdarkcloud (100, -10);
    drawdarkcloud (150, 15);
    drawdarkcloud (200, 10);
    drawdarkcloud (240, 30);
    drawdarkcloud (2*width/5, -5);
    drawdarkcloud (width/2, 20);
    drawdarkcloud (3*width/5, -15);
    drawdarkcloud (2*width/3, 0);
    drawdarkcloud (7*width/10, 20);
    drawdarkcloud (width, 90);
  }

  else if (mouseY > hzny && mouseY < hzny + (height-hzny)/2) {

    // The following set of commands create an ocean below the horizon during the nightime

    noStroke();
    fill(255);
    rect(0, hzny, width, (height-hzny)/2);

    noStroke();
    int steps = 1000;
    float a = 0.0;
    float b = hzny;
    float w = width;
    float h = (height-hzny)/(2*steps); 

    color startC, endC;
    startC = color(180, 200, 255); // Lighter blue
    endC = color(0, 90, 200); // Darker blue

    float startR, startG, startB, startT;
    float endR, endG, endB, endT;
    float deltaR, deltaG, deltaB, deltaT;

    startR = red (startC);
    startG = green (startC);
    startB = blue (startC);
    startT = alpha (startC);
    endR = red (endC);
    endG = green (endC);
    endB = blue (endC);
    endT = alpha (endC);
    deltaR = (endR-startR)/(steps-1);
    deltaG = (endG-startG)/(steps-1);
    deltaB = (endB-startB)/(steps-1);
    deltaT = (endT-startT)/(steps-1);

    int e=0;
    while (e< steps) {
      fill (startC);
      rect(a, b, w, h);

      startR += deltaR;
      startG += deltaG;
      startB += deltaB;
      startT += deltaT;
      startC = color(random(startR-1, startR+1), random(startG-1, startG+1), random(startB-2, startB+2), random(startT-1, startT+1));
      b +=h;
      e++;
    }

    // The following commands create boats in the nightime ocean

    drawboat (0, 0);
    drawboat (width/4, 10);
    drawboat (3*width/5, 0);
    drawboat (3*width/4, 20);
  }

  else {

    // The following code creates an image of darker sand below the nightime ocean

    noStroke();
    fill (185, 30, 0, 120);
    rect (0, hzny+(height-hzny)/2, width, height-hzny/2);
    float sand=0;
    while (true) {
      noStroke();
      fill (random(180, 215), random(110, 130), random(0, 50), random(140, 215));
      ellipseMode(CENTER);
      ellipse (random(0, width), random(hzny+(height-hzny)/2, height), width/150, height/150);
      sand = sand+1;
      if (sand >=50000) break;
    }

    // The following code draws nine rocks (for each mouse click) across the sand that get smaller as they approach the horizon/shoreline

    drawrock(0, 0);
    drawrock(width/8, 10);
    drawrock(width/4, 20);
    drawrock(3*width/8, 15);
    drawrock(width/2, 5);
    drawrock(5*width/8, 12);
    drawrock(3*width/4, 8);
    drawrock(7*width/8, 17);
    drawrock(width, 10);
  }
}


