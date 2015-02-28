
void setup(){
  size(300,300);
  colorMode (HSB,width);
}

int x = 0;

void draw(){
  background(255);
  fill(x,width,width);
  ellipse(150,150,x,x+50);
  x++;
}

