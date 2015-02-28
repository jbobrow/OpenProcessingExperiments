
PImage type;
int x, y, prevX, prevY;


void setup(){
  colorMode (HSB,360,100,100);
  size (1000,650);
  smooth();
  type = loadImage ("type.png");
  prevX = 0;
  prevY = 0;
  
  background (0,0,100);
  
    for (int i = 0; i < 100000; i++){
      x = int(random(width));
      y = int(random(height));
      
        
        color cp = type.get(x,y);
        color prevcp = type.get(prevX, prevY);
        float b = brightness (250);
        float h = hue (71);
        float s = saturation (29);
        float prevb = brightness (prevcp);
      
            if (b != 150){
            strokeWeight (0.5);
            //line (x,y,prevX, prevY);
            fill (random (h), random (s), random (b));
            //ellipse (x,y,10,10);
            rect (x, y, 5, 5);
            }
             
             
             prevX = x;
             prevY = y; 
    }
    
        for (int i = 0; i < 15000; i++){
      x = int(random(width));
      y = int(random(height));
      
        
        color cp = type.get(x,y);
        float b = brightness (cp);
        float s = saturation (cp);
        float h = hue (cp);

      
            if (b != 100){
            strokeWeight (0.5);
            fill (h, s, b); 
            //fill (random (h), random (s), random (b));
            rect (x, y, 5, 5);
            }
    }
    
    //save ("profile.jpg");  
}


