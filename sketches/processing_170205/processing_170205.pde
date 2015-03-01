
float xnoise =0, ynoise=0, inc = 0.02;

void setup() {
  size(600,600);
  frameRate(20);
}
float znoise =0;
void draw() 
{
  PImage webImg;
  String url = "http://shalondagordon.com/wp-content/uploads/2013/05/heart2.jpg";
  webImg=loadImage(url, "gif");
  image(webImg,0,0,600,600);
  
 
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      
      float r = noise(xnoise,ynoise)*255;
      strokeWeight(4);
      stroke(r,10);
      point(x,y);
      xnoise = xnoise + inc;
    }
    xnoise =0;
    ynoise = ynoise +inc;
  }
   //<>//
  
  stroke(#FCA1BC,100);
  strokeWeight(7);
  
  float t = 0;
  float tDelta = radians(1);
  float w = map(mouseX, 0, width, 0.1, 10);
  
  for (int x=0; x<width; x++) {
    float y = height/2 - 100*sin( w * t);
    point(x,y);
    t += tDelta;
  }
}

