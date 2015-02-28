
 
Car carro1;

void setup(){
size (400,400);
background(0);

carro1 = new Car ( 40, 50, 200);

}

void draw (){
background(0);
 
  carro1.drive ();
  carro1.display ();
  
}

class Car{
  
  float r,g,b;
  int xpos;
  int ypos;
  int xspeed;
  

  
  Car ( int t_xpos, int t_ypos, int t_xspeed ){
  
  xpos = t_xpos;
  ypos = t_ypos;
  xspeed = t_xspeed;
  
  r = random(255);
  g = random(255);
  b = random(255);
    
  }
  
  void drive (){
    
    xpos = xpos + xspeed;
    if (xpos > width){
      xpos = 0;
      ypos = (int) random(height);   
      
       r = random(255);
       g = random(255);
       b = random(255);
}
       
  }

   void display (){
   
   fill(r,g,b);  
   ellipse (xpos, ypos, 150, 150);
     
   }  
}


