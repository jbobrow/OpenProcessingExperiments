
int numPart = 200;
particle p[] = new particle[numPart];
float g = 0;
void setup()
{
   size(800,500);
    for (int i = 0; i < p.length; i++) {
      p[i] = new particle(width/2+random(-10,10), 
                          height + random(-5, 5),
                          random(-10,10), random(-5,-20)); 
  }

   
}

void draw()
{
  background(200);
  for (particle n : p) {
    n.move();
    n.draw();
  }
}
class particle
{
  float x,y;
  float velX, velY;
  float age; float life;
  
  
  
  particle(float initx, float inity, float initvelX, float initvelY)
  {
      x = initx;       y = inity;
   velX = initvelX; velY = initvelY;
    age = 0;   life  = 200;
  }
  
  void draw()
  {
    float f = constrain(norm(age,0,life), 0, 1);
    color born = color(255,255,0);
    color dead = color(10,0,0);
    stroke(255);
    if (age == life) { 
      f = constrain(norm(age,0,life), 1, 0);
      fill(  lerpColor(dead,born,f)); 
      age = 0;}
    else {fill(  lerpColor(born,dead,f));}
    ellipse(x,y,15,15);
  }
  void move()
  {
    x += velX; y += velY;
    velY += g;
    
    if( y>height ) { y=height; velY *= -random(0.3,0.7); }
    if( y<0 ) { y=0; velY *= -0.7; }
    if( x>width ) { x=width; velX *= -random(0.3,0.7); }
    if( x<0 ) { x=0; velX *= -0.7; }
    age += 0.5;
    
  }
  
}


