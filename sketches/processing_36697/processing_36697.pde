


void setup() {
  size(300, 500);
  colorMode(HSB, 75);
  stroke(237, 6, 80);
  smooth();
  background(0);

  //speed at which the rectangles appear
  frameRate(10);
}


float count = 30;
float rect;
float rndColor;


void draw() {
  //horizon line
  fill(0, 10);
  rect(150, 400, width, 100);

//random rectangles in 2 colors
  if (count > 0) {
    rndColor = random(50);
    if (rndColor > 25) { 
      fill(66, 62, 150, 10);
    }
    else {
      fill(0, 100, 120, 20);
    }

    // draw random rectangles
    rectMode(CENTER);   
    rect = random(10, 50);
    rect(random(width), random(height), rect, rect+100);
    count--;
  }
  
  
  //random length blinking line
  rndColor = random(width);
  if (rndColor > 25) { 
    fill(66, 62, 150, 10);
    rect (0, 400, random(width), 50) ;
  }
}


