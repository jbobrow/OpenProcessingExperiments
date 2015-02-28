
/* @pjs preload="palette2.jpg"; */

float customBrush1;
float customBrush2;
color brushColor;
PImage paletteImage;
float brushScale = 1.0;
float brushRotate = 0.0;
float rad = 0.0;
float s = 1;
float scale2= 1;
float NextX = 0.0;
float NextY = 0.0;
float radius = 100.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
float timerScalar = 20.0;
float waveHeight = 5;
float starty = 100.0;
float ly = starty;
float lx = 0.0;
float endx = 500.0;
float endy = 100.0;




void setup()
{
 background(#FFFFFF);
 size(600,600);
 paletteImage = requestImage("palette2.jpg");
 frameRate(30);
  NextX = NextY + 1.0;
  NextY = NextX + 1.5;
  prevX= center;
  prevY= center;
  center= width / 2.0;
}

void draw()
{
  if (paletteImage.width > 0)
    {
     image(paletteImage, 0,0,100,100); 
    }
  if (mousePressed == true)
    {
      if(keyPressed)
       { 
         if (key == 'r')
            {
              fill(random(256),random(256),random(256));
              scale(brushScale);
              rotate(brushRotate);
            }
       }
       else
       {
      fill(brushColor);
      scale(brushScale);
      rotate(brushRotate);
      if (mouseButton == RIGHT)
        {
          brushColor = get(mouseX,mouseY);
        }
       }
    }
    
    
   if (mousePressed == true)
     {
      if (mouseButton == LEFT)
       {
           {
             stroke(brushColor);
             strokeWeight(10);
             line(pmouseX,pmouseY,mouseX,mouseY);
           }
       }
    if (keyPressed)
      {if(mouseButton==LEFT)
       {
        if (key == '1')
          {
            ellipse(mouseX,mouseY,10,10);
            scale(brushScale);
            rotate(brushRotate);
          }
        else if (key == '4')
          {
            ellipse(mouseX,mouseY,10,10);
            ellipse(mouseY,mouseX,10,10);
          }
         else if (key == '2')
           {
            triangle(mouseX,mouseY,mouseX+10, mouseY+10, mouseX+20,mouseY);
           }
         else if (key == '3')
           {
             rect(pmouseX,pmouseY,mouseX,mouseY);
           }
         else if (key == 'e')
           {
              timer = timer + (1.0/30.0);
              println(timer);
              float ly = 0.0;
              float lx = 0.0;
              float endx = 600;
              float endy = 600;
              radius = 0.0;
              thickness = thickness + 2;
              pushMatrix();
              fill(0,0,255,10);
              rad = rad + 0.1;
              translate(width/2, height/2);
              rotate(rad);
              scale(s);
              float timerScalar = 20.0; 
              rect(timer * timerScalar, 100, 100, 255);
              rectMode(CENTER);
              rect(0, 0, 100, 100);
              popMatrix();
              pushMatrix();
              fill(0,0,255,10);
              rad = rad + 0.1;
              translate(width/2, height/2);
              rotate(rad);
              scale(s); 
              rectMode(CENTER);
              rect(0, 0, 100, 100);
              float spiralOffset = 10.0;
              float x = radius * cos(timer*spiralOffset);
              float y = radius * sin(timer*spiralOffset);
              popMatrix();
           }
         else if (key == 'b')
           {
           background(brushColor);
           }
         else if (key == 'w')
            {
              brushScale = brushScale + 0.05;
            }
         else if (key == 's')
           {
              brushScale = brushScale - 0.05;
           }
         else if (key == 'a')
           {
             brushRotate = brushRotate + 0.05;
           }
         else if (key == 'd')
           {
             brushRotate = brushRotate - 0.05;
           }
         else if (key == 'n')
           {
             background(#FFFFFF);
           }
      }
       
     }
 }
}


