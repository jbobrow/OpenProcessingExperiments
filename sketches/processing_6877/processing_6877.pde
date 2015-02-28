
/**
 * Blob
 * by Stanley Situ
 * 
*/

Blob b, c;

void setup()
{
  size(800,420);
  noStroke();
  smooth(); 
  frameRate(15);

  
  
  b = new Blob();
  b.x = width/2;
  b.y = height/2;
  b.ra = -20;
  b.rb = 8;
  b.rc = -15;
  b.rd = 5;
  b.d = 12;
  
  c = new Blob();
  c.x = width/5;
  c.y = height/3;
  c.rh = -80;
  c.ri = 80;
  c.rj = -98;
  c.rk = 95;
  c.D = 100;
}

void draw()
{
  background(66);
  b.move();
  c.move();
  b.show();
  c.show();
}

void mouseReleased()
{
  b.x = mouseX;
  b.y = mouseY;
  c.x = random(750);
  c.y = random(400);
}

class Blob
{
  float x, y, d, D;
  float ra, rb, rc, rd;
  float rh, ri, rj, rk;
  int i;
  int cl, c2;
  
  void show()
  {     
  color c1 = color (0, 206, 0);
  color c2 = color (206, 206, 0);
    fill(c1);
    for (i=0; i<100; i++)
    {
      ellipse(x+random(ra,rb), y+random(rc,rd), d,d);
    }

    
    fill(c2);
    for (i=0; i<50; i++)
    ellipse(x+random(rh,ri), y+random(rj,rk), D,D);

  
  }
  
  void move()
  {
    {d += 1;
      D -= 1;}
    
    
    if (D <= 0)
    {D = 100;} 
    
    if (d > 100)
    {d = 12;}
  }
}



