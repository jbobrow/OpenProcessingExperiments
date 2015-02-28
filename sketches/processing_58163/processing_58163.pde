
// Created by Liangjie Wu
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell 

// Rural landscape pattern at Linpan, Chengdu, China

void setup()
{
   size(700, 450); smooth(); noLoop();  strokeCap(PROJECT); 
}

void draw()
{
  background(128);
  strokeWeight(1);
  translate(width/2, height/2);
  farm(0, 0, 600, 30);
}

void farm(int xLoc, int yLoc, int sizeRing, int numRing) {
float grayValues = 255/numRing;
float steps = sizeRing/numRing;

  for(int i=0; i<numRing; i++) {
   fill(128+i*(255/steps)/2);
   stroke(128-i*(255/steps)/2);
   ellipse(xLoc, yLoc, sizeRing-i*steps, sizeRing-i*steps);
  }
   
  for(int i=0; i<numRing-5; i++) {
    pushMatrix();
    for(int j=1; j<numRing-5; j++)
    {
        stroke(i*(255/steps)/2);
        rotate (-(PI/(i+7))*random(numRing+1));
        line (xLoc+i*steps/2, yLoc, xLoc+(i+1)*steps/2,yLoc);
        pushMatrix();
        translate(xLoc+(i)*steps/2 + random(0,steps/2),yLoc);
        rotate (PI/2);
        line (0,0,5,0);
        popMatrix();
    }
    popMatrix();

   
  }
}

void mouseReleased() {
  redraw();
}
void mousePressed ( ) {
save ("image.jpg"); }

