
int x=800;
int y=400;
int xspeed=3;
int yspeed=5;



void setup(){
  size(800,400);
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
ellipse(30,30,50,50);
stroke(0,0,0);
strokeWeight(3);
noFill();
ellipse(70,30,50,50);

stroke(255,255,0);
strokeWeight(3);
noFill();
smooth();
ellipse(50,60,50,50);
stroke(0,255,0);
strokeWeight(3);
noFill();
smooth();
ellipse(90,60,50,50);

stroke(255,0,0);
strokeWeight(3);
noFill();
//rect(0,0,width,height);


if((x>width)||(x<0)){
  xspeed=xspeed*-1;
}
if((y>width)||(y<0)){
  yspeed=yspeed*-1;
}
stroke(255,0,0);
noFill();
ellipse(x,y,50,50);


}


