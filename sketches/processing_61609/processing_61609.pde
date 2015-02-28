
import processing.pdf.*;

int dim = 20;
int k = 0;

void setup() {
  size(800, 800);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  colorMode(HSB);
}

void draw () {
  background(255);
 //   beginRecord(PDF, "PdfTest.pdf");

  translate(dim, dim);

  fill(360,100,100);
  noStroke();

  for (int i = 0; i < width / dim; i++) {
    pushMatrix();
    for (int j = 0; j < height / dim; j++) {
      pushMatrix();
      rotate(radians(i * j + k));
      rect(0, 0, width/(width/dim), height/(height/dim));
      popMatrix();      
     
      pushStyle();
      fill(k, 100, 100);
      rect(0, 0, width/(width/dim), height/(height/dim));
      popStyle();
      
      pushMatrix();
      pushStyle();
      fill(255);
     // ellipse(0, 0, (width/(width/dim))/2, (height/(height/dim))/2);
      popStyle();
      popMatrix();

      translate(0, dim * 1.5);
    }
    popMatrix();
    translate(dim * 1.5, 0);
  }

if(k < 360) {
  k = k + 2;
} else {
  k = 0;
}
//    endRecord();
}


