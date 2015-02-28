
void setup() {
  size(500, 500);
  background(0);
  frameRate(1);
}

int newPoint = 0;
int fillCol =0;
void draw() {
  for (int i=0; i<10; i++) {

    fillCol=round(random(255));
    
    for (int j=0; j<10; j++) {
      fillCol+= 25.5;
      rect(random(500), random(500), 2, 2);

      fill(fillCol);
    }
    
    fillCol=0;
  }
}



