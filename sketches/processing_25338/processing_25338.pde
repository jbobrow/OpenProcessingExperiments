
PImage img; 
   int pointillize      =      16; 
   int i = 0;
   int j = 0;
   
   void setup()
   {  
         size(658, 800); 
         img      =      loadImage( "xray.jpg");
         background(0); 
         smooth();   
    }   
    
   void draw()
   {
     
     for (i = 0; i < 100; i++)
     {
         int x      =    int(random(img.width)); 
         int y      =    int(random(img.height)); 
         int loc      =      x      +      y*img.width; 
         loadPixels(); 
         float r      =      red(img.pixels[loc]); 
         float g     =      green(img.pixels[loc]); 
         float b      =      blue(img.pixels[loc]); 
         noStroke();   

         fill(r,g,b,100); 
         ellipse(x,y,pointillize,pointillize); 
     }
    }
    
    void mousePressed()
    {
      save("xray2.tif");
    }

