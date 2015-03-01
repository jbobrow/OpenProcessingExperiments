

PImage webImg;
void setup() {
  size(900, 900, P3D);
    String url = "http://exchangedownloads.smarttech.com/public/content/fb/fb8c87ab-edb7-4ed5-99bf-19fd56354d54/previews/medium/0001.png";
  // Load image from a web server
  webImg = loadImage(url, "png");
  background(0);
}
float n = 0;
float znoise = 0;
void draw()
{

  float xnoise =0, ynoise=0, inc = 0.01;
  for (int y=0; y<height; y++) {
    for (int x =0; x<width; x++) {
      float r = noise(xnoise, ynoise, znoise)*200;
      stroke(r,1/r,r,50);
   
      point(x, y);
      xnoise = xnoise + inc;
      
    }
    xnoise =0;
    ynoise = ynoise + inc;
  }
  znoise += 0.1;
  fill(0);
triangle(width/1.9,height*0.85,0,height/2,0,height*0.85);
triangle(width/1.9,height*0.85,width,height/2,width,height*0.85);
rect(0,height*0.85,width,height);
image(webImg, width/2, height*0.7);

}

