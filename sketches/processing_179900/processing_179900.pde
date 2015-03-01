
/* @pjs preload="map.png, wall.png"; 
 */

PImage backImg;
PImage wall;

float yspeed = 4;
int x = 250;
float y = 250;
float easing = 0.2;
int l=0;
int[] wx = new int[2];
int[] wy = new int[2];
float score = 0;


void setup()
{
  size(500,500);
  smooth();
  wall = loadImage("wall.png");
  size(wall.width,wall.height);
  backImg = loadImage("map.png");
  size(backImg.width,backImg.height);
}

void draw()
{
  background(#2C2A2A);
  image(backImg,l,0);
  image(backImg,l+backImg.width,0);
  l-=6;
  for(int i =0; i < 2; i++)
  {
    image(wall,wx[i],wy[i] - wall.height*1.5+30);
    image(wall,wx[i],wy[i] + wall.height/2.5);
    if(wx[i]<0)
    {
      wy[i] = (int)random(150,300);
      wx[i] = width;
    }
    if(wx[i]/2 == width/2)
    {
      score=score+0.5;
    }
    if(y>height || y<0 || (abs(width/2-wx[i])<30 && abs(y-wy[i])>80))
    {
      background(255);
      fill(0);
      text(""+score,250,250);
      noLoop();
    }
    wx[i]-=6;
  }
  text(""+score,50,50);
  ellipse(x,y,10,10);
  y+=yspeed*2*easing;
  if(mousePressed==true)
  {
    y-=yspeed*2;
  }
  
}


