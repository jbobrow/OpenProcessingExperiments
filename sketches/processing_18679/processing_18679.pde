
void setup(){
  size(300,300);
  colorMode(HSB,width);
}

int x=150;
void draw(){
  stroke(x,width,height);
  ellipse(x,x,height-x,height-80);
  x++;
}

