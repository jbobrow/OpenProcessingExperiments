
// Doubling shapes, Laura R., Computer Programming 1, 14-15
PImage w;
PImage r;
float end = 1.0;
void setup ()
{
  size(700,500);
  w = loadImage ("http://whitneytphoto.files.wordpress.com/2011/03/dsc_0020-2.jpg");
  r = loadImage("http://artsytime.com/img/artwork/soap-bubbles/soap-bubbles03.jpg");
  frameRate(1);
}
void draw ()
{
  image (w,0,0,700,500);
  int raindrops = 1;
  
  noStroke();
  fill(155,292,255,30);
  while(raindrops <= end)
  {
    ellipse(int(random(10,690)),int(random(200,490)),20,30);
    raindrops++;
    
  }
  if (end <= 257)
  {
    end = end * 2;
  }
}




