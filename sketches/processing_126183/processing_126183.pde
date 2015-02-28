
void setup(){
size(420,300);
}
void draw(){
  background(255);
  noFill();
  float xx=0, yy=0;
  for(int x=0; x<width; x+=30)
  for(int y= 0; y<height; y+=30)
  ellipse(x,y,mouseX,mouseY);
}


