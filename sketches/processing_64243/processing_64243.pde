
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
  beginShape();
  for ( int i = 0; i < pnts.length; i++ ) {
    vertex( pnts[i].x + random(-randomNess, randomNess), pnts[i].y + random(-randomNess, randomNess) );
  }
  endShape(CLOSE);
}

if(!online)saveFrame("frame.png");

