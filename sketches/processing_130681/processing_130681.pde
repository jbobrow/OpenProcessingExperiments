
void setup(){
  size(500,500);
  frameRate(2);
  x=0;
  y=0;
}


void draw(){
    background(204);
    x+=50;
    y+=50;
    ellipse(x,y,20,20);
}
