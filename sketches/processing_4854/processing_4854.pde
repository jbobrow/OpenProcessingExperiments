
int origenX, origenY;
float radio;
float x, y;
size(400,400);

origenX = width/2;
origenY = height/2;
radio = width/4;

colorMode(HSB,TWO_PI);
background(TWO_PI);
smooth();
strokeWeight(40);
for(float i = 0; i < TWO_PI; i+=TWO_PI/13){
  x = origenX + cos(i) * radio;
  y = origenX + sin(i) * radio;
  stroke(i,TWO_PI,TWO_PI,PI);
  line(origenX,origenY,x,y);
}


