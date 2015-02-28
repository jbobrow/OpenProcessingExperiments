
//IMPULSIVE HEARTS Version 1.0
//By: Siddharth Mankad
//Portfolio: http://www.behance.net/smmankad/Frame
//(cc)Copyleft 2010, National Institute of Design, PGC, Gandhinagar

void setup()
{
  smooth();
  size(800,600);
  background(0);
}

void draw()
{
  drawECG(random(width));
}

void drawECG(float center)
{
  stroke(0);
  strokeWeight(random(5));
  fill(random(255),random(255),random(255));
  filter(ERODE);
  float ry=random(height);
  float rx=random(width);

  float anchor_y1=ry;
  float anchor_y2=ry;

  float cx1=center-70.0;
  float cy1=ry-150.0;

  float cx2=center-70.0;
  float cy2=ry+200.0;

  float startx=center-170;
  float endx=center+170;
  float enddiff = abs(endx-width);

  bezier(0.0,ry,startx/3,ry,startx/2,ry,startx,ry);

  bezier(startx,anchor_y1,cx1,cy1,cx2-50,cy2,center-30,ry);
  bezier(center-30,ry,center,ry-40,center+20,ry-450,center+60,ry);
  bezier(center+60,ry,center+80,ry+100,center+120,ry-70,endx,ry);

  bezier(width,ry,width-10,ry,width-15,ry,endx,ry);

}






