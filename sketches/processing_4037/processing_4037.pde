
void draw(){  
  for(int i = 0; i < numero; i++){
    p[i].Crea();
  }  
}  

class Pincel{  
  int x, y;  
  float diam;  
  color col;  
  int edad, edadMax;  


  Pincel(){  
    x = round(random(width));  
    y = 0;
    diam = 10;        
    col = imagen.get(x,y);
  } 
  


