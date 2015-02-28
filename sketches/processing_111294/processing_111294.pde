
void setup() {
  size(600, 600);
  colorMode(RGB);
  //background(220, 212, 210);  light purple
  background(206, 208, 215);
  noStroke();
  smooth();
}

void draw() {
  for (int i=0;i<width;i=i+100) {
    for (int j=0;j<height;j=j+100) {
      for (int k=100;k>0;k=k-35) {

        //pink ellipses
        //stroke(255, 41, 91); 


        //cobalt blue
        //fill(31, 74, 219);
        //royal blue
        fill(25, 80, 215);
        ellipse(i+50, j+50, k/4, k/4);

        fill(k+70);

        ellipse(i+60, j+60, k/4, k/4);
        strokeWeight(2);

        //yellow ellipses

        stroke(216, 223, 47); 
        ellipse(i+60, j+60, k/5.5, k/5.5);
      }
    }
  }
}



