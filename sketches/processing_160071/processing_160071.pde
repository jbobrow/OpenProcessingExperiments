
size(800,600);
int x=0;
int y=0;
while (y<height){
  while (x<width){
  fill(random(255));
   rect(x,y,10,10);
    x=x+10;
  }
  y=y+10;
  x=0;
}
