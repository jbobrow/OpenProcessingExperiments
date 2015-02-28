
//import processing.pdf.*;

int numlines = 10;
float freq = 1;

void setup() {
  size(800,800);
  // size(800, 800, PDF, "assm2.pdf");
  //noLoop();
  smooth();
}

void draw() {
  background(0);
  stroke(0);
  strokeWeight(1);
  
  for (int i = 0; i < numlines; i++)
  {
    pushMatrix();
    translate(0, 0);
    noFill();
    stroke(255);

    beginShape();
      float numsteps = random(100, 500);
        for (int x=0; x < numsteps; x+=8)
        {
          
          float n = noise(x*freq+563541135, i*300)*mouseX; 
  
          vertex(x, n);
          vertex(n, x);
          vertex(i, n);
        }
    endShape();
    popMatrix();
  }

  
//exit();
}
