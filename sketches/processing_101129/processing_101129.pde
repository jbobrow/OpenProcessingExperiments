
float[] xArray = new float[1200];
float[] yArray = new float[1200];
int initiator = 0;


void setup() 
{
  size(1200,900);
  background(#FFFFFF);
  strokeWeight(1);
  stroke(0);

}

void draw() 
{
  addRandoms();
  beginShape();
  for (int i = 1; i < xArray.length; i++)
    {
    if (xArray[i] < width-50){
      vertex(xArray[i], yArray[i]);
      }
    }
  endShape();
}

void addRandoms() 
{
  if ( initiator < 100)
  {
    
    for (int i = 1; i < (xArray.length); i++)
    {
      xArray[0] = 50;
      xArray[i] = xArray[i-1] + 1;
      yArray[0] = 0;
      yArray[i] = yArray[i-1] - random(1) + random(1);
    }
    initiator = initiator + 1000;
  }
  else 
    {
      for (int i = 1; i < yArray.length; i++)
        {
          yArray[i] = yArray[i] + 1.5 + random(2) - random(1);
        }
    }

}

void mousePressed()
{
  background(#FFFFFF);
 initiator = 0; 
  
}
