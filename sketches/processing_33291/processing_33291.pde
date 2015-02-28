
void setup() {
  size(256,256);
  noLoop();
}

void draw () {
  for (int x=0;x<257;x=x+1){
      for (int y=0;y<257;y=y+1) { 
        stroke(255,x,y);
        point(y,x);
      }
  }
}  

                
