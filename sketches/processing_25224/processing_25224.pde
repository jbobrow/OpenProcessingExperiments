

// classe de la météorite

class Meteor
{

  PVector position,pposition,vitesse;
  float r,g,b;


  public Meteor()
  {
    position = new PVector(random(0,width),0);
    pposition = position;
    vitesse = new PVector(0,0);
    r= random(120,255);
    g= random(31,64);
    b=0;
  }

  void draw()
  {
    smooth();
    stroke(0);
    strokeWeight(2);
    fill(r,g,b);
    ellipse(position.x,position.y,30,30);
  }

  void calculate()
  {
    pposition = new PVector(position.x,position.y);
    gravity();
  }

  void gravity()
  {
    vitesse.y += .2;
    vitesse.x += .01;
    position.add(vitesse);
  }
}


//début de la classe de l'effet de fragmentation

class Frag
{
  PVector position,vitesse;

  public Frag(float x,float y)
  {
    float angle = random(PI,TWO_PI);
    float distance = random(3,8);
    float xx = cos(angle)*distance;
    float yy = sin(angle)*distance;
    position = new PVector(x,y);
    vitesse = new PVector(xx,yy);
  }

  public void draw()
  {

    noStroke();
    fill(52,29,10);
    ellipse(position.x,position.y,10,10);
  }


  //Determination de la gravité des météors

  void calculate()
  {
    gravity();

    vitesse.x*=0.98;
    vitesse.y*=0.98;

    position.add(vitesse);
  }

  void gravity()
  {
    vitesse.y+=.15;
  }
}


