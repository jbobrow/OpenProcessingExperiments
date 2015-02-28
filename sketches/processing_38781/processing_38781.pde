
//  Title    : Drawing program
//  Synopsis : Small program
//  Author   : Michael Hawthorne
//  Date     : 22/09/2011
//  Changlog : N/A


float r = 255, g = 255 ,b = 255;
int brushsize = 5;

PFont clear_font;


void setup()
{
  size(400,400);
  background(255,255,255);
  smooth();
  clear_font = loadFont("BrowalliaNew-20.vlw");
  
}

void draw()
{
 displayclear();
 draw_Cpicker();
 checkMouse(mouseX,mouseY);
 displaybrushsize();
 draw_Pen(r,g,b);
 
}

void draw_Cpicker()
{
  strokeWeight(2);
  fill(255,0,0);
  rect(0,0,40,40);
  fill(0,255,0);
  rect(40,0,40,40);
  fill(0,0,255);
  rect(80,0,40,40);
  fill(0,0,0);
  rect(120,0,40,40); 
   
}

void draw_Pen(float r, float g, float b)
{
  if(mousePressed)
  {
   strokeWeight(brushsize);
   stroke(r,g,b);
   point(pmouseX,pmouseY);
  }   
}

void displaybrushsize()
{
  fill(255,255,255);
  rect(160,0,40,40);
  rect(200,0,40,40);
  rect(240,0,40,40);
  stroke(0,0,0);
  strokeWeight(5);
  point(180,20);
  strokeWeight(10);
  point(220,20);
  strokeWeight(15);
  point(260,20);
  
    
}

void checkMouse(int x, int y)
{
  if(x < 40 && y < 40 && mousePressed == true)
  {
    b = 0; g = 0;
    r = 255;
  }
  if(x > 40 && x < 80 && y < 40 && mousePressed == true)
  {
    b = 0; g = 255;
    r = 0;
  }
  if(x > 80 && x < 120 && y < 40 && mousePressed == true)
  {
    b = 255; g = 0;
    r = 0;
  }
  if(x > 120 && x < 160 && y < 40 && mousePressed == true)
  {
    b = 0; g = 0;
    r = 0;
  }
  if(x > 160 && x < 200 && y < 40 && mousePressed == true)
  {brushsize = 5;}
  if(x > 200 && x < 240 && y < 40 && mousePressed == true)
  {brushsize = 10;}
  if(x > 240 && x < 280 && y < 40 && mousePressed == true)
  {brushsize = 15;}
  if(x>280 && x < 380 && y < 40 && mousePressed == true)
  background(255,255,255);
}

void displayclear()
{
  strokeWeight(2);
  rect(280,0,100,40);
  textFont(clear_font, 40);
  fill(255,45,120);
  text("Clear", 282,32);
}
                
                                                                
