
particle system[] = new particle[800];
float genx;
float geny;
float genSpeed = 2;

void setup()
{
  size(800, 500);
  genx = width/2;
  geny = 200;

  for (int i=0 ; i<system.length ; i++)
  {
    float angle = random(0, TWO_PI);
    system[i] = new particle(genx, geny, genSpeed*cos(angle), genSpeed*sin(angle));
  }
}

void draw()
{ 
  background(255,255,255);
  for (int i=0 ; i<system.length ; i++)
  {
    system[i].move();
    system[i].draw();
  }
}

class particle
{
  float x, y;
  float vel_x, vel_y;

  void draw()
  {
    fill(75,90,180);
    ellipse(x, y, 10, 10); 
  }

  void move()
  {
    x += vel_x;
    y += vel_y;

    vel_y += 0.00005;
    if ( y>height) {   
      y=height;      
      vel_y += -4;
    }
    if ( y<0) {   
      y=0;      
      vel_y += -4;
    }
    if ( x>width) {   
      x=width;      
      vel_x += -4;
    }
    if ( x<0) {   
      x=0;      
      vel_x += -4;
    }
  }
  particle(float intx, float inty, float intvelx, float intvely)
  {
    x = intx; 
    y= inty;
    vel_x = intvelx; 
    vel_y = intvely;
  }
}



