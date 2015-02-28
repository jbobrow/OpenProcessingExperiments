
float[] xArray = new float[8600];
float[] yArray = new float[8600];


void setup() 
{
  size(1800,900);
  background(#000000);

}

void draw() 
{
setLocations();
strokeWeight(0);
stroke(random(225), random(225), random(225), random(100));
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
  yArray[0] = height;
  for (int i=1; i < xArray.length; i++) 
  {
    xArray[i] = (xArray[i-1] + random(40) - random(40)); 

  }
  for (int i=1; i < yArray.length; i++)
  {
    yArray[i] = (yArray[i-1] + random(12)); 
          yArray[i] = yArray[i-1] + random(5) - random(5);
  }


}
