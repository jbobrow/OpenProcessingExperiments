
int x,y;

void setup(){
  size(800,600);
  smooth(); 
  x = 100;
  y = 100;
}

void draw(){
  ellipse(x,y,30,30); 
}

void mouseDragged(){
  if(dist(mouseX,mouseY,x,y) < 10){
    x = mouseX;
    y = mouseY;
  } 
}

