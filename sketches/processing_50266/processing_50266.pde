
class SuperSlowBall extends  SlowBall {
   float ang;
  float x=200;
  float y=200;

  
  
  void move(){

    super.move();
   x+= (mouseX-x)/100;
    y+= (mouseY-y)/100;
    x-= cos(ang)*2;
    y-= sin(ang)*2;
    
         ang += .08;
         
   super. display();
   
  
    
 
  
  
  
  fill (255);
   ellipse (x, y, 30, 30);
   
   
  }
}



