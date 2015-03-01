

int x;
int y;
int mida;

void setup(){
  background(150);
  size(500,500);
  x=100;
  y=100;
  mida=100;
}

void draw(){
  ellipse(x-25,y-25,mida/1.5,mida/1.5);
  ellipse(x+250,y,mida*1.3,mida*1.3);
  ellipse(x,y+250,mida*1.3,mida*1.3);
  ellipse(x+250,y+200,mida,mida);
}
