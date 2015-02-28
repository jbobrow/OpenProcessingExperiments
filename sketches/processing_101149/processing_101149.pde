
float[] xArray = new float[800];
float[] yArray = new float[800];
int initiator = 0;
float separator = 5;

void setup() 
{
  size(800,800);
  background(0);
  strokeWeight(10);
  stroke(255);

}

void draw() 
{
    fill(0,0,0);
    stroke(255,255,255,random(100));
  addRandoms();
  beginShape();
  for (int i = 1; i < xArray.length; i++)
    {
      vertex(xArray[i], yArray[i]);
    }
      for (int i = 1; i < xArray.length; i++)
    {
      vertex(xArray[xArray.length-i], yArray[yArray.length-i]);
    }

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
      yArray[i] = yArray[i-1] + random(2) - random(2);
    }
    initiator = initiator + 1000;
  }
  else 
    {
      for (int i = 1; i < yArray.length; i++)
        {
          yArray[i] = yArray[i] +  separator + random(1) - random(1);
        }
    }
separator = abs(separator - .015);
}

void mousePressed()
{
  background(0);
 initiator = 0; 
 separator = 5;
  
}
