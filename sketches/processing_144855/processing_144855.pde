
WhitneyEllipse[] we;

int numWE = 250;

void setup()  {
  size(600,600);
  //frameRate(21);
  background(0);
  stroke(255);
  smooth();
  we = new WhitneyEllipse[numWE];
  for (int i=0;i<numWE;i++)  {  
    we[i] = new WhitneyEllipse(i*(PI/5000), i);
  }
}

void draw()   {
  background(0);
  for (int i=0; i < numWE; i++)  {
    we[i].display();
  }
}

void mousePressed()  {

  println(we[1].x);
}

class WhitneyEllipse
{
  float x, y, a, b, r, th, spinVelocity, spinRadius;
  
  WhitneyEllipse(float spinVelocityVar, float spinRadiusVar)  {
    spinVelocity = spinVelocityVar;
    spinRadius = spinRadiusVar;
    a = width/2;
    b = height/2;
  }
  
  void display()  {
    th = th + spinVelocity;
    x = a + spinRadius*cos(th);
    y = b + spinRadius*sin(th);
    stroke(255,0,0,100);
    //line(we[int(random(numWE))].x,we[int(random(numWE))].y, we[frameCount%numWE].x, we[frameCount%numWE].y);
    stroke(255,255,255);
    ellipse(x,y,2,2);
  } 
}

