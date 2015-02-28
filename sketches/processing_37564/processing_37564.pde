
/*

 Ben Turner
 NYU-ITP, Intro to Computational Media
 
 Week #2 homework: rotate/transform/animate
 
 Nyan Cat colors and images via Elie Kahwagi on
 openprocessing.org.  Thanks!
 
 http://www.openprocessing.org/visuals/?visualID=33045
 
 */

int quadrant=1; // quadrant is 1-4 on x/y axis, 1 being +x, +y
int x=0; // x-boundary for nyan cat's orbit
int y=-100; // y-boundary for nyan cat's orbit, starts above nyan cat
PImage nyan;
PImage rainbow;

void setup() {
  size(800, 400);
  background(0, 68, 120); // sets nyan cat blue bg!
  noFill();
  stroke(0);
  smooth();
  frameRate(20); // too fast and it flies in a browser, too slow is choppy
  nyan = loadImage("Nyan.png");
  rainbow = loadImage("Rainbow.png");
} // end setup()

void draw() {
  background(0, 68, 120);
  stroke(255);
  fill(255);
  for (int z=0;z<30;z++) { // draws random stars of random sizes
    float zx=random(800);
    float zy=random(800);
    float diameter=random(10);
    int(zx); // have to convert floats to ints for grid coords
    int(zy);
    int(diameter);
    ellipse(zx, zy, diameter, diameter);
  }
  PFont fontPortrait; // I don't like that it adds a lot to total dl size
  fontPortrait = loadFont("Helvetica-48.vlw");
  textFont(fontPortrait, 30);
  fill(255);
  text("KEEP MOUSE BUTTON PRESSED", 200, 50);
  text("TO GUIDE LIL' NYAN CAT", 280, 100);
  textFont(fontPortrait, 30);
  // lets you guide nyan cat, and also admire him while stopped!
  if (mousePressed == true) {
    translate(mouseX-50, mouseY-50);
    image(rainbow, 30, 5, -1000, 48.644); // offset for rainbow, made wider
    image(nyan, 0, 0);
  }
  else { // if mouse button not pressed

    switch (quadrant) {
    case 1:
      if (x<=100) {
        x+=5;
        y+=5;
      }
      else { 
        quadrant = 2;
      }
      break;
    case 2:
      if (x>0) {
        x-=10;
        y+=10;
      }
      else { 
        quadrant = 3;
      }
      break;
    case 3:
      if (x>-100) {
        x-=10;
        y-=10;
      }
      else { 
        quadrant = 4;
      }
      break;
    case 4:
      if (x<=0) {
        x+=10;
        y-=10;
      }
      else { 
        quadrant = 1;
      }
      break;
    }
    translate(mouseX-50+x, mouseY-50+y); // offset from mouse pos
    image(rainbow, 30, 5, -1000, 48.644); // rainbow offset, wider
    image(nyan, 0, 0);
  } // end if else mouse button not pressed
} // end draw()


