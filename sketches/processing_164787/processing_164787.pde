
ArrayList<Bola> bolas=new ArrayList<Bola>();
int i;
float a;
float vel=0.04;

void setup()
{
  size(800, 800);
  colorMode(HSB, 100);
  for(i=0; i<1; i=i+1)
  {
    bolas.add(new Bola());
  }
}

void draw()
{
  background(10);
  a=a+0.02;
  for(i=0; i<bolas.size(); i=i+1)
  {
    bolas.get(i).mover();
  }
}

void keyPressed()
{
  if(keyCode==RIGHT)
  {
    bolas.add(new Bola());
  }
  if(keyCode==LEFT && bolas.size()>1)
  {
    bolas.remove(bolas.size()-1);
  }
}

class Bola
{
  float ang;
  PVector pos, tpos;
  
  Bola()
  {
    ang=0;
    switch(floor(random(4)))
    {
      case 0:
        pos=new PVector(0, 0);
        tpos=new PVector(0, 0);
        break;
        
      case 1:
        pos=new PVector(width, 0);
        tpos=new PVector(width, 0);
        break;
        
      case 2:
        pos=new PVector(0, height);
        tpos=new PVector(0, height);
        break;
        
      case 3:
        pos=new PVector(width, height);
        tpos=new PVector(width, height);
        break;
    }
  }
  
  void mover()
  {
    ang=i*PI/bolas.size()-HALF_PI;
    pos.x=width/2+cos(ang)*(width/2-20)*sin(a+i*PI/bolas.size());
    pos.y=height/2+sin(ang)*(width/2-20)*sin(a+i*PI/bolas.size());
    tpos.add(PVector.mult(PVector.sub(pos, tpos), vel));
    fill(map(i, 0, bolas.size()-0.99, 0, 100), 100, 100);
    noStroke();
    ellipse(tpos.x, tpos.y, 10, 10);
  }
}
