
Robot bot1;
Robot bot2;
Robot bot3;

void setup()
{
  
 size( 600,400);

 
 bot1= new Robot("bot1.svg",100, 100);
 bot2= new Robot("bot2.svg",300,50);
 bot3= new Robot("bot3.svg", 10, 30);
 smooth();
 
}

void draw()
{
background(0);
  
  bot1.update();
  bot1.display();
  
  bot2.update();
  bot2.display();
  
  bot3.update();
  bot3.display();
}

class Robot
{
  float xpos;
  float ypos;
  float angle;
  PShape botShape;
  float yoffset= 0.0;
  
  Robot(String svgName, float tempX,float tempY)
  {
    botShape=loadShape(svgName);
    xpos = tempX;
    ypos= tempY;
    angle= random(0,TWO_PI);
  }
  
  void update()
  {
   angle+=0.07;
  yoffset=sin(angle)* 90; 
  }
  
  void display()
  {
    
  shape(botShape, xpos, ypos+ yoffset);  
  }
}

