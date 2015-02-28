
int x = 50;
int y = 50;
int w = 100;
int h = 75;

void setup(){
  size (200,200);
}
void draw(){
  background (255);
  stroke(0);
  if((mouseX>50)&&(mouseX<150)&&(mouseY>50)&&(mouseY<150)){
    rect(x,y,w,h);
    fill(150);
  }else {
    background(255);
  }
}

