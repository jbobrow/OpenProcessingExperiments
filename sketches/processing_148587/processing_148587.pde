
particle p[] = new particle[100];
float g = 0.2;

void setup()
{
  size(1000, 500);
  for (int i =0 ; i<p.length ; i++)
  p[i] = new particle(width/2+random(-5,5), height +random(-5,5), random(-5,5), random(-5,-10));
}

void draw()
{
  background(200);
  for (particle n : p)
  {
    n.move();
    n.draw();
  }
}
class particle
{
  float x,y;
  float v_x, v_y;
  float life,age;
  particle(float initx, float inity, float initv_x, float initv_y)
  {
    x = initx; y = inity;
    v_x = initv_x; v_y = initv_y;
    age = 0; life = 200;
  }
  
  void draw()
  {
    float f =constrain(norm(age,0,life), 0, 1);
    color born = color(255,0,0);
    color dead = color(10,0,0);
    fill( lerpColor(born,dead,f));
    ellipse(x,y,5,5);
  }
  
  void move()
  {
    x += v_x; y += v_y;
    v_y += g;
    if( y>height ) { y=height; v_y *= -random(0.5,0.7); }
    if( y<0 ) { y=0; v_y *= -0.7; }
    if( x>width ) { x=width; v_x *= -0.7; }
    if( x<0 ) { x=0; v_x *= -0.7; }
    age+=0.5;
  }
}


