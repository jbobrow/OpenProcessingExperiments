
//old tv set
PImage img;
int side=5;
color colorin;
float wide,delta;
float x1i,y1i,x2i,y2i;
void setup()
{
  img=loadImage("Shiffman.jpg");
  //leftRight=img.width*side;
  //upDown=img.height*side;  
  size(275,275);
  frameRate(1);
}
void draw()
{
  background(0);
  stroke(255);
  fill(255);
  for(float r=side;r<img.height*side/1.4;r+=side)
  {
    delta=side/(r);
    
    for(float i=0;i<img.width*2*PI;i+=delta)
    {
      x1i=img.width*side/2+r*cos(i);
      y1i=img.height*side/2+r*sin(i);
      x2i=img.width*side/2+r*cos(i+delta);
      y2i=img.height*side/2+r*sin(i+delta);
      colorin=img.get(int(x1i/side),int(y1i/side));
      wide=(blue(colorin)/256)*side;
      strokeWeight(wide);
      line(x1i,y1i,x2i,y2i);
    }
  }  
}



