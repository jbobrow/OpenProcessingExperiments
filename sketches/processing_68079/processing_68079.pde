
int x = 0;
int y = 0;

void setup(){
  size(400,400);
  background(50);
  stroke(0,0,100);
  fill(50,50,0);
}

void draw(){
  x = mouseX;
  y = mouseY;
  ellipse(width/2,height/2,x,y);
}

void mousePressed(){
  background(x, y, 0);
  fill(0,x,y);
}


