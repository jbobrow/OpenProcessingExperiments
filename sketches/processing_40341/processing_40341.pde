
/*PLEASE READ FIRST!*/

/* Hi my name is Mark Pineda! and this is my project on massive
 * scales! Press the R,G,B,Space buttons on the computer to change the
 * color! and click and drag the mouse for another explosion!*/ 
circle a;
int x=8,y=5,s=20,wx=600,wy=600;
void setup()
{ 
  smooth();
  size(600,600);
  a = new circle();
  a.x = 5;
  a.y = 5;
  a.s = 10;
  a.c1 = 255;
  a.c2 = 255;
  a.c3 = 255;
  
}
void draw()
{
  a.show();
  a.update();
  fill(0,2);
  rect(0,0, 600,600);
  noFill();
  for(int i=0; i < 5; i++)
  {for(int v=0; v < 5; v++)
   {
    smooth();
    noStroke();
    fill(#4D90FF);
    ellipse(x+random(-wx,wx),y+random(-wy,wy), s,15);
   }
  }
}
void mouseDragged()
{     
    a.show();
    a.update();
    a.s=5;
     for(int i=0;i<300;i++)
    {
      fill(a.c1,a.c2,a.c3);
      smooth();
      ellipse(x+random(-600,600),y+random(-600,600), 20,20);
    }  
}
void keyPressed()
{
  if(key == 'r')
  {
    a.c1 = 206;
    a.c2 = 0;
    a.c3 = 0;
  }
  if(key == 'g')
  {
    a.c2 = 206;
    a.c1 = 0;
    a.c3 = 0;
  }
  if(key == 'b')
  {
    a.c3 = 183;
    a.c1 = 109;
    a.c2 = 143;
  }
  if(key == 'w')
  {
    a.c1 = 255;
    a.c2 = 255;
    a.c3 = 255;
  }
  if(key == ' ')
  {
    background(255);
  }
}

  
    
class circle
{
  int x,y,s,c1,c2,c3;
  void show()
  {
    smooth();
    noStroke();
    fill(c1);
    ellipse(x,y,s,s);
  }
  void update()
  {
    s = s+round(random(-5,5));
    x = mouseX;
    y = mouseY;
  }
}


  

