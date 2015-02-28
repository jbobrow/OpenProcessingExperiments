
//assignment 4
/* I would like to create the feeling that one can move deeply
into space in this interactive sketch.  I would like to 
create an elegant design and will use a greyscale color
palette. I will offset the center so that the composition is not
so evenly balanced.*/

color strokeColor = color(0, 10);

void setup() {
  size (1280, 720);
  colorMode(RGB, 255);
  background(255);
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    translate(width/5, height/2);

    int circleResolution = (int)map(mouseY + 100, 0, height, 2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;

    strokeWeight(2);
    stroke(strokeColor);

    beginShape();
    for (int i=0; i<=circleResolution; i++) {
      float x = 0 + sin(angle*i)*radius;
      float y = 0 + cos(angle*i)*radius;
      vertex(x, y);
    }
    endShape();
    popMatrix();
  }
}

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");

  switch(key) {
  case '1':
    strokeColor = color(random(0,75));
    fill(random(0, 255), 15);
    break;
  case '2':
    strokeColor = color(random(200,225));
    fill(random(0, 255), 10);
    break;
  case '3':
    strokeColor = color(random(0,75));
    fill(random(0, 255), 5);
    break;
  }
}


