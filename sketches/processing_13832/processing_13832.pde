
float i,y,x,Num;
void setup() {
  size(600,600);
  background(255);
  Num=20;
}
void draw() {
  x = x%Num;
  x ++;
  if(mousePressed && (mouseButton == LEFT) && Num < 600) {
    Num = Num + 1;
  }
  else if(mousePressed && (mouseButton == RIGHT) && Num > 20) {
    Num = Num - 1;
  }
  for(y=300; y<1200; y = y+Num) {
    for(i=300; i<1200; i = i+Num) {
      ellipse(i,y,x,x);
      ellipse(i,600-y,x,x);
      ellipse(600-i,y,x,x);
      ellipse(600-i,600-y,x,x);
    }
  }
}


