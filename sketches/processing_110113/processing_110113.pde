
//draw polygon with number of sides
void setup() {
  size(800, 800);
}

void draw() {
  background(5);

  int xLoc = width/2;
  int yLoc = height/2;


  float rotation = -HALF_PI;
  int sides = 150;
  int radius = width/2-20;
  strokeWeight(1);
  noFill();
  stroke(240);

  beginShape();

  for (int i=0; i<sides+3;i++) {
    float theta = TWO_PI*i/sides;
    float rf;//radius factor

    if (i%2==0) {
      rf = mouseX*.001;
    }
    else {
      rf=-.5*mouseY;
    }

    float x = rf*radius * cos(theta+rotation)+xLoc;
    float y = rf*radius * sin(theta+rotation)+yLoc;

    curveVertex(x, y);
  }
  endShape(CLOSE);
}



