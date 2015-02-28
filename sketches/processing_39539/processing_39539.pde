
/*
 Strings and Blueprints
 Copyright Engin Ayaz
 Student at NYU ITP program, Class of 2013
 ICM Class
 Week 3 Homework
 Sep 26 2011
 */

int strokeFuzz=4; //sets stroke thickness. Higher number implies thicker stroke. 
int strokeLucidity=5; // sets stroke translucency. Lower number implies more translucent stroke.
int lineDensity=25; //determines the space between each line horizontally
int eraserStrength=15; //determines the extent the drawing is erased using the space bar

void setup() {
  size(1050, 350);
  background(0);
  frameRate(60); //make it fast enough for smooth responsiveness to the mouse
  println("With your right hand, move the mouse around to draw. Press the mouse to change line colors. With your left hand, press SPACE to slowly erase your work. Press ENTER to freeze.");
}

void draw() {
  smooth();
  // to prevent the drawing to start with lines from 0,0 
  // before the user interacts with it
  if (mouseX != 0 && mouseY != 0)
  {
    for (int i=-100; i<=width+100; i+=lineDensity) {
      smooth();
      noFill();
      if (mousePressed) {
        strokeWeight(random(2, strokeFuzz));
        stroke(random(80, 220), 0, 255, random(strokeLucidity));
      }
      else {
        strokeWeight(random(strokeFuzz));
        stroke(245, random(0, 245), 0, random(strokeLucidity));
      }
      line(i, 0, mouseX, mouseY);
      line(i, height, mouseX, mouseY);
    }
  }
}

// for erase and freeze functionality
void keyPressed() {
  if (key == ' ') {
    fill(0, eraserStrength);
    rect(0, 0, width, height);
  }
  if (key == ENTER || key== RETURN) {
    noLoop();
  }
}


