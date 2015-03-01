
//simple 2D gradient descent algorithm
//Andrea Vannini
//
//http://andreaarch.wordpress.com/
 
Funct f;
Particle pt;
 
float alfa;
 
float learningRate = 1;
ArrayList ptStore;
 
void setup()
{
 
  f = new Funct();
  pt = new Particle(f, learningRate);
   
  ptStore = new ArrayList();
  background(255);
  size(600, 600, P3D);
  smooth();
  ellipseMode(CENTER);
  alfa = 0.0;
}
 
void draw()
{
  camera(200, 300.0, 200.0, 0.0, 0, 1.0, 0, 0, -1); //
  //rotateZ((float) frameCount/PI/50);
  pt.optimize();
  PVector v = new PVector(pt.x[0], pt.x[1],pt.y);
  ptStore.add(v);
   
   
  background(255);
   
  noFill();
  stroke(0);
  box(200);
  f.draw();
 
  pushStyle();
  stroke(0);
  strokeWeight(3);
  beginShape();
  for(int i = 0; i < ptStore.size(); i++)
  {
    vertex(ptStore.get(i).x,ptStore.get(i).y,ptStore.get(i).z);
  }
  endShape();
  popStyle();
   
  pt.draw();
   
}
 
void mousePressed()
{
  setup();
}
 
void keyPressed()
{
  if(key == 'z') alfa += 0.03;
  if(key == 'x') alfa -= 0.03;
}
 
 
 
 
 
 
class Funct
{
  Funct()
  {
  }
 
  float f(float x, float y)
  {
    return  1 - 0.02*sq(x)+ 1- 0.005*sq(y);//-pow(0.1*x,2) + 40*sin(10*y);
  }
  void draw()
  {
    pushStyle();
    stroke(100);
    fill(50,150,240,125);
    beginShape(QUAD);
    float sc = 5;
    int step = (int) (100/sc);
    for (int i = -step; i < step; i++)
    {
      for (int j = -step; j < step; j++)
      {
        beginShape(QUAD);
        float xx = i * sc;
        float xxx = (i+1) * sc;
        float yy = j * sc;
        float yyy = (j+1) * sc;
        vertex(xx, yy, f(xx,yy));
        vertex(xxx, yy, f(xxx,yy));
        vertex(xxx, yyy, f(xxx,yyy));
        vertex(xx, yyy, f(xx,yyy));
        endShape();
      }
    }
    popStyle();
  }
   
}
 
class Particle
{
  var x = new Array(); //change
  float  y;
 
  var xNew = new Array(); //change
  var yNew = new Array(); //change
 
  float lr;
 
  int dim;
 
  Funct func;
 
  Particle(Funct func_, float lr_)
  {
    func = func_;
    lr = lr_;
 
    dim = 2;
    x = new Array(dim); //change
 
    for (int i = 0; i <  dim; i++) x[i] = random(-100, 100);
 
    xNew = new Array(dim); //change
    yNew = new Array(dim); //change
    for (int i = 0; i <  dim; i++) xNew[i] = random(-100, 100);
 
    update();
  }
 
  void update()
  {
 
    y = func.f(x[0], x[1]);
    yNew[0] = func.f(xNew[0], x[1]);
    yNew[1] = func.f(x[0], xNew[1]);
  }
 
 
  void optimize()
  {
    for (int i = 0; i < xNew.length; i++)
    {
      float delta =xNew[i] - x[i];
      if (abs(delta) > 0.01)
      {
        float der = (yNew[i]-y)/(delta);
 
        x[i] = xNew[i];
        //xNew[1] = x[0] - lr * der;
        xNew[i] = x[i] + lr * der;
        update();
      }
    }
    println("Local Minimum @ " + x[0] + " " + x[1]);
  }
 
  void draw()
  {
    pushStyle();
    stroke(255, 0, 0);
    strokeWeight(10);
    point(x[0], x[1], y);
    popStyle();
  }
}



