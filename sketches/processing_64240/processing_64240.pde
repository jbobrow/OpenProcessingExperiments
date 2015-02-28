
import geomerative.*;

size(400, 400);
smooth();

RG.init(this);
RFont font = new RFont( "ArialRounded.ttf", 72, RFont.CENTER);

background(255);
translate(width/2, height/2);

RGroup grp = font.toGroup("Hello!");

RCommand.setSegmentLength(2);
RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

RPoint[] pnts = grp.getPoints();

noFill();
beginShape();
for ( int i = 0; i < pnts.length; i++ ) {
  vertex( pnts[i].x, pnts[i].y );
}
endShape(CLOSE);

if(!online)saveFrame("frame.png");

