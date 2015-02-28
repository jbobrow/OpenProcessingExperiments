
PFont font;
String myText;
int x = 0;
int xTwo = -1500;

int dim = 40;

void setup()
{
  
  background(0,0,0);
  frameRate(30);
  size(1900, 1200);
noStroke();
  font = loadFont( "matrixfont.vlw");

  myText = new String();

  for(int i = 0; i < 400; i++)
  {
    for(int j = 0; j < 60; j++)
    {
      myText+= char(int(random(33, 122)));
      myText+= "  ";
    }
    myText += "\n\n";
  }  
}

void draw()
{
  background(0,0,0);
  textFont(font, 16);
  
 
  
  //take out for backround
 if (mousePressed){

  drawGradient(mouseX, mouseY);
   fill(mouseX/4,mouseY/4,(mouseX-mouseY));
  
 }
   else{
     //blue
  fill(52,46,255);
  
   }
//leave for background
 
  
  pushMatrix();
  translate(1900, -80);
  rotate(PI/2);
  //translate(width/2, height/2);
  
  text(myText, x, 0, 2800, 2800);
  
  text(myText, xTwo, 0, 2800, 2800);
  //println(myText);
  popMatrix();
  
  x+=5;
  xTwo+=5;
  
  if(x >1300)
  {
    x = -1700;
  }
  
  if(xTwo > 1300)
  {
    xTwo = -1700;
  }
  
  
  
  
  
}


//circgrad
    void drawGradient(float x, float y) {
  int radius = 400;
  float r1 = mouseX/4;
  float g1 = mouseY/4;
  float b1 = mouseX-mouseY;
  float dr = (225 - r1) / radius;
  float dg = (225 - g1) / radius;
  float db = (225 - b1) / radius;
  
  for (int r = radius; r > 0; --r) {
    fill(r1, g1, b1, 3);
    ellipse(x, y, r, r);
    r1 += dr;
    g1 += dg;
    b1 += db;
  }
    }


