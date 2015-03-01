
void setup(){
  size(500,500);
}
int y=0;
int x=0;
void draw(){
  while(y<height){
    while(x<width){
      fill(#27FFD2);
      rect(x,y,15,15);
      x=x+15;
    }
  y=y+15;
  x=0;
  }
}

