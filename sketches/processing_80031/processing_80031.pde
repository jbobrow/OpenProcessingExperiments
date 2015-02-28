
class Gota {
  float x,y;
  float velocidad;
  color c;
  color d;
  float r;
  float j;
  
  Gota(){
    j = random (18);
    r = 9;
    x = random (width);
    y = -8;
    velocidad = random (1,10);
    c = color (255, 10,100);
    d = color (150,100,255);
     frameRate (15);
  }
  
  void llover(){
   y += velocidad;
   x+=velocidad/4;
  }
  
  void mostrar(){
    fill(c);
    noStroke();
    ellipse(x ,y , random (r), random (j));
    fill (d);
    rect (y,x,random (r), random (j));
    
  }
}

