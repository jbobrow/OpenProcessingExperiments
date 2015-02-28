
int scale = 20;
int s = 7;

void setup()
{
  size(640,640);
  smooth();
  noStroke();
  background(200,150,100);
}

void draw()
{
  for(int i = 0; i < width; i+= scale)
  {
    for(int j = 0; j < height; j+= scale)
    {
      fill(0);
      stroke(0);
      rect(i,j,scale,scale);
      Object(i,j,random(s));
    }
  }
}

void Object(float xPos, float yPos, float step)
{
  fill(xPos + yPos, xPos/2, yPos/3,random(255));
  beginShape();
  vertex(xPos,yPos);
  vertex(xPos + step,yPos + step);
  vertex(xPos + step * 2, yPos + step);
  vertex(xPos + step, yPos + step * 2);
  vertex(xPos + step * 2, yPos + step * 3);
  vertex(xPos, yPos + step * 2);
  vertex(xPos - step * 2, yPos + step * 3);
  vertex(xPos - step, yPos + step * 2);  
  vertex(xPos - step * 2, yPos + step); 
  vertex(xPos - step, yPos + step);
  vertex(xPos, yPos);   
  endShape();

  //stroke(random(100), random(50),random(255));
  //ellipse(xPos,yPos, random(s),random(s));
}




