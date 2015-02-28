
follower[] a ;
   int j = 2;
   int g = 233;
   int v = 1;
   int d = 6;
   
   
void setup()
{
 size(600,600); 
 smooth();
 stroke(255);
  
  
 a = new follower[3400];
 for(int i=0; i<3400; i++)
 { 
   g = g + 3;
   v = v + 1;
   a[i] = new follower();
   a[i].x =  width/2-g;
   a[i].y =  height/2+random(-g,g); 
   a[i].d = d +1 ;
   a[i].v = v;   
   
 } 

  
}


void draw()
{
 
  background(0);
  
  for(int i=2; i<a.length; i++) 
    {
     a[i].exist();
     a[i].motion();
  
    }
    a[1].x = mouseX;
    a[1].y = mouseY;
} 

class follower
{
  float x, y;
  int d, v, c;
  
  
  void exist()
  {
    fill(random(100,253),66,33);
    ellipse(x,y,d,d);
  }
  
  void motion()
  {
    x += ( mouseX - width/2  ) * 0.0001 * v;
    y += ( mouseY - height/2 ) * 0.0001 * v;
  }  
  
  
}  

