
float diameter;
int[] angles = { 30, 10, 45, 35, 60, 38, 75, 67 };
float lastAngle = 0;
color[] colors;

PGraphics pg, dp;

void setup() 
{
  size(400, 400);
  background(255);
  noStroke();
  diameter = min(width, height) * 0.75;
  colors = new color[8];
  for(int i=0;i<8;i++)
  {
    int f = (int)random(200)+55;
    color c = color(f,f,f);
    colors[i] = c;
  }
  
  pg = createGraphics(width,height);
  dp = createGraphics(width,height);
  
  pg.beginDraw();
  for (int i = 0; i < 8; i++) 
   {
      pg.fill(colors[i]);
      pg.arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
      lastAngle += radians(angles[i]);
   }
  pg.endDraw();
  
  dp.beginDraw();  
  for (int i = 0; i < 8; i++) 
  {  
      dp.fill(150);
      dp.stroke(150);
      dp.arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
       
      dp.fill(255);
      dp.arc(width/2, height/2, diameter, diameter, lastAngle+radians(1), lastAngle+radians(angles[i]));
      lastAngle += radians(angles[i]);
      
  }
  dp.endDraw();
}

void draw() 
{
   background(240);
   image(dp,0,0);
   
   for (int i = 0; i < 8; i++) 
   {
     if(isMouseOver(colors[i]))
     {
       fill(0);
       rect(mouseX+10,mouseY-10,20,20,4);
       fill(255);
       text(i,mouseX+15,mouseY+5);
     }
   }
}

boolean isMouseOver(color c) 
{ 
  if(pixels == null) 
  {
    loadPixels();
    return false;
  } 
  else 
  {  
    if(pg.get(mouseX,mouseY) == c) 
    {
        return true;
    }
    else
    {
       return false;
    }
  }
}



