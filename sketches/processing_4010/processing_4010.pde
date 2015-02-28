

ArrayList pinceles;  
  
void setup(){  
  size(500, 675);  
  smooth();  
  pinceles = new ArrayList();  
  background(255);  
  masPinceles();  
   
  colorMode (HSB,255);  
}   

  
void draw(){  
  for(int i = 0; i < pinceles.size(); i++){  
    Pincel p = (Pincel)pinceles.get(i);  
    p.dibuja();  
  }  
}  
  
 
  
void masPinceles(){  
   
  for(int i = 0; i < height; i+=10){  
    Pincel p = new Pincel(0, i);  
    p.ang = 0;  
    pinceles.add(p);  
  }   
}  
class Pincel{  
  int x, y, x2, y2;  
  float ang, rad;  
  int edad, edadMax, seed; 
  boolean vivo; 
  
  Pincel(int px, int py){ 
    x = px;  
     
     
    edad=0; 
    rad = 10; 
   edadMax = round(random(1000,30000));  
   vivo = true; 
   seed=round(random(100)); 
  }  
  
  
  
  void dibuja(){  
    // sólo si está vivo  
    if(vivo){  
      calc();  
    }  
  
  }  
 
  void calc(){ 
    noiseSeed(seed);  
  
    ang += (noise(millis()/200*PI) - 0.5) * PI/4;  
  
    x2 = round(x + cos(ang) * rad);  
    y2 = round(y + sin(ang) * rad);  
  

     
 

    strokeWeight(random(0.1,1.1)); 
    
 curve(x,y, x2, y2,x,y,x2-40, x*y2); 
    x = x2;  
    y = y2;  
  
    if (x < 60) x += width;  
    if (y < 40) y += height;  
    if (x > width) x -= width;  
    if (y > height) y -= height;  
  
edad ++;  
     
  
    // y muere si ya es tiempo  
    if(edad == edadMax) vivo = false;  
  
  
  
  }  
  
}  
  
 
 


