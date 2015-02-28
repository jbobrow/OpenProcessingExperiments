
int x=400;
int y=400;
int xspeed=3;
int yspeed=10;

void setup(){
  size(400,400);
  smooth();
  background(255);
}


void draw(){
  
  x=x+xspeed;
  y=y+yspeed;
  background(255);

stroke(0,0,255);
strokeWeight(3);
noFill();
smooth();
//azul
ellipse(110,180,80,80);
stroke(0,0,0);
strokeWeight(3);
noFill();
//negro
ellipse(200,180,80,80);

stroke(255,255,0);
strokeWeight(3);
noFill();
smooth();
//amarillo
ellipse(154,230,80,80);
stroke(0,255,0);
strokeWeight(3);
noFill();
smooth();
//verde
ellipse(246,230,80,80);

stroke(255,0,0);
strokeWeight(3);
noFill();

stroke(255,0,0);
//rojo
ellipse(x,y,80,80);

if((x>width)||(x<0)){
  xspeed=xspeed*-1;
}
if((y>width)||(y<0)){
  yspeed=yspeed*-1;
}
}
