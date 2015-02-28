
int x;
int y;

void setup ()
{
  size (400,400);
  background(16,227,207);
  noCursor();
   smooth(2);
}

void draw()
{
  background(16,227,207);

for (y=0; y<height; y+=60){  
  for (x=0; x<width; x+=60){
  moni();
  }
}

}

void moni ()
{
  fill(0);
  stroke(0);
  rect(x,y,20,20);
  rect(x+20,y+20,40,40);
  rect(x+60,y+60,20,20);
  fill(210);
  rect(x+30,y+30,20,20);
  fill(227,197,16);
  ellipse(x+10,y+10,10,10);
  ellipse(x+70,y+70,10,10);
  
}
