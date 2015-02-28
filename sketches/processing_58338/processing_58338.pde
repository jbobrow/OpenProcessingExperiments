
class Pelota{
    Pelota (int posx, int posy, int radio){
    ellipse (posx, posy, radio, radio);
    }

void setup() {  
  size(250, 250);
  Balon= new Pelota(100,100,20);
  smooth();
  noStroke();
  background(0);  

}

void draw() {  
  
  }
