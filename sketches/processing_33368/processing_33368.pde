
int y = 10;
int x = 10;

void setup(){
  size ( 256, 256);
  noLoop();
}

void draw(){
  for (int x = 0; x < width; x+=1){
    for (int y = height; y > 0; y -=1){
      stroke ( x*2 , x, y);
      point( x, y);
    }
  }
}

