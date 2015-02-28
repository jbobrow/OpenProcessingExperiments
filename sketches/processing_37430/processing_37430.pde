
void setup(){
  size(400,400);
  background(0);
  colorMode(RGB);
}

void draw(){
  for(int x=0;x<width;x+=2){
    smooth();
    stroke(0);
    rect(x,x+30,2*x,4*x);
    stroke(width,x,0);
    line(x,x+20,x*50,x+40);
    stroke(190);
    line(x,x+30,x,x+30);
  }
}

