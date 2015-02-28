
int x =200;
int y =20;
int w =60;
int h =60;

void setup(){
  size (320,240);
}

void draw(){
  smooth();
  background(255);
  x = mouseX;
  y = mouseY;
rect(x, y, w,h);
ellipse(x+15,y+15,10,10);
ellipse(x+w-15,y+15,10,10);
println("x = " +x);
}
