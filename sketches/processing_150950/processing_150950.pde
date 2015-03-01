
//Gradient descent optimization
//
// Andrea Vannini 2012
// 


Function f;
Particle pt;

float learningRate = 1;
ArrayList <PVector>ptStore; 

void setup()
{
  
  f = new Function();
  pt = new Particle(f, learningRate);
  
  ptStore = new ArrayList<PVector>();
  background(255);
  size(300, 300);
  smooth();
  ellipseMode(CENTER);
}

void draw()
{
  pt.optimize();
  PVector v = new PVector(pt.x, pt.y);
  ptStore.add(v);
  
  
  background(255);
  f.draw();
  stroke(192);
  strokeWeight(3);
  beginShape();
  for(int i = 0; i < ptStore.size(); i++)
  {
    
    vertex(ptStore.get(i).x,300-ptStore.get(i).y);
  }
  endShape();
  pt.draw();
  
}

void mousePressed()
{
  setup();
}






class Function 
{
  Function()
  {
  }

  float f(float x)
  {
    return 30*sin(0.05*x)+pow(0.05*x-15,2)+30;
  }
  void draw()
  {
    stroke(0);
    strokeWeight(2);
    noFill();
    beginShape();
    for (int i = 0; i < 100; i++)
    {
      vertex(3*i, 300-f(3*i));
    }
    endShape();
  }
}
class Particle
{
  float x;
  float y;

  float xNew;
  float yNew;

  float lr;

  Function func;

  Particle(Function func_, float lr_)
  {
    func = func_;
    lr = lr_;

    x = random(0, 300);
    xNew = x + random(-10, 10);


    update();
  }

  void update()
  {
    y = func.f(x);
    yNew = func.f(xNew);
  }


  void optimize()
  {
    if (abs(xNew - x) > 0.1)
    {
      float der = (yNew-y)/(xNew-x);
      x = xNew;
      //xNew = x - lr * func.f(x);
      xNew = x - lr * der;
      update();
    }
    println("Local Minimum @ " + xNew);
  }

  void draw()
  {
    stroke(0, 0, 200);
    strokeWeight(1);
    line(x, 300-y, xNew, 300-yNew);
    noStroke();
    fill(200, 0, 0);
    ellipse(x, 300-y, 10, 10);
  }
}



