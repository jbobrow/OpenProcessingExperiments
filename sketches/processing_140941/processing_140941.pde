
PImage myimage;
PImage shadaloo;
PImage face;
 
void setup( )
  {
    size(800,600);
   
  myimage = requestImage("russianskies.jpg");
  shadaloo = requestImage("shadalooinsig.png");
  face = loadImage("Zangiefface.png");
  face.filter(INVERT);
  }
   
  void draw()
  {
    if (myimage.width > 0)
    {
      image(myimage, 0, 0, width, height);
    }
   {
   image(shadaloo, 600,250,100,100);
   }
   {
 
   image(face, 150,50,100,100);
   }
 
 
// The Grid
 
    
   for (int x = 0; x < width; x += 10)
   {
     stroke(203,36,255);
     strokeWeight(1);
     line(x,0,x,height);
   }
   for (int y= 0; y < height; y +=20)
   {
     line(0,y,width,y);
   }
    
   //AAAYYYY, Greased Lightning!
   stroke(180,255,249);
   strokeWeight(4);
   float ly = 0.0;
   float lx = 0.0;
   while (lx < width)
   {
     float nextx = lx + random(10, 80);
     float nexty = ly +random(50);
   line(lx, ly, nextx, nexty);
   ly = nexty;
   lx = nextx;
   }
    
  //filter(POSTERIZE, 6);
}


