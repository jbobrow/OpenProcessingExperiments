
int x= 30;
float y= 0;
int velocidad= 1;
float velocidady= 0.1;
int r= 30;



void setup() {
  size(200,200);
}
void draw() {
  background(0);
  noStroke();

  x= x+velocidad;
  y= y+velocidady;
  if((x>width)||(x<0)) {
    velocidad=velocidad*-1;
   r=15;
  
  if((y>height)||(y<0)) {
    velocidady=velocidady*-0.15;
    r=15;
  }
  }
    fill(255,0,0);
  ellipse(x,y,r,r);
  r=constrain(r-2,30,64);
}


