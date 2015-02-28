
int sSize = 100;
PImage p;
int pixRatio = 20;
boolean useRect = true;

void setup()
{
  p   = loadImage("wamazon.jpg");
 size(750,661);
 image(p, 0, 0);
 	
pixelate(pixRatio);

}

public void pixelate(int cubeSize)
{
//int cubeSize = 20; // in pixels

for (int i=0; i<width; i+=cubeSize)
 for (int j=0; j<height; j+=cubeSize)
 {
   color c = avgColor(i, 
                      j, 
                      cubeSize, 
                      cubeSize);
 
   fill(c);
   if (useRect)
    rect(i,j,cubeSize, cubeSize);
   else
    ellipse(i, j, cubeSize, cubeSize);
   
 }


}


void draw()
{
 
}

public color avgColor(int x, int y, int w, int h)
{

 int cR=0, cG=0, cB=0;
 
 for (int i=x; i<x+w; i++)
  for (int j=y; j<y+h; j++)
  {
   color c=  get(i,j);
   cR += (c >> 16) & 0xFF;  
   cG += (c >> 8) & 0xFF;   
   cB += c & 0xFF;          
  }

 cR /=  w*h;
 cG /=  w*h;
 cB /=  w*h;

 return color(cR,cG,cB);

}

void keyPressed(){
  
  if (key == 'z') {
    image(p, 0, 0);
    pixelate(++pixRatio);
  } else 
    if (key == 'x') {
       image(p, 0, 0);
       pixelate(--pixRatio);
  } else 
    if (key == 'a') {
      useRect = !useRect;
      image(p, 0, 0);
      pixelate(pixRatio);
  }
}



