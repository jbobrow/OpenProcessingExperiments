
//Made by Andrew Wong!  3rd Period
Kirby[] a;


int goalA;
int goalB;



void mousePressed()
{
goalA = mouseX;
goalB = mouseY; 


  for(int i=0; i<30; i++)
  {
  a[i].goalA = mouseX + random(-150,150);
  a[i].goalB = mouseY + random(-150,150);
  }
  
}  


void setup()
{
  size(800,800);
  smooth();
  
  a = new Kirby[30];
  for(int i=0; i<30; i++)
  {
  a[i] = new Kirby();
  a[i].r = 30;
  a[i].v = /*(int)random(1,15)*/ 7;
  a[i].rgbred = (int)random(0,255);
  a[i].rgbgreen = (int)random(0,255);
  a[i].rgbblue = (int)random(0,255);
  a[i].circlex = random(200,600);
  a[i].circley = random(200,600);

  }

}





void draw()
{
  background(155);

  
    for(int i=0; i<a.length; i++)
  {
    a[i].move();
    a[i].show();
  }
  
  
}
  


class Kirby
{
  float circlex;
  float circley;
  float goalA;
  float goalB;  
  int r; // size (r for radius)
  int v; // velocity
  int rgbred; // color 1
  int rgbgreen; // color 2
  int rgbblue; // color 3
  int opacity; //opacity, duh
  
  

  void show()
  {
fill(rgbred,rgbgreen,rgbblue);
ellipse(circlex, circley, r, r);
fill(250,128,114);
ellipse(circlex+10, circley + 17, r/2, r/2.31);
ellipse(circlex-9, circley + 17, r/2, r/2.31);
fill(0);
ellipse(circlex-6, circley-3, r/5, r/3);
ellipse(circlex+6, circley-3, r/5, r/3);
fill(255);
ellipse(circlex-7, circley-5, r/15, r/7.5);
ellipse(circlex+5, circley-5, r/15, r/7.5);
fill(250,128,114);
ellipse(circlex, circley+6, r/5, r/10);
fill(205,92,92);
ellipse(circlex+9, circley+4, r/6, r/10);
ellipse(circlex-8, circley+4, r/6, r/10);
  }
  
void move()
    {
    if (goalA >= circlex)
    {
    circlex = circlex + v;
    }
     if (goalA <= circlex)
     {
     circlex = circlex - v;
     }
       if (goalB >= circley)
       {
       circley = circley + v;
       }
         if (goalB <= circley)
         {
         circley = circley - v;
         }
      }
  
}

