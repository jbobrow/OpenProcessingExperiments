
//Eric T. Computer Programming 1 Mods 4-5
void setup()
{
  size(300,310);
  frameRate(1);
}
void draw()
{
  background(0);
  fill(124,91,42);
  rect(0,125+100,200+100,85+100);
  //straw
  fill(245,242,237,175);
  rect(95+55,20+60,10,150);
  fill(255,0,0);
  rect(100+55,20+60,3,150);
  //cup
  fill(245,242,237,175);
  quad(105,115,105+100,115,195,115+150,115,115+150);
  fill(95,178,52);
  rect(100,115,110,5);
  //drink
  fill(214,93,69,175);
  noStroke();
  quad(107,140,103+100,140,195,140+125,115,140+125);
  //tapioca
  fill(0);
  int x = 1;
  while(x<=100)
  {
    ellipse(int(random(117,193)),int(random(210,260)),9,9);
    x=x+1;
  }
}
