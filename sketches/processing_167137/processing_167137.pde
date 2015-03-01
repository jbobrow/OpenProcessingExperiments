
//credits to Sabin Serban ( http://www.openprocessing.org/sketch/35721 )
int numCircles = 200;
Circle [] c = new Circle[numCircles];
int numBalls = 5;
Ball[] b = new Ball[numBalls];
int d = 10;
PVector pAux, aAux, vAux; //position, acceleration, velocity

void setup() {
  size(500, 500);
  smooth();

  // create 200 circle objects (boids) and populate the array with them
  for (int i=0; i<c.length; i++) {
    c[i] = new Circle(random(20, width-20), random(20, height-20), 4);
  }

  // create 5 ball objects (predators)
  for (int i=0; i<b.length; i++) 
  {
    pAux = new PVector(random(width/10, width - (width/10)), random(height/10, height - (height/10)));
    vAux = new PVector(random(-2, 2), random(-2, 2));
    aAux = new PVector(0, 0);
    b[i] = new Ball(pAux, vAux, aAux, d, 1);
  }
}

void draw() 
{
  fill(0, 10);
  noStroke();  
  rect(0, 0, width, height);

  for (int i=0; i<c.length; i++)
  {
    c[i].show();
    c[i].move();
    c[i].checkCollision();
  }

  for (int i=0; i<b.length; i++) 
  {
    b[i].move();
    edgeCollide(b[i]);
  }

  ballCollide();

  for (int i=0; i<b.length; i++) 
  {
    fill(50);
    b[i].vecDraw();
    if (b[i].hits!=0) 
    {
      b[i].col=true;
      b[i].hits=0;
    } 
    else {
      b[i].col=false;
    }
  }
}
void mousePressed() {
  addBall();
}

void edgeCollide(Ball b) 
{
  PVector vAux = new PVector();
  if (! (b.col)) 
  {
    if ((b.p.x<b.r/2)&&(b.v.x<0)) 
    {
      vAux.set(((-1)*b.v.x), b.v.y, 0);
      b.collide(vAux);
      b.col=true;
    }
    else if ((b.p.x>(width-b.r/2))&&(b.v.x>0)) 
    {
      vAux.set(((-1)*b.v.x), b.v.y, 0);
      b.collide(vAux);
      b.col=true;
    }
    if ((b.p.y<b.r/2)&&(b.v.y<0)) 
    {
      vAux.set(b.v.x, ((-1)*b.v.y), 0);
      b.collide(vAux);
      b.col=true;
    }
    else if ((b.p.y>(height-b.r/2))&&(b.v.y>0)) 
    {
      vAux.set(b.v.x, ((-1)*b.v.y), 0);
      b.collide(vAux);
      b.col=true;
    }
    else 
    {
      b.col=false;
    }
  }
}

void ballCollide() 
{
  Ball Ba, Bb;
  PVector newa = new PVector();
  PVector newb = new PVector();
  PVector finala = new PVector();
  PVector finalb = new PVector();
  float dx, dy, t, maga, magb, d1, d2;

  for (int i=0; i<b.length-1; i++) 
  {
    for (int j=i+1; j<b.length; j++) 
    {
      if (PVector.dist(b[i].p, b[j].p)<=b[i].r/2+b[j].r/2) 
      {
        if (!(b[i].col) && !(b[j].col)) 
        {
          Ba=b[i];
          Bb=b[j];
          dx = Ba.p.x-Bb.p.x;
          dy = Ba.p.y-Bb.p.y;
          t = atan2(dy, dx);
          maga = Ba.v.mag();
          magb = Bb.v.mag();
          d1 = atan2(Ba.v.y, Ba.v.x);
          d2 = atan2(Bb.v.y, Bb.v.x);
          newa.set(maga*cos(d1-t), maga*sin(d1-t), 0);
          newb.set(magb*cos(d2-t), magb*sin(d2-t), 0);
          finala.set(((Ba.m-Bb.m)*newa.x + (2*Bb.m)*newb.x) / (Ba.m+Bb.m), newa.y, 0);
          finalb.set(((Ba.m+Ba.m)*newa.x + (Bb.m-Ba.m)*newb.x) / (Ba.m+Bb.m), newb.y, 0);
          newa.set( (cos(t)*finala.x + cos(t + HALF_PI)*finala.y), (sin(t)*finala.x + cos(t + HALF_PI)*finala.y), 0 );
          newb.set( (cos(t)*finalb.x + cos(t + HALF_PI)*finalb.y), (sin(t)*finalb.x + cos(t + HALF_PI)*finalb.y), 0 );
          Ba.collide(newa);
          Bb.collide(newb);
        }
        b[i].hits++;
        b[j].hits++;
      }
    }
  }
}

void addBall() {
  Ball[] baux;
  Ball aux;

  numBalls++;
  pAux = new PVector(mouseX, mouseY);
  vAux = new PVector(random(-5, 5), random(-5, 5));
  aAux = new PVector(0, 0);
  aux = new Ball(pAux, vAux, aAux, d, 1);
  baux = (Ball[])append(b, aux);
  b=baux;
}


class Ball 
{

  PVector p;
  PVector v;
  PVector a;
  int r, hits;
  float m;
  boolean col;

  Ball(PVector pAux, PVector vAux, PVector aAux, int rAux, int mAux) 
  {
    p = pAux;
    v = vAux;
    a = aAux;
    r = rAux;
    m = mAux;
    col = false;
    hits=0;
  }

  void move() 
  {
    v.add(a);
    p.add(v);
  }

  void move(PVector aAux) 
  {
    a.set(aAux);
    v.add(a);
    p.add(v);
  }

  void vecDraw() 
  {
    ellipse(p.x, p.y, r, r);
  }

  void collide(PVector vNew) 
  {
    v.set(vNew);
  }
}

class Circle
{
  float x, y, size;
  float speed;

  Circle(float x_, float y_, float s)
  {
    x = x_;
    y = y_;
    speed = s;
  }

  void show()
  {
    noStroke();
    fill(124, 252, 0);
    ellipseMode(CENTER);
    ellipse(x, y, d, d);
    noFill();
    stroke(124, 252, 0);
    ellipse(x+random(-50, 50), y+random(-10, 10), d, d);
  }

  void move()
  {
    x+=random(-speed, speed);
    y+=random(-speed, speed);
  }

  void checkCollision()
  {
    float r = 5.0;
    for (int i = 0; i < c.length; i++) 
    {
      if (dist(x, y, c[i].x, c[i].y) < r+c[i].size/2 && c[i]!=this ) 
      {
        x+=random(speed, -speed);
        y+=random(speed, -speed);
      }
    }
  }
}



