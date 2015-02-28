
PFont font;

void setup()
{
//  size(1584,1224);
  size(792,612);
//  font = loadFont("Arial-BoldMT-12.vlw");
  font = loadFont("ArialMT-8.vlw");


  textFont(font);
}

void draw()
{
  background(255);
  stroke(0);
  fill(0);
  float offset=2;
  int offsetY=20;
  int ratioX=68;
  int ratioY=84;
  for(int counter=0; counter<6;++counter)
  {
    offset=logPaperX(offset,offsetY,ratioX,850);
  }
  logPaperY(9,offsetY,ratioY,width);
}

void logPaperY(int lineAmount,int offset,int ratio,int lineLength)
{
  for(int counter=0;counter<lineAmount;++counter)
  {
    line(0,counter*ratio+offset,lineLength,counter*ratio+offset);
  }
}

//void keyReleased()
//{
//  if(key=='s' || key=='S')
//  {
//    saveFrame("logPaper###.png");
//  }
//}

float logPaperX(float firstOffset,int offsetY,int ratio,int lineLength)
{
  int tenthPower=10;
  int counter2=1;
  for(; counter2 <10; ++counter2)
  {
    text(""+counter2,(ratio*log(counter2))+firstOffset,offsetY);
    line((ratio*log(counter2))+firstOffset
        ,offsetY
        ,(ratio*log(counter2))+firstOffset
        ,offsetY+lineLength);
  }
  tenthPower*=10;
  return ratio*log(counter2)+firstOffset;
}

