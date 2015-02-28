
float a = 0.0;

void setup(){
  size(600,600);
  background(0);
}

void draw(){
}

void mouseDragged(){
  a += 0.1;
  translate(mouseX,mouseY);
  rotate(a);
  stroke(0,255,0);
  line(0,100,10,10);
}

