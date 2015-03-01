

void setup(){
  size(600,600);
  PImage img;
img=loadImage("20GLHS4black.jpg");
background(255);
image(img,25,255);
image(img,25,255);
tint(0,0);

}
 
float znoise = 0;
void draw()
{
  float xnoise=0.5, ynoise=0.5, inc =0.25;
  
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      
      float r =noise(xnoise,ynoise,znoise)*255;
      stroke(r);
      point(x,y);
      xnoise = xnoise+inc;
    }
    xnoise=5;
    ynoise=ynoise+inc;
  }
  znoise *=0.1;
}

