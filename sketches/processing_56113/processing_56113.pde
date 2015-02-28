
//----------------------
// by lali barriere 2012
//----------------------

color fons;
color fons_t;
color vermell;

float x,y;
int i;
float a,b;

void setup(){
  fons=color(220,220,240);
  fons_t=color(210,210,220,8);
  vermell=color(255,0,110);

  size(800,450);
  background(fons);

  x=0;
  y=height/2;
  i=0;
  a=height/4;
  b=height/5;
}

void draw(){

  noStroke();
  fill(fons_t);
  rect(0,0,width,height);

  fill(vermell);
  ellipse(x,y,5,5);

  mou();

}

void mou(){
  x=(x+1) % width;
  y=height/2+a*sin(radians(i/3))+b*cos(radians(i));
  i++;
}



