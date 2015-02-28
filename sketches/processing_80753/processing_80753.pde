
float r=0;
float g=0;
float b=0;
void setup()
{
  size(300,300);
  frameRate(20);
  noStroke();
}
void draw()
{
fill(r,g,b);
ellipse(mouseX,mouseY,10,10);
ellipse(300-mouseX,mouseY,10,10);
if(keyPressed==true){
  keyr();
  keyg();
  keyb();
  reset();
}
}
void keyr()
{
  if (key=='r'){
    r=r+5;
  }
}
void keyg()
{
  if (key=='g'){
    g=g+5;
  }
}
void keyb()
{
  if (key=='b'){
    b=b+5;
  }
}
void reset()
{
  if (key==' '){
   b=0;
   g=0;
   r=0; 
  }
}


