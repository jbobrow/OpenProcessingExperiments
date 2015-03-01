
/* --------------------------------------------------------------------------
 * Generative art test
 * --------------------------------------------------------------------------
 * Generative art a pratical guide using processing
 * Matt Pearson foreword by marius watz
 * --------------------------------------------------------------------------
 * p. xxiii
 * Listing i.1 A generative system in 24 lines of code
 * ----------------------------------------------------------------------------
   Isabella Terruso code
 */

void setup(){
  size(1300, 800, P3D); //grandezza schermo
  background(0); //0= black
  stroke(100, 150);
  fill(255, 255, 255); //color object = red 208 28 28
                        //              bianco= 255  255  255
  
  float xstart = random(150);
  float ynoise = random(150);
  
  translate(width/2, height/2, 0);
  for(float y = -(height/8); y <=(height/8); y+=3){
    ynoise += 0.01;
    
    float xnoise = xstart;
    for (float x =-(width/8); x <=(width/8); x+=3) {
      xnoise +=0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 5, y * noiseFactor * 5, -y);
  float edgeSize = noiseFactor * 6; //spessori point
  ellipse(2, 2, edgeSize, edgeSize);
  popMatrix();
}
