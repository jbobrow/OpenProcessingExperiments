
float theta=0;
int group=15;

void setup()
{
  size(600,600);
  stroke(0);
  noFill();
}

void draw()
{
  background(255);
  for(int i=0;i<group;i++)
  {
    pushMatrix();
    translate(width/2, height/2);
    int offset = i/2+i;
    rotate(radians(theta*offset));
    rect(0,0,i*19,i*19);
    fill(144,144,144,255/(i*2+1));
    popMatrix();
  }
  theta += .25;
  //if (frameCount%6==0 & frameCount<1500) saveFrame("image-###.gif");
}


