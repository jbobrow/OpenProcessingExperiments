
void setup(){
  size(600, 400);
  background(255);
  smooth(1);
}

int n = 100;
int dir = 1;

void draw(){  
  fill(512-n,512-n,n);
  ellipse(mouseX, mouseY, 100, 100);
  if(n == 0 || n == 512){
    dir = dir * -1;
  }
  n = n + dir;
}
