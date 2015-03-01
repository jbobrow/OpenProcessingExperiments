
int y=0;
void setup(){
  size(500,500);
}
void draw(){
  frameRate(30);
  y=y+4;
  line(0,y,500,y);
  y=y+2;
  line(y,0,300,y);
  y=y+7;
  line(0,0,300,y*4);
  
  
}



