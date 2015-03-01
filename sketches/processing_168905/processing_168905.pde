
void setup(){
size(640,480);
colorMode (HSB,100);
frameRate (20);
}
int s=10;

void draw (){
  s= int(random(10,200));
  for (int y=0; y<height; y=y+s){
    for (int x=0; x<width; x=x+s){
      fill(random(100),70,70);
      rect(x,y,s,s);
  }
  }
}



