
int x = 150;
int y = 150;
int speed = 2;
void setup() {
  size(300, 300);
  background(0);
  rectMode(CENTER);
  x=150;
  y=150;
}

void draw() {
  rect(x,y,10,10);
  if(mousePressed){
          setup();
  }
  if((x!=mouseX)||(y!=mouseY)){
      if(mouseX<x){
          x-=speed;
      }
      if(mouseX>x){
          x+=speed;
      }
      if(mouseY>y){
          y+=speed;
      }
      if(mouseY<y){
          y-=speed;
      }
  }
}

                
                                                                                
