
float[] xArray = new float[800];
float[] yArray = new float[800];
int initiator = 0;


void setup() 
{
  size(800,800);
  background(#FFFFFF);
  strokeWeight(1);
  stroke(0);

}

void draw() 
{
    fill(random(255),random(255),random(255),random(50) + 50);
  addRandoms();
  beginShape();
  for (int i = 1; i < xArray.length; i++)
    {
      vertex(xArray[i], yArray[i]);
    }
    vertex(xArray[1], yArray[1]);
  endShape();
}

void addRandoms() 
{
  if ( initiator < 100)
  {
    
    for (int i = 1; i < xArray.length; i++)
    {
      xArray[0] = 0;
      xArray[i] = i;
      yArray[0] = 50;
      yArray[i] = yArray[i-1] - random(10) + random(10);
    }
    initiator = initiator + 1000;
  }
  else 
    {
      for (int i = 1; i < yArray.length; i++)
        {
          yArray[i] = yArray[i] +  10 + random(6) - random(3);
        }
    }

}

void mousePressed()
{
  background(#FFFFFF);
 initiator = 0; 
  
}
