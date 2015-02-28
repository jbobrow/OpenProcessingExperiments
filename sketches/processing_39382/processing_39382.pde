

Blitzer a, b, c, d, e;


void setup()
{
  size(600,600);
  smooth();
  
  a = new Blitzer();
  a.s = 40;
  //a.v = 2;
  a.c2 = 12;
  a.c1 = round(random(256));
  //a.c3 = round(random(256));
  a.weight = 3;
  
  b = new Blitzer();
  b.s = 30;
  //b.v = 3;
  b.c1 = round(random(256));
  b.c2 = 17;
  b.c3 = round(random(256));
  b.weight = 3;
  
  c = new Blitzer();
  c.s = 10;
  //c.v = 5;
  c.c1 = round(random(256));
  c.c2 = 15;
  c.c3 = round(random(256));
  c.weight = 3;

  d = new Blitzer();
  d.s = 9;
  //d.v = 8;
  d.c1 = round(random(256));
  d.c2 = 25;
  d.c3 = round(random(256));
  d.weight = 3;
  
  e = new Blitzer();
  e.s = 5;
  //e.v = 9;
  e.c1 = round(random(256));
  e.c2 = 30;
  e.c3 = round(random(256));
  e.weight = 3;
 
 
  //a.x = b.x = c.x = d.x = e.x = width/2;
  //a.y = b.y = c.y = d.y = e.y = height/2;
  a.x = 300;
  a.y = 300;
  b.x = a.x+20;
  b.y = a.y+20;
  c.x = a.x+20;
  c.y = a.y-20;
  d.x = a.x-20;
  d.y = a.y-20;
  e.x = a.x-20;
  e.y = a.y+20;
  /*a.x = b.x = width*3;
  c.x = d.x = width*1.5;
  e.x = e.y;
  a.y = b.y = height/5;
  c.y = d.y = height/2.5;
  */

 
}

void draw()
{
  fill(120,12);
  rect(0,0,600,600);
 /* a.move();
  b.move();
  c.move();
  d.move();
  e.move();*/
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  
  //For the object to reappear on the other side of screen
  
  if(a.x > 603) a.x = -30;
  if(b.x > 603) b.x = -20;
  if(c.x > 603) c.x = -5;
  if(d.x > 603) d.x = -5;
  if(e.x > 603) e.x = -9;
  
  if(a.x < -30) a.x = 603;
  if(b.x < -20) b.x = 603;
  if(c.x < -5) c.x = 603;
  if(d.x < -5)   d.x = 603;
  if(e.x < -9)   e.x = 603;
  
  if(a.y > 600) a.y = 40;
  if(b.y > 600) b.y = 30;
  if(c.y > 600) c.y = 10;
  if(d.y > 600) d.y = 5;
  if(e.y > 600) e.y = 9;
  
  if(a.y < -40) a.y = 600;
  if(b.y < -30) b.y = 600;
  if(c.y < -10) c.y = 600;
  if(d.y < -5)   d.y = 600;
  if(e.y < -9)   e.y = 600;
}

class Blitzer
{
  float x, y;
  int s,s1; // size (s for side)
  int v; // velocity
  int c1,c2,c3; // color
  int weight; // stroke fill

  void show()
  {
     if (mousePressed == true)
  {
    //translate(width/2, height/2);
    //rotate(PI/3.0);*/
    rotate(radians(random(25,300)));
    rect (random (0,580),random (0,580), 100,100);
    
  }
  
    strokeWeight(weight);
    fill(c1,c2);
    //translate(width/2, height/2);
    //rotate(PI/3.0);
    rect(x,y,s,s);
   
  }
  void change()
  {
    if (keyPressed)
    {
      if (key == 'w')
      {
        c2= c2+1;
      }
      if (key == 's')
      {
        c2= c2-1;
      }
    }
    
  if (mousePressed)
  {
    rect (random (0,480),random (0,480), 300,300);
  }
  }
  //if (mousePressed == true)
  {
    //translate(width/2, height/2);
    //rotate(PI/3.0);*/
    //rotate(radians(20));
  }
  

 /* void move()
  {
    x += ( mouseX - width/2  ) * v;
    y += ( mouseY - height/2 ) * v;
  }
*/
}


