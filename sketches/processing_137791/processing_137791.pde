
import processing.pdf.*;

int numlines = 50;
float freq = .01;

void setup() {
  size(800, 800, PDF, "assm2.pdf");
  noLoop();
  smooth();
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(1);



  for (int i =0; i < numlines; i++)
  {
    pushMatrix();
    translate(0, 0);
    noFill();
    stroke(0);

    beginShape();
      float numsteps = random(20, 500);
        for (int x=0; x < numsteps; x+=20)
        {
          
          float n = noise(x*freq+14935, i)*1000; 
          println(n);
          vertex(x, n);
          vertex(x, x);
          vertex(n, x);
          vertex(n, n);
        }
    endShape();
    popMatrix();
  }

exit();
}
