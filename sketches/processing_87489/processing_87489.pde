
import geomerative.*;

String charToDraw = "SVA";
float danceFactor = 2;

RFont font;
RGroup grp;
RPoint[] pnts;
float dxBase = 0.;
float dsizeBase = 0.;

void setup() 
{
  size(1280, 800); 

  smooth();

  frameRate(15);

  RG.init(this);
  font = new RFont("FreeSansNoPunch.ttf", 500, RFont.LEFT);

  RCommand.setSegmentLength(25);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  grp = font.toGroup(charToDraw);
  pnts = grp.getPoints();
  background(150);
  aa();
}

void draw() 
{
  noFill();
  pushMatrix();
  translate((width / 2) - (grp.getWidth() / 2), (height / 2) + (grp.getHeight() / 2));

  for (int i = 0; i < pnts.length; i++ ) {
    pnts[i].x += random(-danceFactor, danceFactor);
    pnts[i].y += random(-danceFactor, danceFactor);
  }

  strokeWeight(0.08);
  stroke(250,60);
  float dsize = dsizeBase;
  float dotsize = 10;
  
  beginShape();
  dotsize = map( sin(dsize), -1., 1., -12, 32);
  dsize -= 0.3;
  for (int i=0; i<pnts.length; i++) {
    ellipse(pnts[i].x, pnts[i].y,dotsize,dotsize);
    line(pnts[i].x, pnts[i].y,pnts[i].x + random(-90,90), pnts[i].y+random(-90,90));
  }
  dsizeBase += 0.06;
  endShape();

  strokeWeight(0.03);
  stroke(200,90);
  beginShape();
  for (int i=0; i< pnts.length; i++) {
    vertex(pnts[i].x, pnts[i].y);
  }

  endShape();

  popMatrix();
}

void mouseReleased(){
  aa();
}

void aa(){
 background(0,50);
  
}



