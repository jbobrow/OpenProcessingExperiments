
float x,y,vx,vy;

void setup(){
 size (800,600);

background  (55,120,96);
}

void draw(){
   
   fill(85,x,vx+vx);
  vx =(mouseX - x)/5;
  vy =(mouseY - y)/10;
  x=x + vx;
  y=y + vy;
  triangle(x-2,y, x+2,2*y+10, vx+x+20,y+10);
 ellipse(x,y-10/5,x,x-8/5); 
}

