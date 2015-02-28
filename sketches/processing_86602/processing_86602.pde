
/*
/*
  Autor: Sergio Sequero
  Clica para aumentar la potencia de la tormenta y
  apagar la luz
  
 */
 

Lluvia[] l;
 
void setup()
{
  size(300, 430);
  smooth();
 
  l = new Lluvia[500];
  for (int i=0; i<500; i++)
  {
    l[i] = new Lluvia();
    l[i].x = random(0,300);
    l[i].y = random(0,470);
    l[i].d = (int)random(10, 90);
    l[i].v = (int)random(1, 10);
  }
 
}
 
void draw()
{
  background(#A7A7A7);
   fill(0);
 rect(50,280,8,150);
 rect(140,280,8,150);
 rect(230,280,8,150);
 stroke(0);
 fill(#FFE921);
 ellipse(54,270, 40,40);
 ellipse(144,270, 40,40);
 ellipse(234,270, 40,40);
 
 

 
  for (int i=0; i<l.length; i++)
  {
    l[i].move();
    l[i].show();
  }

 
}
class Lluvia
{
  float x, y;
  int d, v;
  float i, k, r;
 
 
  void show()
  {
    noStroke();
    fill(#0F33BC);
    ellipse(x, y,3,3);
  }

  void move()
  {
    y =  y + random(9,12) ;
 
    if (y>475) y = random(0,5);
     
    if (mousePressed)
    {
          fill(#C9C9C5);
      stroke(0);
 ellipse(54,270, 40,40);
 ellipse(144,270, 40,40);
 ellipse(234,270, 40,40);
      y =  y + random(11,13);
  
    }
 
 noStroke();
       fill(#646464);
  ellipse(-5,-10,60,75);
  ellipse(50,-7,125,75);
  ellipse(100,-5,125,75);
  ellipse(300,-10,125,75);
  ellipse(200,-3,125,75);
  rect(0,600,600,100);
  }
}
 


