
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Eunjin Park
// ID: 201420079

float a;
float angle;

void setup() {
  size(600, 600);
  smooth();
  background(0);
}


void draw() {
  angle += 0.01;
  translate(width/2, height/2); 
  for (int i = -250; i < 400; i = i + 100) {
    for (int j = -250; j < 400; j = j + 100) {
      quad1(i, j);
    }
  }
  rotate(angle);
  fill(random(255),random(255),random(255));
  rectMode(CENTER);
  rect(0, 0, 300, 300);
}

void quad1 (int x, int y) {
  fill(255   );
  quad (x, y-50, x+20, y-30, x, y-10, x-20, y-30);
  quad (x, y+10, x+20, y+30, x, y+50, x-20, y+30);
  quad (x+30, y-20, x+50, y, x+30, y+20, x+10, y);
  quad (x-30, y-20, x-50, y, x-30, y+20, x-10, y);
}  

void keyPressed() {
  background(random(255));
}

