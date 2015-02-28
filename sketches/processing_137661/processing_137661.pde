
void setup() {
  size(600,600);
  background(200, 220, 220);
  //fill(255, 255, 200);
  noStroke();
  smooth();
}

void draw() {
  
  //draw the dandelion
  for (int i = 0; i < 6; ++i) {
    translate(50,50 + i*100);
    figureRow(); 
    translate(-650,- (50 + i*100));  //reset (0,0)
  }
  
  //TODO draw the red dots
  for (int j = 0; j < 5; ++j) {
    translate(95, 100 + j*100);
    for (int i = 0; i < 5; ++i) {
      translate(95 + i*100, 100);
      redDot();
      translate(-(95 + i*100), -100);  //reset (0,0)
    } 
    translate(-95, - (100 + j*100));  //reset (0,0)
  }
}

void figureRow() {
  for (int i = 0; i < 6; ++i) {
    outerFigure();
    translate(100, 0);
  }  //position: (650, 50);
}

void outerFigure() {
  innerFigure();
  for (int i = 0; i < 16; ++i) {
    rotate(PI/8);
    innerFigure();
  }
}

void innerFigure() {
  ellipseMode(RADIUS);
  fill(255, 255, 200);
  ellipse(10, 20, 5, 75/4);
}

void redDot() {
  ellipseMode(CENTER);
  fill(255, 100, 100);
  ellipse(5, 5, 5, 5);
}


