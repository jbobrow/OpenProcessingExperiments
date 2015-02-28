
float x = 0.0, y= 0.0;

void setup(){
  size (400, 500);
  smooth();
  
}

void draw(){
  background(0);
  
  x = mouseX;
  y = mouseY;
  
  if (x < width/2) {
  ellipse (x, y, 40, 10); 
}

else {
rect(x,y,10,10);
}
}
