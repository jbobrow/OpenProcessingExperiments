
PImage gradPhoto;
boolean alreadyInverted = false;
 
void setup()
{
  size(400, 400);
  gradPhoto = requestImage("Chris_2010.JPG");
}

float xoff = 0.0;

void draw()
{
 if(gradPhoto.width > 0)
 {
   if(!alreadyInverted)
   {
   gradPhoto.filter(INVERT);
   alreadyInverted = true;
   }
  image(gradPhoto, 0, 0, width, height);
 }
 
  int xx = 0;
 while(xx < width)
 {
   stroke(255,0,0);
   line(xx, 0, xx, height);
   xx += 10;
 }
  
  for(int yy = 0; yy < height; yy += 10)
 {
   stroke(0,255,0);
   line(0, yy, width, yy);
 }
 
fill(#C833C9);
rect(10, 20, 55, 55);
rect(130, 20, 55, 55);
rect(10, 90, 55, 55);
rect(130, 90, 55, 55);
rect(200, 320, 55, 55);
rect(330, 320, 55, 55);
rect(200, 230, 55, 55);
rect(330, 230, 55, 55);

stroke(#21DBD6);
strokeWeight(10);
float ly = 225.0;
float lx = 100.0;
while(lx < 250)
{
  float nextX = lx + random(75);
  float nextY = ly + random(-10, 5);
  line(lx, ly, nextX, nextY);
  ly = nextY;
  lx = nextX;
}
strokeWeight(1);

stroke(#E5B617);
  strokeWeight(10);
  float lz = 100;
  float lw = 100;
while (lw < 450)
  {
    float nextW = lw + random(150);
    float nextZ=  lz + random(150);
    line(lw, lz, nextW, nextZ);
    lw = nextW;
    lz = nextZ;
  }
  strokeWeight(1);

//Testing noise() code from processingjs.org/reference/noise_/
stroke(#1917E5);
xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);

}




