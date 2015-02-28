
// Repeating Shapes Aidan Fulkerson, Mr. Simon CP 16/17

int siz = 10;
int y = 110;
void setup()
{
  size(500,500);
  background(0);
  smooth();
  strokeWeight(3);
}
void draw()
{
  stroke(110,110,110);
  fill(167,167,167);
  ellipse(250,100,100,45);
  ellipse(218,104,20,10);
  ellipse(500-218,104,20,10);
  ellipse(250,110,20,10);
  stroke(80,230,255);
  fill(166,239,252);
  ellipse(250,85,50,30);
  stroke(0,255,0);
  ellipse(250,y,siz,siz);
  y = y + 10;
  siz = siz + 8;
  frameRate(30);
}
