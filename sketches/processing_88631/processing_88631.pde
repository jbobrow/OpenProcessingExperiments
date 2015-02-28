
//Tree from: http://www.openprocessing.org/sketch/68716
void setup()
{
  size(600,600);
}

int maxbranch = 5;
float ang1 = 0;
float ang2 = 0;
float distance;

void draw()
{
  background(0);
  ang2 = map(mouseX,0,width,0,2*PI);
  ang1 = map(mouseY, 0, 100, -PI,0);
  distance = 25;

  for(int i = 25; i < width; i+= 50)
  {
    for(int j = 25; j < height; j+=50)
    {
      pushMatrix();
      translate(i,j);
      branch(0);
      popMatrix();
    }
  }
 /* translate(300,350);
  branch(0);
  branch(3);*/

}

void branch(float inc)
{
  float count = inc;
  count++;
  stroke(0,255/(count/2));
  fill(random(170),random(150), random(100) , 255/(count/2));
  quad(-5/count,0,5/count,0,5/(count+1),-distance/(count),-5/(count+1),-distance/(count));
  ellipseMode(CENTER);
  if (count>1) ellipse(0,0,20/count,20/count);
  if (count < maxbranch){
    pushMatrix();
      translate(0,-distance/(count));
      rotate(ang1+ang2);
      branch(count);
    popMatrix();
    pushMatrix();
      translate(0,-distance/(count));
      rotate(-ang1+ang2);
      branch(count);
    popMatrix();
  }
}


