
float x,y,vx,vy;

void setup(){
  x=100;
  y=500;
  size (800,600);

background  (55,120,96);
}

void draw(){
   
   fill(85,vx+vx,vx,23);
  vx =(mouseX - x)/5;
  vy =(mouseY - y)/10;
  x=x + vx;
  y=y + vy;
 rect(x,y,27-2*x,16);
}


