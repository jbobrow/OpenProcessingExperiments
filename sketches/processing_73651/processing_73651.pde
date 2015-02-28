
int counter;

void setup () {
  size(500, 500);
  smooth();
  background(8, 196, 210);
}

void draw() {


  fill(230);
  noStroke();
  rect(0, 0, 500, 500);

    for (int a= 10; a<500; a +=20) {
    for (int b= 20; b<500; b +=20) {

      smooth();
      fill(86, 170, 183);
      noStroke();

      fill(8, 196, 210);
      ellipse(a, b, 15, 15);
      stroke(8, 196, 210);


      if (mousePressed==true) {
        fill(255, 179, 213);
        ellipse(a, b, 10, 10);
        stroke(255, 179, 213);}
        
      if (mousePressed==true) {
        fill(118, 240, 150);
        stroke(118, 240, 150);
        ellipse(b, a, 5, 5);
        
        
      }
    }
  }
}
