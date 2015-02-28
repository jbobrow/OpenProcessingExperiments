
class Gota {
  float x,y;
  float velocidadY;
  float velocidadX;
  color c;
  color f;
  float r=8;
  float d=10;
  
  Gota(){
    
   
    r = 25;
    x = 20;
    y = -r*2;
    velocidadY = random (10);
    velocidadX = random (12);
    c = color (random (150), random (100), random (0));
    f = color (234,159,19,50);
  
   
  }
  
  void llover(){
   y += velocidadY;
   x+=velocidadX;
 
   
  }
  void rebotar (){
    if (y>= height){
      velocidadY = velocidadY *-1;
    }
    
    if ( x>=width || x<0){
      velocidadX= velocidadX*-1;
    }
  }
      
  void mostrar(){
    fill(f);
    noStroke();
    triangle(x ,y ,d,r,r,d);
    
    
    fill (c);
   rect (y,x,r,r,r,r);
    fill (c);
    rect (y,x,d,d,d,d);
    

  }
}

