
// Introduction to Computational Arts: Processing
// Project 3 (Final Project)
// Michael Kruger 2014-03-05

/* Points and lines.
 Press the mouse button to create dripples on the canvas. 
 On mouse release a line from the center of the dripple to a random location 
 is drawn. Try to create a nice composition. Play.
 On mouse drag there will be some digital gliches (noise) in form of random 
 vertical lines drawn. 
 Keyboard: 
 s : save png
 */

float x = 0;
float y = 0;
float diam = 2.1;
float fade = 255;
float xdirection;
float ydirection;

void setup() {
  background(255);
  size(720, 720);
}

void draw() {
  noFill();
  strokeWeight(1);

  float xfactor = width/8;
  float yfactor = height/8;



  stroke(10, 53, 108, fade);


  if (mousePressed) {
    pushMatrix();
    translate(mouseX, mouseY);

    ellipse(x, y, diam, diam);
    //ellipse(x+random(xfactor), y+random(yfactor),diam, diam);

    diam *= 1.1;
    fade += -4.6;

    popMatrix();
  }
}

void mouseReleased() {
  diam = 2.1;
  fade = 255;

  stroke(204, 102, 0);

  pushMatrix();
  translate(mouseX, mouseY);
  line(0, 0, random(-width, width), random(-height, height));
  popMatrix();
}

void mouseDragged() {
  stroke(234, 204);

  float a = random(width);
  line(a, 0, a, height);
}

// keyPressed()
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("sreenshot.png");
}



