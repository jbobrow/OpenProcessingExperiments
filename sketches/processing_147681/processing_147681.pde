
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Sunhyun
// ID: 201420067

void setup() {
  size (1024, 768);
  background(255);
  smooth();
}

void draw() {

  for (int i = 0; i < 1024; i = i +73) {
    for (int j = 0; j < 768; j = j +130) {


      fill(#AFE6FF);
      strokeWeight (15);      
      rect(i, j, 130, 100);

      fill(#74AAFF);  
      stroke(255);
      strokeWeight(5);
      rect(i, j, 150, 50);

      stroke(255);
      fill(#74AAFF);
      strokeWeight(1);
      ellipse(i-60, j-13, 13, 13);

      fill(255);
      ellipse(i, j+50, 50, 50);
    }
  }
}
