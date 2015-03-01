
void setup()
{
  size(600,600);
}

float znoise=0;
void draw()
{
  smooth();
  strokeWeight(5);
  float xnoise=0,ynoise=0,inc=0.01;
  
  for (int y=0; y<height; y++){
    for(int x=0;x<width;x++) {
      
      float r = noise(xnoise,ynoise,znoise)*255;
      stroke(r);
      point(x,y);
      xnoise = xnoise + inc;
    }
    xnoise=0;
    ynoise=ynoise+inc;
  }
  znoise+=0.1;
}


void mousePressed()
{
  fill(255);
  float angleInc = PI/28;
  float angle=0;
  for (int offset=-10; offset<width+10; offset+=20){
    for (int y = 0; y<=height; y+=2){
      float x = offset +20*sin(angle);
      line(x,y,x+10,y+10);
      stroke(0);
      angle +=angleInc;
    }
    angle +=PI;
  }
}
