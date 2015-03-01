
int x = 0;
int y = 500;
int R = 255;
int B = 0;

void setup(){
size (500, 500);

}

void draw(){
  
  while(x < width){
  stroke(R, 0, B);
  line(x, y, 500, y);
  R-=5;
  B+=10;
  x+=10;
  y-=10;
  
  }
} 
  


