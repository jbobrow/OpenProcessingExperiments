
//Example of a simple timer
//Adjusting "threshold" changes the amount of time.
//See the change below: Suggested by Loan Verneau

int threshold;
int prevMillis=0;
float x = 0.0;
void setup()
{
  size(800,200);
  smooth();
  threshold = 1000;
  fill(200,0,0);
  background(200);
  noStroke();
}

void draw()
{
  if(millis() - prevMillis >= threshold)
  {
      ellipse(x, height/2, 50,50);
      
      x += 50;
      //prevMillis = millis(); 
      prevMillis += threshold; //More Precise over time, 
                              // if precision is important in your project.
 
  }  
}

