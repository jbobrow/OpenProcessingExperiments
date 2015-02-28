
void setup(){
  size(300,300);
}
int x=0;
void draw(){
  background(x,x+100,x);
  fill(x+10,x,10);
  ellipse(width/2,x+5,x,x+10);
  x++;
}

