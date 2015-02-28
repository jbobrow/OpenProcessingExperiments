
int water;

void setup()
{
  background(100);
  size (500,500);
  water = 20;
  noStroke();
}

void draw()
{
  for (int x=0; x<width; x+=water)
    {
     for(int y=0; y<height; y+=water)
      {
        fill(0,0,random(150,200),30);
        rect(x,y,water,water);
      }
    }
    float cupX = mouseX - (mouseX % water);
    float cupY = mouseY - (mouseY % water);
    fill(125);
    rect(cupX,cupY, 60,80);
    
    float handleX = mouseX - (mouseX % water)-20;
    float handleY = mouseY - (mouseY % water);
    fill(125);
    rect(handleX,handleY ,20,20);
    
    if(mousePressed)
    {
     float splashXa = mouseX - (mouseX % water) - 10;
     float splashYa = mouseY - (mouseY % water) - 40; 
     fill(0,0,random(190,255),10);
     rect(splashXa,splashYa, 30,40);
     
     float splashXb = mouseX - (mouseX % water);
     float splashYb = mouseY - (mouseY % water) - 40;
     fill(random(100,255),10);
     rect(splashXb,splashYb, 55,60);
     
     float splashXc = mouseX -(mouseX % water) + 35;
     float splashYc = mouseY -(mouseY % water) - 40;
     fill(random(205,255),5);
     rect(splashXc,splashYc, 40,40);
     
     float splashX1 = mouseX - (mouseX % water) + 5;
     float splashY1 = mouseY - (mouseY % water);
     fill(0,0,random(220,255));
     rect(splashX1, splashY1, 50, 70);
    } 
}

