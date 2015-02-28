
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Sunhyun
// ID: 201420067

void setup() {
  size (600, 600);
  background(255);
  smooth();
}

void draw() {

for (int i = 0; i < 650; i = i +100) {
for (int j = 0; j < 650; j = j +100) {

      fill(#FFC9C9);
      
      fill(255);
      strokeWeight (4);      
      rect(i, j, 200, 200);

      fill(255);  
      strokeWeight(3);
      ellipse(i, j, 80, 80);

      fill(#FFC9C9);
      strokeWeight (2); 
      ellipse(i, j, 70, 70);
      fill(255);
      ellipse(i, j, 60, 60);
      ellipse(i, j, 50, 50);

      fill(0);
      rect(i, j, 5, 100);
      rect(i, j, 100, 5);
    }
  }
}

