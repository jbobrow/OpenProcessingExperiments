
size (500,500);

int x = 0;
int y = 0;

while (x<width){
  while(y<height){
    rect (x,y,10,10);
    y=y+10;
  }
  y=0;
  x=x+10;
}
