
 /* @pjs preload="spaceship.png"; */
//This was coded by Mia Rosado! ^__^ 

PImage myimage;
PImage star; 
PImage ship; 

void setup( )
  {
    size(800,600); 
  
  myimage = requestImage("rosalina.jpg");
  star = requestImage("394px-PonyMaker_ShootingStar.png"); 
  ship = loadImage("spaceship.png");
  ship.filter(INVERT);
  }
  
  void draw()
  {
    if (myimage.width > 0)
    {
      image(myimage, 0, 0, width, height);
    }
   {
   image(star, 600,250,100,100);
   }
   {

   image(ship, 150,50,100,100);
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


