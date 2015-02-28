
int distFrac = 15;

void setup() {
  size(600,600);
  background(255);
  noLoop();
  smooth();
}

void draw() {
  background(255);
 Triangle test = new Triangle(400, 40, 80, 500, 500, 500);
 iterate(test, 6);
}

Triangle randIter(Triangle t)
{
  float r1 = random(360);
  float r2 = random(360);
  float r3 = random(360);
  float ABrandX = t.midAB().x + cos(r1) * (t.dAB/distFrac);
  float ABrandY = t.midAB().y + sin(r1) * (t.dAB/distFrac);
  float BCrandX = t.midBC().x + cos(r2) * (t.dBC/distFrac);
  float BCrandY = t.midBC().y + sin(r2) * (t.dBC/distFrac);
  float ACrandX = t.midAC().x + cos(r3) * (t.dAC/distFrac);
  float ACrandY = t.midAC().y + sin(r3) * (t.dAC/distFrac);
  Triangle iter = new Triangle( ABrandX, ABrandY, BCrandX, BCrandY, ACrandX, ACrandY);
  return iter; 
}

void iterate(Triangle t, int num)
{
   if(num <= 0)
  {
    t.render();
    return;
  } else {
    Triangle next = randIter(t);
    Triangle t1, t2, t3, t4;
    t1 = new Triangle(t.getA(), next.getA(), next.getC());
    t2 = new Triangle(t.getB(), next.getA(), next.getB());
    t3 = new Triangle(t.getC(), next.getB(), next.getC());
    t4 = new Triangle(next.getA(), next.getB(), next.getC());
    num--;
    iterate(t1, num);
    iterate(t2, num);
    iterate(t3, num);
    iterate(t4, num);
  }
  
}

class Triangle {
  float dAB, dAC, dBC;
  PVector A, B, C;
  Triangle(float ax, float ay, float bx, float by, float cx, float cy) {
    A = new PVector(ax, ay);
    B = new PVector(bx, by);
    C = new PVector(cx, cy);
    dAB = A.dist(B);
    dAC = A.dist(C);
    dBC = B.dist(C); 
  }
  
  Triangle(PVector a, PVector b, PVector c)
  {
    A = a;
    B = b;
    C = c;
    dAB = A.dist(B);
    dAC = A.dist(C);
    dBC = B.dist(C); 
  }
  
  void render() {
   line(A.x, A.y, B.x, B.y);
   line(A.x, A.y, C.x, C.y);
   line(C.x, C.y, B.x, B.y); 
  }
  
  PVector getA()
  {
    return A; 
  }
  
  PVector getB()
  {
     return B; 
  }
  
  PVector getC()
  {
     return C; 
  }
  
  PVector midAB() {
    return new PVector( (A.x + B.x) / 2 , (A.y + B.y) / 2);
  }    
  PVector midBC() {
    return new PVector( (B.x + C.x) / 2 , (B.y + C.y) / 2);
  }
  PVector midAC() {
    return new PVector( (A.x + C.x) / 2 , (A.y + C.y) / 2);
  }
}

void mouseClicked()
{
 redraw(); 
}



  



