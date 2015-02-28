
void setup() {
  size (600, 700);
  background(255);
  smooth();
}

void draw() {
  for (int h=100; h<700; h+=200) {
    for (int i=100; i<700; i+=100) {
      face(h,i, round(random(0,255)));
    }
  }
}

void face(float x, float y,float z) {  
  //head
  noStroke();
  fill(z*10,z/2,z+40);
  ellipse (x, y, 200, 200); 
  //bags under eyes
  fill(105, 163, 183, 100);
  ellipse(x+45, y-40, 60, 30);
  ellipse(x-45, y-40, 60, 30);
  //eyes
  fill(255, 255, 255);
  ellipse (x+50, y-50, 60, 30);
  ellipse (x-50, y-50, 60, 30);
  //pupils
  fill (0);
  ellipse (x+45, y-45, 20, 20);
  ellipse (x-45, y-45, 20, 20);
  //blush
  fill(255, 178, 178, 100);
  ellipse (x+75, y-10, 25, 25);
  ellipse (x-75, y-10, 25, 25);
  //mouth
  fill(0);
  arc (x, y, 150, 150, radians(0), radians(180));
  //teeth
  fill(255);
  for (float i=0;i<130; i+=20) {
    arc ((x-60)+i, y, 20, 20, radians(0), radians(180));
  }
}

