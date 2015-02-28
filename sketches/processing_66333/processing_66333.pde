
int ypos;
boolean direction = false;

void setup(){
  size(300,600);
  background(255);
  smooth();
}
void draw(){
  fill(199,255,0);
  background(0);
  ellipse (150, ypos, 20, 20);
  frameRate(100);
    if( ypos>=0 && direction==false){ypos+=10;}
    if( ypos>=590){direction=true;}
    if(ypos<=590 && direction==true){ypos-=10;}
    if(ypos<=10){direction=false;}
}



