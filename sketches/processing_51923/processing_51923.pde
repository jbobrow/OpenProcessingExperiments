
PImage stairs;
PImage swipe;
PImage bars;
PImage sky;
PImage stractor;
PImage skull;
PImage oSkull;

void setup ()
{
  background(255);
   size(640,480);
   smooth();
   stairs = loadImage("stairs.jpg");
   swipe = loadImage("swipe.jpg");
   bars = loadImage("bars.jpg");
   sky = loadImage("sky.jpg");
   stractor = loadImage("stractor.jpg");
   skull = loadImage("skull.jpg");
   oSkull = loadImage ("skull out.png");
   
   image(skull,0 , 0, 640, 480);
   
   
}

void draw()
{
 
}

void mouseReleased()
{
  
  for (int i=0; i<2; i++){
    
  tint(255, 111);
  image(stractor, random(width),random(height));
  image(bars, random(width),random(height));
  image(sky, random(width), random(height)); 
  image(swipe, random(width), random(height));
  image(stairs, random(width), random(height));
  }
  tint (255, 255);
  image (oSkull, 165, 0, 209*1.2,300*1.2);
}

