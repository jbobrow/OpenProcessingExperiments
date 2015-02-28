
class Pelota{  
    Pelota(int posx,int posy,int radio){             
      ellipse(posx,posy,radio,radio);  
 }
 };
Pelota Balon1;  
   
void setup(){  
  size(800,800);  
  background(0);  
  Balon1 = new Pelota(100,100,50);  
  smooth();  
  noStroke();  
}  
 
