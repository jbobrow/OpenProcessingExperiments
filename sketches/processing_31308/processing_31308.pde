
//Code elements a derivation of week 10 class examples
// the objects tutorial on processing.org
// and code from pages 402-404 in the textbook.

Nano ntube1, ntube2, ntube3,ntube4,ntube5;


void setup(){
  size (900,900);
  background (0);
  fill (255);
  smooth();
  ntube1 = new Nano(13,2,40,60,3,4);
  ntube2 = new Nano(500,6,7,600,7,8);
  ntube3 = new Nano(90,0,300,800,1,2);
  ntube4 = new Nano(3,4,700,5,5,6);
  ntube5 = new Nano(700,500,500,8,9,0);
}

void draw(){
  ntube1.display();
  ntube1.spot();
  ntube2.display();
  ntube2.spot();
  ntube3.display();
  ntube3.spot();
  ntube4.display();
  ntube4.spot();
  ntube5.display();
  ntube5.spot();
}

class Nano {

float x;
float xx;
float y;
float yy;
float i;
float angle;
  
Nano (float tempx, float tempy, float tempxx, float tempyy, float tempi, float tempangle){
x = tempx;
y = tempy;
xx = tempxx;
yy = tempyy;
i = tempi;
angle = tempangle;
}

void display() {
  beginShape();
for(int i=0; i <= 1000; i++){
y = cos (radians(i*43)) * 200 + height/2;
x = sin (radians(i*18)) * 200 + height/2;
vertex (x,y);
}
vertex (xx,yy);
endShape();

}
void spot(){
  xx++;
  yy++;
}
}

