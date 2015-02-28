
float counter =0;

void setup()
{ size(400,400);
colorMode(HSB,360,100,100);
}
void draw()
{
  background(0);
  translate(width/2,height/2);
  for(int i=0;i<10;i++)
  {
    pushMatrix();
    translate(cos(counter+i/3.0)*400,sin(counter+i)*100);
    float h =map(sin(counter),-1,1,250,270);
    float b = map(sin(counter),-1,1,0,50);
    fill(h,100,b);
    ellipse(0,0,40,40);
    counter += 0.001;
    popMatrix();
  }
}
