
class Gota{
  float x,y;
  float velocidad;
  color c;
  float r;
  
  Gota(){
    r=8;
    x= random (-500,width);
    y= -8;
    velocidad = random (1,10);
    c= color (79,77,255);
  }
  
  void llover(){
    y+=velocidad;
   // x+= velocidad/4;
  }
  
  
  void mostrar(){
    fill(c);
      noStroke();
      triangle(x*r,y+r,x*r,y*r,x*r+10,y*r+10);
    }
  }


