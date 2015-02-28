
PFont sampleFont;
int x=0;
int y=1;
int z=390;
String userInput="",pass="dots"+ENTER;
void setup()
{
  size(400,400);
  background(0);
  sampleFont=loadFont("Consolas-48.vlw");
  textFont(sampleFont,16);
}
void draw()
{
  text("Password=dots",width/3,20);
  text("Enter password then hit ENTER",width/5,40);
  text("Enter text here: "+userInput,0,height/2-20);
  if(userInput.equals(pass))
    {
      userInput();
    }
}
//function used to allow password entry
void keyPressed()
{
  if(key!=CODED)
    userInput+=key;
  if(key==CODED)
    userInput+=key;
  if(userInput.equals(pass))
    {
      userInput();
    }
}
//code used for animation of circles
void userInput()
{
  background(0);
  //red balls horizontal
  fill(255,0,0);
  ellipse(x,height/2,20,20);
  x=x+y;
  ellipse(z,height/2,20,20);
  z=z-y;
  //green balls vertical
  fill(0,255,0);
  ellipse(width/2,x,20,20);
  x=x+y;
  ellipse(width/2,z,20,20);
  z=z-y;
  //blue balls diagonal
  fill(0,0,255);
  ellipse(x,x,20,20);
  x=x+y;
  ellipse(z,x,20,20);
  x=x-y;
  z=z-y/2;
  if(x>=width-10||x<=0)
  {
    y=y*-1;
  }
}
