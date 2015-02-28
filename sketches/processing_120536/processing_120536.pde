
int paintTool;
int color1R;
int color1G;
int color1B;
int color2R;
int color2G;
int color2B;
int color3R;
int color3G;
int color3B;
int color4R;
int color4G;
int color4B;
float ellipse1X;
float ellipse1Y;
float ellipse2X;
float ellipse2Y;
float ellipse3X;
float ellipse3Y;
float ellipse4X;
float ellipse4Y;
int ellipse1number;
int ellipse2number;
int ellipse3number;
int ellipse4number;


void setup()
{
  size(500, 500);
  
        color1R = 86;
        color1G = 72;
        color1B = 222;
        color2R = 64;
        color2G = 191;
        color2B = 83;
        color3R = 211;
        color3G = 64;
        color3B = 64;
        color4R = 211;
        color4G = 207;
        color4B = 64;
}

void draw()
{
 background(214, 211, 110);      
   fill(0);
  text("Paint Tool: " + paintTool, 50,50);
  ellipse(mouseX, mouseY, 100, 100);
  fill(color1R, color1G, color1B);  
  ellipse(mouseX - 75 + ellipse1number, mouseY, 50,50);
  fill(color2R, color2G, color2B);
  ellipse(mouseX + 75 + ellipse2number, mouseY, 50,50);
  fill(color3R, color3G, color3B);
  ellipse(mouseX, mouseY - 75 + ellipse3number, 50,50);
  fill(color4R, color4G, color4B);
  ellipse(mouseX, mouseY + 75 + ellipse4number, 50,50);
  
  if(paintTool == 1)
  {
    ellipse1number = (int)random(-5,5);
    ellipse2number = 0;
    ellipse3number = 0;
    ellipse4number = 0;
  }
    if(paintTool == 2)
  {
    ellipse1number = 0;
    ellipse2number = (int)random(-5,5);;
    ellipse3number = 0;
    ellipse4number = 0;
  }
    if(paintTool == 3)
  {
    ellipse1number = 0;
    ellipse2number = 0;
    ellipse3number = (int)random(-5,5);;
    ellipse4number = 0;
  }
    if(paintTool == 4)
  {
    ellipse1number = 0;
    ellipse2number = 0;
    ellipse3number = 0;
    ellipse4number = (int)random(-5,5);
  }
  

}

void keyPressed()
{
   
    if (key == '1')
    {
      paintTool = 1;
        color1R = 0;
        color1G = 0;
        color1B = 255;
        color2R = 64;
        color2G = 191;
        color2B = 83;
        color3R = 211;
        color3G = 64;
        color3B = 64;
        color4R = 211;
        color4G = 207;
        color4B = 64;

    }
    if (key == '2' )
    {
      paintTool = 2;
        color1R = 86;
        color1G = 72;
        color1B = 222;
        color2R = 0;
        color2G = 255;
        color2B = 0;
        color3R = 211;
        color3G = 64;
        color3B = 64;
        color4R = 211;
        color4G = 207;
        color4B = 64;
    }
    if (key == '3')
    {
      paintTool = 3;
        color1R = 86;
        color1G = 72;
        color1B = 222;
        color2R = 64;
        color2G = 191;
        color2B = 83;
        color3R = 255;
        color3G = 0;
        color3B = 0;
        color4R = 211;
        color4G = 207;
        color4B = 64;
    }
    if (key == '4')
    {
      paintTool = 4;
        color1R = 86;
        color1G = 72;
        color1B = 222;
        color2R = 64;
        color2G = 191;
        color2B = 83;
        color3R = 211;
        color3G = 64;
        color3B = 64;
        color4R = 255;
        color4G = 255;
        color4B = 0;
    }
  
}

void mousePressed()
{
   if (mousePressed == true)
    {
      if (paintTool == 1)
      {
        fill(color1R, color1G, color1B);  
        ellipse(mouseX - 75 + ellipse1number, mouseY, 50,50);    
      }
      
      if (paintTool == 2)
      {
      }
      
      if (paintTool == 3)
      {
      }
      
      if (paintTool == 4)
      {
      }
    }
 }





