
String userIn = "";
int red1 = 255;
int black1 = 0;
boolean even = true;

void setup()
{
  size(200,200);
  background(255);
  fill(0);
}

void draw()
{
  drawLines();

}

void keyPressed()
{
  userIn += key;
}

void drawLines()
{  
  for(int i = 0; i < width/20; i++)
  { 
    if(i % 1 == 0)
    {
      stroke(red1, 0, 0); //red
    }  
    if (i % 2 == 1) 
    {
      stroke(black1,0,0); // black
    }
    line(i*20, height/2, i*20+10, height/2);  
    
    if (mousePressed)  //I know I should be using a boolean here to make the colour change permanent after a mouse press, but i'm not sure how
    {
      red1 = 0;
      black1 = 255;
    }
    else
    {
      red1 = 255;
      black1 = 0;
    }
    
  }
  fill(0);
  text(userIn,0,height/2);
  

}
