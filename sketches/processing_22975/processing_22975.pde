
//1337399

PImage img, img2;
int x, y, prevX, prevY;

void setup()
{
   colorMode(HSB, 360, 100, 100);
   size(600, 260);
   smooth();
   img = loadImage("Gothic_tpye.png");
   prevX = 0;
   prevY = 0;
   
   background(0, 0, 100);
   strokeWeight(.5);
   
   for(int i = 0; i < 30000000; i++){
    
     x = int(random(width));
     y = int(random(height));
     
     color cp = img.get(x, y);
     color prevcp = img.get(prevX, prevY);
     
     
     float b = brightness(cp);
     float prevb = brightness(prevcp);
     
     if(b != 0 && prevb != 0 && dist(x, y, prevX, prevY) < random(0, 35)){
      
         line(x, y, prevX, prevY);
       
     }
     
     prevX = x;
     prevY = y;
     
   }
  
  
}

