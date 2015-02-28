
PFont myFont;

float x= random(200);
float y= random(200);

float speedy= 4;
float speedx= 4;

float gravity;
float w;
float life = 255;

float x2= random(80);
float speedx2= 4;

float y2=random(80);
float speedy2= 4;

float x3= random(200);
float speedx3= 7;

float y3=random(200);
float speedy3=7;

float x4= random(90);
float speedx4= 6;

float y4= random(80);
float speedy4= 6;


void setup()
{
 
  size(700,700);
  myFont= loadFont ("Serif-48.vlw");
 
}
void draw()
{
   background(0,0,0);
  if (x>=500 || x<= 0)
  if (x2>=500 || x2<= 0)
  if (x3>=300 || x3<=0)
  if (x4>=200 || x4<=0)
  {
   speedx= speedx*(-1);
   speedx2= speedx2*(-1);
   speedx3= speedx3*(-1);
   speedx4= speedx4*(-1);
  }
  x= x+speedx;
  x2= x2+speedx2;
  x3= x3+speedx3;
  x4= x4+speedx4;
  
  if (y>=700 || y<= 0)
  if (y2>=700 || y2<= 0)
  if (y3>=700 || y3<= 0)
  if (y4>=400 || y4<= 0)
  
  {
    speedy= speedy*(-1);
    speedy2= speedy2*(-1);
    speedy3= speedy3*(-1);
    speedy4= speedy4*(-1);
  }
  y= y+speedy;
  y2= y2+speedy2;
  y3= y3+speedy3;
  y4= y4+speedy4;
  
textFont(myFont);
  textSize(70);
  fill(0,10,90);
  text("THINK",x,y,100);
 
  textFont(myFont);
  textSize(14);
  fill(255,255,255,100);
  text("GO-GO DANCERS",x2,y2,900);
  
  textFont(myFont);
  textSize(15);
  fill(random(200),random(255),80);
  text("ALIAS",x3,y3,50);
    
     textFont(myFont);
  textSize(100);
  fill(200,5,80);
  text("COLUMBIA",x4,y4,100);

}


