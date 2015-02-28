
float x,y,vx,vy;

void setup(){
 size (800,600);

background  (55,120,96);
}

void draw(){
   
   fill(85,vx+vx,vx,23);
  vx =(mouseX - x)/5;
  vy =(mouseY - y)/10;
  x=x + vx;
  y=y + vy;
 rect(x*2+1,y-8+3,50,16);
}

