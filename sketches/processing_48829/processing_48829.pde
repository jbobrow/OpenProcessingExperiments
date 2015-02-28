

void setup()
{
  //black background
  background(0);
  //400 by 400 size
  size(400,400);
  
}
void draw()
{
//RGB Color Therefore Red Line - flickers between black and red
stroke(random(255),0,0);
//Draws line from left border to random point on screen
line(200,200,random(400),random(400));
//Green line - flickers between black and green
stroke(0,random(255),0);
//line drawn from point(200,200) to any random point in screen
line(200,200,random(400),random(400));
//Blue line - flickers between blue and black
stroke(0,0,random(255));
//line drawn from the middle to any random point
line(200,200,random(400),random(400));
frameRate(50);
}

