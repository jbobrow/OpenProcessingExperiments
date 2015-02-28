
 
Big ball1;

void setup(){
size (400,400);
background(0);

ball1 = new Big ( 60, 80, 100);

}

void draw (){
background(0);
 
  ball1.drive ();
  ball1.display ();
  
}

class Big{
  
  float r,g,b;
  int xpos;
  int ypos;
  int xspeed;
  

  
  Big ( int t_xpos, int t_ypos, int t_xspeed ){
  
  xpos = t_xpos;
  ypos = t_ypos;
  xspeed = t_xspeed;
  
  r = random(250);
  g = random(255);
  b = random(0);
    
  }
  
  void drive (){
    
    xpos = xpos + xspeed;
    if (xpos > width){
      xpos = 0;
      ypos = (int) random(height);   
      
       r = random(250);
       g = random(255);
       b = random(0);
}
       
  }

   void display (){
   
   fill(r,g,b);  
   ellipse (random(xpos), random(ypos), 500, 500);
     
   }  
}


