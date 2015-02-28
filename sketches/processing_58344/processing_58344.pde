
class Pelota{
    int posx_int, posy_int, radio_int;
    Pelota (int posx, int posy, int radio){
    ellipse (posx, posy, radio, radio);
    posx_int=posx;
    posy_int=posy;
    radio_int=radio;
    }

int colorear (int color){
    fill (color);
    ellipse(posx_int, posy_int, radio_int, radio_int);
}

};
Pelota Balon;
void setup() {  
  size(300,200);
  background(0);  
  Balon= new Pelota(100,100,20);
  smooth();
  noStroke();
}

void draw() {  
  if (dir==0){
  Balon.colorear(count);
  count++;
  if (count==255) dir=1;

  }
  else{
  Balon.colorear(count);
  count--;
  if(count==0) dir=0;
 
}
  }
