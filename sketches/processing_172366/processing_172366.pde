
int possumX =1;
int possumY =1;
int p = 480;

void setup(){
  size(500,500);
  background(255,0,255);
}
void draw(){
  fill(possumX,possumY,255);
  ellipse(possumX,possumY,50,50);
  ellipse(p,possumY,50,50);
  possumX = possumX + 2;
  possumY = possumY + 2;
  p = p - 2;
}
