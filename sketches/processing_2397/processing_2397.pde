
public class Rain { 
   
  float x; 
  float y; 
   
  float rainSize = 0; 
  float rainMax = 10; 
  float fallSpeed = 0.1; 
   
  Rain(float xp, float yp) { 
    x = xp; 
    y = yp; 
    registerDraw(this); 
  }; 
   
  void draw() { 
     
    if (rainSize < rainMax) { 
      //If the flower is smaller than its max size, grow 
      rainSize -= fallSpeed; 
    } 
    else { 
      //If the flower is at its max size, fall off the screen 
      y -= rainSize; 
    }; 
     
    //fill(255,255,255,50); 
    //ellipse(x,y,flowerSize,flowerSize); 
    image(raindrop, x, y, rainSize, rainSize); 
  }; 
   
}; 


