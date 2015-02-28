
//Rosa Han
//March 17 2013
//My own Class- balls 

float myFloat  = 50;
 

 
Ball myCircle = new Ball (50,50,10);
Ball myCircle2 = new Ball (150,150,20);
Ball myCircle3 = new Ball (250,250,30);
Ball myCircle4 = new Ball (350,350,40);
Ball myCircle5 = new Ball (400,400,50);
Ball myCircle6 = new Ball (50,50,10);
Ball myCircle7 = new Ball (150,150,20);
Ball myCircle8 = new Ball (250,250,30);
 
  void setup () {
     
    size (500,300);
    smooth ();
    noStroke ();
     

   
}
 
 
  void draw () {
   
   
    background (255,200, map(mouseY, 0, height, 0 , 255));

     
    myCircle.checkCollisions ();
    myCircle2.checkCollisions ();
    myCircle3.checkCollisions ();
    myCircle4.checkCollisions ();
    myCircle5.checkCollisions ();
    myCircle6.checkCollisions ();
    myCircle7.checkCollisions ();
    myCircle8.checkCollisions ();
     
    myCircle.up (); 
    myCircle2.up ();
    myCircle3.up ();
    myCircle4.up ();
    myCircle5.up ();
    myCircle6.up ();
    myCircle7.up ();
    myCircle8.up ();
     
    
     
    myCircle.display();  
    myCircle2.display();
    myCircle3.display();
    myCircle4.display();
    myCircle5.display();
    myCircle6.display();
    myCircle7.display();
    myCircle8.display();
     
}

  class Ball {
     
     float x;
     float y;
      
     float xspeed;
     float yspeed;
 
     float circleSize;
      
   
     Ball (float  xpos, float ypos, float cSize) {
        
       x = xpos;
       y = ypos;
       circleSize = cSize;
        
       xspeed = random (5,10); 
       yspeed = random (-10,10); 
        
     }
      
     void up () { 
       x += xspeed;
       y += yspeed;
        
     }
      
     void checkCollisions () { 
                                 
       if ( (x<0) || (x>width)) {
         xspeed = -xspeed;    
       }
     
      if ( (y<0)  || (y>height)) {
         yspeed = -yspeed;
      }
     }
   
  void display () {
     
    fill (random (255), 0, random (255));
    ellipse (x,y,circleSize,circleSize);
  }
   
}
