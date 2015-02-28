
size (700, 500); 
background(#FFFFFF);
noStroke();
 
for (int x=1; x<35; x=x+1) {
    for (int y=1; y<25; y=y+1) { 
     
     //random color
      float rRainbow = random (0, 500); 
      
        
      
        fill (rRainbow);
      
      //makes white boxes invisible
      if (rRainbow <= 255){
      stroke (0);
      rect (x*20, y*20, 15, 15);
    
      
      }
      
    }
    
}


                
                
