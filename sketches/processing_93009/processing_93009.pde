
float x, y;
boolean whiteBGColour;

void setup () {
  size(500, 500);
  x = 0;
  y = 200;
  background(255);
  whiteBGColour = true;
}

void draw () {
  x = mouseX;
  y = mouseY;

  fill(177);
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(0, 25));
  
  rect(x, y, 50, 150);
  fill(255);
  ellipse(x+25, y-60, 150, 150);
  fill(0);
  ellipse(x-25, y-60, 40, 70);
  ellipse(x+75, y-60, 40, 70);
  line(x-25, y+175, x, y+150);
  line(x+75, y+175, x+50, y+150);
}

void mousePressed () {
  if (whiteBGColour) {
    background(0);
  } else {
    background(255);
  }
  whiteBGColour = !whiteBGColour;
}



