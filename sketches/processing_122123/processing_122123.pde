
//Lav en klasse hvor der er mulighed for at vælge en planet som skal falde ned
//Planeten skal falde 200m nedad
Planet merkur;
Planet venus;
Planet jorden;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptun;
Planet pluto;

String p;
void setup()
{
  size(1280,720);
  merkur = new Planet("merkur",100);
  venus = new Planet ("venus",200);
  jorden = new Planet ("jorden",300);
  mars = new Planet ("mars",400);
  jupiter = new Planet ("jupiter", 500);
  saturn = new Planet ("saturn",600);
  uranus = new Planet ("uranus",700);
  neptun = new Planet ("neptun",800);
  pluto = new Planet ("pluto",900);
  
}

void draw()
{
  background(#ffffff);
  merkur.fall();
  merkur.display();
  venus.fall();
  venus.display();
  jorden.fall();
  jorden.display();
  mars.fall();
  mars.display();
  jupiter.display();
  jupiter.fall();
  saturn.fall();
  saturn.display();
  uranus.fall();
  uranus.display();
  neptun.fall();
  neptun.display();
  pluto.fall();
  pluto.display();
}

class Planet
{
  float v;
  float a;
  float g;
  float yPos = -15;
  float xPos;
  float farve1,farve2,farve3;
  String name;
  
  Planet(String plan, int x)
  {
    v = 0;
    xPos = x;
    name = plan;
    farve1 = random (1,255);
    farve2 = random (1,255);
    farve3 = random (1,255);
    if (plan.equals("pluto"))
    {
      g = 0.000244;
    }
    else if (plan.equals("merkur"))
    {
      g = 0.001444;
    }
    else if (plan.equals("venus"))
    {
      g = 0.003532;
    }
    else if (plan.equals("mars"))
    {
      g = 0.0015;
    }
    else if (plan.equals("jupiter"))
    {
      g = 0.0104;
    }
    else if (plan.equals("saturn"))
    {
      g = 0.00448;
    }
    else if (plan.equals("uranus"))
    {
      g = 0.0042;
    }
    else if (plan.equals("neptun"))
    {
      g = 0.00532;
    }
    else if (plan.equals("jorden"))
    {
      g = 0.003928;
    }
    
    a = g;
  }


  void fall()
  {
    v = v + a;
    yPos = yPos + v;
  }


  void display()
  {
    fill(farve1,farve2,farve3);
    ellipse(xPos,yPos,30,30);
    noFill();
    text(name,xPos-60,yPos);
  }
}


