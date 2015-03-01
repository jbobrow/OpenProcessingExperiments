
size(1000,1000);
int y = 0;
int x = 0;
while (x < width) {
  while(y < height){
    rect(x,y,10,10);
    y=y+10;
  }
  x=x+10;
  y=0;
}
