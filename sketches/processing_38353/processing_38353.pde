
//Project One
//Danielle Scesney

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
}

void mousePressed() {
  background(0);
  //grid 1. 50 x 50
  for (int x=50; x<width; x+=50) {
    for (int y=50; y<height; y+=50) {
      strokeWeight(.5);
      stroke(100);
      line(x, 0, x, width);
      line(0, y, height, y);
    }
  }
  //grid 2. 100 x 100.
  for (int x=90; x<width; x+=100) {
    for (int y=90; y<height; y+=100) {
      strokeWeight(.5);
      stroke(50);
      line(x, 0, x, width);
      line(0, y, height, y);
    }
  }

  //bottom right quadrant fill.
  for (float rsizex=50; rsizex<300; rsizex+=random(50,200)) {
    for (float rsizey=50; rsizey<300; rsizey+=random(50,200)) {
      noStroke();
      fill(255, random(100));
      rect(150, 250, rsizex, rsizey);
    }
  }
  //red cross-piece fill.
  for (float rsizex=50; rsizex<500; rsizex+=random(50,300)) {
    fill(200, 0, 0, random(200));
    rect(150, 200, rsizex, 50);
    rect(140, 200, -rsizex, 50);
  }
  //bottom left quadrant fill.
  for (float rsizex=50; rsizex<=200; rsizex+=random(50,100)) {
    fill(255, random(100));
    rect(140, 250, -rsizex, 100);
  }
  //top right quadrant fill.
  for (float rsizex=50; rsizex<=500; rsizex+=random(50,300)) {
    fill(255, random(100));
    rect(150, 200, rsizex, -100);
  }

  //top left quadrant fill.
  for (float rsizex=50; rsizex<=150; rsizex+=random(200)) {
    for (float rsizey=50; rsizey<=300; rsizey+=random(200)) {
      fill(255, random(100));
      rect(140, 200, -rsizex, -rsizey);
    }
  }

  //white lines.
  stroke(255);
  line(0, 200, 500, 200);
  line(0, 250, 500, 250);

  //red lines.
  stroke(190, 0, 0);
  strokeWeight(2);
  line(140, 0, 140, 500);
  line(150, 0, 150, 500);
}


