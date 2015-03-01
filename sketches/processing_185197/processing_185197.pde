
void setup() {
  size(500,500);
  background(255);
}

void draw() { 
  for(int x = 0; x<250; x=x+5){
    line(0,x,x,x);
    for(int y = 250; y<500; y=y+5){
      stroke(0);
      line(250,y,y,y);
  }
}
}


