
/*****************************************
 * Assignment 2
 * Name:    Mirella Deocadiz
 * E-mail:  ldeocadiz@brynmawr.edu
 * Course:      CS 110 - Section 02
 * Submitted:    02/07/2012
 *
 * This program shows a beach scene. The background is made up of the sea and the sky with a sun (created by an iteration). 
 * Begin by clicking above the horizon line to make the mountains and clouds appear. Be aware though that you have to click a bit higher for the clouds.
 * Next, check out all of the colourful, tropical fish by dragging your mouse around in the sea. They don't swim too close to the shore where, when you
 * click, you'll find the island in the sun with a colourful umbrella to shield you from the sun's strong rays. Click the sea and the umbrella will change
 * colour!s
 ***********************************************/
void setup () {
  size (600, 600);
  smooth ();
  noStroke ();
  drawSun (width);

  //background 
  fill (0, 0, 255, 25);
  noStroke ();
  quad (0, 0, width, 0, width, height/2, 0, height/2);

  fill (0, 100, 255, 70);
  quad (0, height/2, width, height/2, width, height, 0, height);
}

//the sun
void drawSun (int w) {
  for (int i=w; i>1; i-=30) {
    fill (255, 255, 0, 50);
    ellipse (520, 60, i, i);
  }
}

//draw mountains - attempt to do this at the horizon line and on the opposite 
//side of the sun
void mousePressed() {
  if (mouseY<height/2 && mouseY>height/3 && mouseX<width/2) {
    fill (85, 107, 47);
    stroke (10);
    strokeWeight (1);
    arc (mouseX+20, height/2, 326, 240, 3.171, 6.266);
    fill (0, 100, 0);
    arc (mouseX-20, height/2, 350, 160, 3.171, 6.266);
    fill (139, 69, 29);
    arc (mouseX-100, height/2, 76, 76, 3.158, 6.274);
  }

  //island under the sun
  {
    if (mouseY>height/2) {
      fill (160, 82, 45, 85);
      stroke (0, 0, 0);
      strokeWeight (1);
      ellipse (width/2, height, width, height/3);

      //umbrella with random colours
      strokeWeight (2);
      line (width/2, height, width/3, height/3*2);
      fill (random(255), random(255), random(255));
      triangle (width/3+200, height/3*2-100, width/3-150, height/3*2+100, width/3-100, height/3*2-200);
    }
  }
  //clouds
  if (mouseX<height/2 && mouseY<height/3 && mouseX<width/2) {
    fill (255, 255, 255, 50);
    noStroke ();
    ellipse (mouseX, mouseY, 40, 40);
    ellipse (mouseX+20, mouseY, 50, 50);
    ellipse (mouseX-25, mouseY, 40, 40);
    ellipse (mouseX, mouseY+10, 50, 50);
    ellipse (mouseX, mouseY-5, 20, 20);
  }
}

//tropical fish by the shore
void draw () {
  frameRate(20);
  float angle=0;
  if (mouseY>height/2 && mouseY<height-100 && mouseX>width/2) {
    fill(random(255), random(255), random(255), 50);
    noStroke ();
    angle = angle + 0.3;
    float dX = 30.0*cos(angle);
    float dY = 30.0*sin (angle);
    ellipse(mouseX + dX, mouseY - dY, 10, 10);
    triangle (mouseX, mouseY, mouseX+10, mouseY+5, mouseX+10, mouseY-5);
    ellipse (mouseX - dX, mouseY - dY, 10, 10);
  }
}


