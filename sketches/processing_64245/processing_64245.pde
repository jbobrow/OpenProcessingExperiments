
import processing.pdf.*;

import geomerative.*;

size(600, 400);
smooth();

RG.init(this);
RFont font = new RFont( "ArialRounded.ttf", 180, RFont.CENTER);

background(255);
translate(width/2, height/2);

RGroup grp = font.toGroup("Hello!");

RCommand.setSegmentLength(0.2);
RCommand.setSegmentator(RCommand.UNIFORMLENGTH);



float randomNess = 5;

noFill();
for (RGeomElem element:grp.elements) {
  RPoint[] pnts = element.getPoints();
  for (float noiseStrength = 0; noiseStrength < 255;noiseStrength+= 10) {
    float alpha = noiseStrength / 255;
    alpha = pow(alpha,0.3);
    stroke(0,255 - alpha * 255);
    beginShape();
    for ( int i = 0; i < pnts.length; i++ ) {
      float noiseX = (noise(pnts[i].x * 0.05, pnts[i].y * 0.05+1000,noiseStrength * 0.001) - 0.5) * (noiseStrength + 30);
      float noiseY = (noise(pnts[i].x * 0.05, pnts[i].y * 0.05,noiseStrength * 0.001) - 0.5) * (noiseStrength + 30);
      vertex( pnts[i].x + noiseX, pnts[i].y + noiseY);
    }
    endShape(CLOSE);
  }
}

if(!online)saveFrame("frame.png");

