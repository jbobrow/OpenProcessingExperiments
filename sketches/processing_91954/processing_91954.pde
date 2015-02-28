
float x = 50;
float y = 50;
float b = 0;
int runningTime; 

void setup(){
  size (600,600);
}

void ellip(){
  strokeWeight(0);
  ellipse (150, 150, x/4, y/4);
  ellipse (200, 200, x/2, y/2);
  ellipse (300, 300, x, y);
  ellipse (400, 400, x/2, y/2);
  ellipse (450, 450, x/4, y/4);
  fill (runningTime/500, runningTime/250, runningTime/500); 
}

void draw(){
  
  background (runningTime, 70, runningTime);
  smooth (0);
  stroke (0);
  ellip();
  
  runningTime = millis(); 
  
 
 //begins expanding after 3 seconds 
  
  
  if (runningTime > 3000) {
    x+=1; y+=1; 
    
    //begins throbbing when x exceeds or = 500
      if (x >= 400) {
        x-=50;
        
        if (y>=400){
          y-=50;
    
    if (runningTime > 10000) {
      x+=10; y+=10; 
      fill (230, 0, 0);
      
      if (runningTime > 15000) {
      x+=10; y+=10; 
      fill (250, 0, 0);
      
      if (runningTime > 20000) {
      x+=10; y+=10; 
      fill (250, 0, 0);
      
      if (runningTime > 25000) {
      x+=150; y+=150; 
      fill (250, 0, 0);
    
   
      
       

}
  }
  }
  }
      }
  }
}
}


