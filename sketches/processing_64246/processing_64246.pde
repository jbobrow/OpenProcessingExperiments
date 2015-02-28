


import geomerative.*;

size(600, 400);
smooth();

RG.init(this);
RFont font = new RFont( "ArialRounded.ttf", 180, RFont.CENTER);

background(255);
translate(width/2, height/2);

RGroup grp = font.toGroup("Hello!");

RCommand.setSegmentLength(2);
RCommand.setSegmentator(RCommand.UNIFORMLENGTH);



float randomNess = 5;

noFill();
for (RGeomElem element:grp.elements) {
  RPoint[] pnts = element.getPoints();


  for ( int i = 0; i < pnts.length; i++ ) {
    //beginShape();
    for (float noiseStrength = 0; noiseStrength < 255;noiseStrength+= 1) {
      float alpha = noiseStrength / 255;
      alpha = pow(alpha, 0.3);
      stroke(0, 255 - alpha * 255);
      float noiseX = (noise(pnts[i].x * 0.03, pnts[i].y * 0.03+1000, noiseStrength * 0.01) - 0.5) * noiseStrength ;
      float noiseY = (noise(pnts[i].x * 0.03, pnts[i].y * 0.03, noiseStrength * 0.01) - 0.5) * noiseStrength ;
      point( pnts[i].x + noiseX, pnts[i].y + noiseY);
    }
    //endShape();
  }
}

if(!online)saveFrame("frame.png");

