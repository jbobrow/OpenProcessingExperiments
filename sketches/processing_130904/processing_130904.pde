
int face;

void setup() {
  background(225);
  size(250, 250);
  noFill();
  smooth();
  stroke(0);
  strokeWeight(5);
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  Face1();
  faces(Key());
}

int Key() {
  if (key == CODED) {
    if (keyCode == UP) {
      face = 2;
    }
    else if (keyCode == DOWN) {
      face = 3;
    }
  }
   return face;
} //end 

void Face1() {
  fill(255, 204, 0);
  ellipse(125, 125, 200, 200);
  line(90, 70, 110, 70);
  line(160, 70, 180, 70);
  fill(0);
  ellipse(100, 90, 10, 10);
  fill(0);
  ellipse(165, 90, 10, 10);
  line(100, 150, 150, 150);
}

void SmileyFace() {
  fill(255, 204, 0);
  ellipse(125, 125, 200, 200);
  line(90, 70, 110, 60);
  line(160, 60, 180, 70);
  fill(0);
  ellipse(100, 90, 10, 10);
  fill(0);
  ellipse(165, 90, 10, 10);
  noFill();
  arc(125, 125, 100, 120, 0.2, PI - 0.2);
}
void FrownyFace() {
  fill(255, 204, 0);
  ellipse(125, 125, 200, 200);
  line(90, 70, 110, 80);
  line(160, 80, 180, 70);
  fill(0);
  ellipse(100, 90, 10, 10);
  fill(0);
  ellipse(165, 90, 10, 10);
  noFill();
  arc(125, 180, 100, 120, PI, TWO_PI);
  
}

void faces(int i) {
  if (i == 2) {
    background(0, 250, 89);
    SmileyFace();
  }
  if (i == 3) {
    background(250, 0, 8);
    FrownyFace();
  } 
}
  


