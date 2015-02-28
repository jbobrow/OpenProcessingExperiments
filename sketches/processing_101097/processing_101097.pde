
float[] xArray = new float[3600];
float[] yArray = new float[3600];


void setup() 
{
  size(600,600);
  background(#FFFFFF);

}

void draw() 
{
setLocations();
strokeWeight(0);
stroke(random(255), random(255), random(255));
noFill();
beginShape();
for (int i=0; i < xArray.length; i++)
{
vertex(xArray[i], yArray[i]);
}
endShape();
}

void setLocations() 
{
  xArray[0] = 0;
  yArray[0] = height/2;
  for (int i=1; i < xArray.length; i++) 
  {
    xArray[i] = (xArray[i-1] + random(12) ); 
      xArray[i] = xArray[i-1] + random(3) - random(3);
  }
  for (int i=1; i < yArray.length; i++)
  {
    yArray[i] = (yArray[i-1] + random(2) - random(2)); 
  }


}
