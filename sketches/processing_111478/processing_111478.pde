

// Aquarell_Rain.pde        2013-09-24
//
// Color drops are falling on my sheet...
// Only playing around with different filter functions.

void setup()
{
  size(512,512);
  noStroke();
  frameRate(15);
}

void draw()
{
  for (int i=0; i<10; i++)
  {
    float ms = millis();
    fill (255*noise(ms/1000)
         ,255*noise(ms/200)
         ,255*noise(ms/300));
    float r=10+random(20);     
    ellipse(random(width), random(height), r, r);
  }
  filter (ERODE);
  filter (BLUR,1);
 // if ((frameCount % 2) == 0)
  filter (DILATE);
  filter (DILATE);
}
void keypressed()
{
  save ("Aquarell_Rain.png");
}

