
//*************Cloud***********************//

class Cloud {
  float m;
  float x,y;
  float speed;
  color c;
  
 void display() {  
    noStroke();
    fill(c);

     for( int i= 0; i < clouds.length; i++)
   {
       ellipse(x, y, 150, 60);
       ellipse(x-30, y+10, 70, 50);
       ellipse(x+20, y+10, 60, 60);
       ellipse(x-40, y-15, 70, 50);
      
       
    }
 }

  
  Cloud() {
    m = 8;
    x = random(width);
    y = random(height);
    speed = random(1, 3);
    c = color(random(5, 50),random(150, 200),random(10, 250), random(50, 100)) ;
  }
  
  void move() {
    x += speed;
    
    if (x > width + 70) {
       x = -70; 
    }
  }  
  
   boolean reachedBottom(){
    if(x > height + m*4) {
      return true;
    }else{
      return false;
    }
   }
  

}

