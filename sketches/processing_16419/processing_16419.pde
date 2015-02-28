

size(297,420);

int X, Y;
float radio;
float x, y;

X = width/2;
Y = height/2;
radio = width/0.5;
 
colorMode(HSB,TWO_PI);
background(TWO_PI);
smooth();
strokeWeight(40);
for(float a = 0; a < TWO_PI; a+=TWO_PI/12){
  x =X + cos(a) * radio;
  y =X + sin(a) * radio;
  stroke(a,TWO_PI,TWO_PI,PI);
  line(X,Y,x,y);
}










                
                
