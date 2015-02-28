

class Gota {
  float x,y;
  float velocidadY;
  float velocidadX;
  color c;
  color f;
  color t;
  float r;
  float g;
  float d=12;
  
  Gota(){
   
    r = 30;
    g= 40;
    x = 50;
    y = -r*6;
    velocidadY = random (10);
    velocidadX = random (12);
    c = color (255,0,0);
    f = color (0,175,10);
    t= color (255,230,0);
   
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
    fill(c);
    noStroke();
    ellipse(x ,y ,d,r);
    fill (f);
    ellipse (x,y,d,f);
     fill(t);
    noStroke();
    ellipse(x,y,d,g);

  }
}

