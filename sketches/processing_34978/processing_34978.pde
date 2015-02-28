
//Raven Kwok | 郭锐文
//Email: raystain@gmail.com
//Blog: the-moor.blogbus.com
//Vimeo: vimeo.com/ravenkwok
//Weibo: weibo.com/ravenkwok

import geomerative.*;

RFont font;
PFont p;
RGroup grp;
RPoint[] pnts;
float [] iniPntxs;
float [] iniPntys;
float [] iniPntxsT;
float [] iniPntysT;
char [] targetKeys = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 
  'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 
  'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 
  'y', 'z'
};
float xOffset, yOffset;

void setup()
{
  background(255);
  size(600, 480);
  RG.init(this);
  p = loadFont("Corbel-BoldItalic-14.vlw");
  font = new RFont( "Corbel Bold Italic.ttf",250, RFont.CENTER);
  frameRate(30);
  xOffset = width/2;
  yOffset = height/4*3;
  grp = font.toGroup("c");
  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  grp = grp.toPolygonGroup();
  pnts = grp.getPoints();
  iniPntxsT = new float[pnts.length];
  iniPntysT = new float[pnts.length];
  iniPntxs = new float[pnts.length];
  iniPntys = new float[pnts.length];
  for ( int i = 0; i < pnts.length; i++ )
  {
    iniPntxsT[i] = pnts[i].x+xOffset;
    iniPntysT[i] = pnts[i].y+yOffset;
    iniPntxs[i] = iniPntxsT[i]*1.1+random(-50, 50);
    iniPntys[i] = iniPntysT[i]*1.1+random(-50, 50);
  }
  smooth();
}

void draw()
{
  noStroke();
  fill(255,30);
  rect(0,0,width,height);
  strokeWeight(0.5);
  stroke(0);
  fill(255,20);
  beginShape();
  for ( int i = 0; i < pnts.length; i++ )
  {
    iniPntxs[i] += (iniPntxsT[i]-iniPntxs[i])/5;
    iniPntys[i] += (iniPntysT[i]-iniPntys[i])/5;
    float x0 = pnts[i].x;
    float y0 = pnts[i].y;
    float a = mouseX-x0;
    float b = mouseY-y0;
    float r = sqrt(a*a+b*b);
    float quer_fugir_x = pnts[i].x-(a/r)*200/r;
    float quer_fugir_y = pnts[i].y-(b/r)*200/r;
    float quer_voltar_x = (iniPntxs[i]-x0)/3;
    float quer_voltar_y = (iniPntys[i]-y0)/3;
    pnts[i].x = quer_fugir_x+quer_voltar_x;
    pnts[i].y = quer_fugir_y+quer_voltar_y;
    curveVertex(pnts[i].x, pnts[i].y);
  }
  endShape();
  textFont(p);
  fill(0,40);
  text("* Colloid Text Basic *",50,50);
  text("Type among a-z and move your cursor within the letter's range to see the effect.",50,80);
}

void keyPressed() {
  for (int i=0;i<targetKeys.length;i++) {
    testKey(targetKeys[i]);
  }
}

void testKey(char keyInput_) {
  if (key == keyInput_) {
    String targetLetter = str(keyInput_);
    grp = font.toGroup(targetLetter);
    RCommand.setSegmentLength(1);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    grp = grp.toPolygonGroup();
    pnts = grp.getPoints();
    iniPntxsT = new float[pnts.length];
    iniPntysT = new float[pnts.length];
    iniPntxs = new float[pnts.length];
    iniPntys = new float[pnts.length];
    for ( int i = 0; i < pnts.length; i++ )
    {
      iniPntxsT[i] = pnts[i].x+xOffset;
      iniPntysT[i] = pnts[i].y+yOffset;
      iniPntxs[i] = iniPntxsT[i]*1.1+random(-50, 50);
      iniPntys[i] = iniPntysT[i]*1.1+random(-50, 50);
    }
  }
}


