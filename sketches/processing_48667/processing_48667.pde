
WhitneyEllipse[] we;

int numWE = 50;

void setup()  {
  size(600,600);
  smooth();
  we = new WhitneyEllipse[numWE];
  for (int i=0;i<numWE;i++)  {  
    we[i] = new WhitneyEllipse(i*0.001);
  }
}

void draw()   {
  background(0);
  for (int i=0; i < numWE; i++)  {
    we[i].display();
  }
}

void mousePressed()  {

  println("you press A");
}

class WhitneyEllipse
{
  float x, y, a, b, r, th, spinVelocity;
  
  WhitneyEllipse(float spinVelocityVar)  {
    spinVelocity = spinVelocityVar;
    a = width/2;
    b = height/2;
    r = 200;
  }
  
  void display()  {
    th = th + spinVelocity;
    x = a + r*cos(th);
    y = b + r*sin(th);
  
    ellipse(x,y,10,10);
  } 
}

