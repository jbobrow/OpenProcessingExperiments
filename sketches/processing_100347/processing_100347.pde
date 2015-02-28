
void setup() {
  size(600, 600);
  background(255);
  fill(0,0,0);
  float randomness = 0; 
  
  for (int row=0; row<8; row++)
    for (int column=0; column< 8; column++) {
      plotRandomisedQuad(column*80,row*80,50,50,randomness, randomness);
      randomness += 0.01;
    }
}

void plotRandomisedQuad(float x, float y, float w, float h, float randW, float randH) {
  float jitterW = w*randW;
  float jitterH = h*randH;
  beginShape();
    vertex(x+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
    vertex(x+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
    vertex(x+w+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
    vertex(x+w+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
    
  endShape(CLOSE);
}
