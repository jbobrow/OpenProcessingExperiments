
import geomerative.*;

size(600, 400);
smooth();

RG.init(this);
RFont font = new RFont( "ArialRounded.ttf", 180, RFont.CENTER);

background(0);
translate(width/2, height/2);

RGroup grp = font.toGroup("Hello!");

RCommand.setSegmentLength(10);
RCommand.setSegmentator(RCommand.UNIFORMLENGTH);



float randomNess = 5;

noStroke();
for (RGeomElem element:grp.elements) {
  RPoint[] pnts = element.getPoints();
  for ( int i = 0; i < pnts.length; i++ ) {
    float es = random(10);
    ellipse(pnts[i].x, pnts[i].y, es, es);
  }
}

if(!online)saveFrame("frame.png");

