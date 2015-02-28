
int width = 400;
int height = 400;

int x = width/2;
int y = width/2;
int px = width/2;
int py = width/2;

int r = 0;

void setup(){
  size(width, height);
  background(255);
  frameRate(100);
}

void draw(){
  r = (int)random(4);
  if(r==0){
    x=x-2;
  }else if(r==1){
    y=y-2;
  }else if(r==2){
    x=x+2;
  }else{
    y=y+2;
  }
  line(x, y, px, py);
  px = x;
  py = y;
}
