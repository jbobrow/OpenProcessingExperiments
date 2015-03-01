
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  int x, y, xd, yd, rot, grun, blau;
  float a1, a2, b1, b2;
  background(0);
  for ( int z = 0; z < 6; z++)
  {
    x = int(random(300));
    y = int(random(500));
  
    xd = int((300-x)*random(1));
    yd = int((500-y)*random(1));
  
    rot = int(random(255));
    grun = int(random(255));
    blau = int(random(255));
    
    a1 = random(1);
    a2 = random(1);
    b1 = random(1);
    b2 = random(1);
    
    fill((grun+blau)/2, (rot+blau)/2, (rot +grun)/2);
    rect(x -(xd*a1), y-(yd*b1), xd*(1+a1+a2), yd*(1+b1+b2));
   
    fill( rot, grun, blau);
    rect(x, y, xd, yd); 
  }
}
