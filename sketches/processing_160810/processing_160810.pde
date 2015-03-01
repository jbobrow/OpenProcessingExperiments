
void setup(){
  size(600,600);
  background(255);
}

void draw(){
  drawStick(width/2, height/2);
}

void drawStick(int x, int y){
  ellipse(x,y,50,50);
  line(x,y+180,x,y);
  line(x+80,y+40,x-50,y+100);
  line(x-100,y+250,x+100,y+100);
  fill(0);
}

