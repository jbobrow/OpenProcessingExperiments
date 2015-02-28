

int origenX, origenY;
int radio;
int grados;
float x, y;
size(400,400);
origenX = width/2;
origenY = height/2;
radio = width/3;
grados = 0;
background(255); 
smooth();
for(float i = 0; i < 360; i+=0.5){
  stroke(255,0,255,i);
  strokeWeight(i*0.1);
  x = origenX + cos(radians(i)) * radio;
  y = origenX + sin(radians(i)) * radio;
  point(x,y);
}



