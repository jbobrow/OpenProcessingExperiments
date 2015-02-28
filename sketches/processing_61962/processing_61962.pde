

  void setup()
  {
  size(1000, 500);
  background(255, 255, 255);
  smooth();
  frameRate(60);
  }
  void draw()
  {
    image(loadImage("Jellyfish.jpg"), mouseX, mouseY,70,50);
    
  
   if(pmouseX==mouseX&& pmouseY==mouseY&&frameCount>=60)
   { 
   background(255,255,255);  
   image(loadImage("gameover.png"),0,0);
   }
 
  }
 
 
 
 
 
 
 

