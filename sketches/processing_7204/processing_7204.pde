
//PULSE BEAT Version 1.0
//By: Siddharth Mankad
//Portfolio: http://www.behance.net/smmankad/Frame
//(cc)Copyleft 2010, National Institute of Design, PGC, Gandhinagar

int counter;

void setup()
{
  smooth();
  size(800,600);
  counter=0;
  
}

void draw()
{
  if(counter==width+120)
  {
    counter=0;
  }
  else
  {
    counter+=20; //Change for speed
    background(255);
  }
  drawECG(counter);


}

void drawECG(float center)
{
  //stroke(0);
  strokeWeight(3);
  noFill();

  float ry=height/2;

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







