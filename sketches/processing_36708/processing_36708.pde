
//Alex Nelson

void setup() {
  size(600, 300);
  colorMode(RGB, 50);
  background(25);
}

float count = 300;
float ellipseSize = 50;
float num = 2000;

void draw() {

  if (count>0);

//smaller ellipses;varying white shades;on the right side of the screen(350-600)
  if (count < num) {
    if (count % 5 == 0) {
      ellipseSize = random(5, 100); 
      fill(random(255));
      ellipse(random(350, 600), random(0, 300), ellipseSize, ellipseSize);
    }
  }

//larger ellipses;varying grey to black shades;on the right side of the screen(350-600)
  if (count < num) {
    if (count % 5 == 0) {
      ellipseSize = random(100, 200); 
      fill(random(50));
      ellipse(random(350, 600), random(0, 300), random(ellipseSize), random(ellipseSize));
    }

//smaller ellipses;varying white shades;in the middle of the screen(150-400)
    if (count < num) {
      if (count % 3 == 0) {
        ellipseSize = random(5, 100); 
        fill(random(255));
        ellipse(random(150, 400), random(0, 300), ellipseSize/3, ellipseSize/3);
      }
    }

//larger ellipses;varying grey to black shades;on the middle of the screen(150-400)
    if (count < num) {
      if (count % 3 == 0) {
        ellipseSize = random(100, 200); 
        fill(random(50));
        ellipse(random(150, 300), random(0, 300), random(ellipseSize/3), random(ellipseSize/3));
      }
    }
    
//smaller ellipses;varying white shades;on the left side of the screen(0-200)
    if (count < num) {
      if (count % 1 == 0) {
        ellipseSize = random(5, 100); 
        fill(random(255));
        ellipse(random(0, 200), random(0, 300), ellipseSize/10, ellipseSize/10);
      }
    }
    
//larger ellipses;varying grey to black shades;on the left side of the screen(0-200)    
    if (count < num) {
      if (count % 1 == 0) {
        ellipseSize = random(100, 200); 
        fill(random(50));
        ellipse(random(0,200), random(0, 300), random(ellipseSize/10), random(ellipseSize/10));
      }
    }
    
      count++;
    }
  }


