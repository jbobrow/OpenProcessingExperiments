
float x;
float y;
int offset = 10;

void setup(){
  size(300,300);
  smooth();
  x = height/4;
}

void draw() {
  background(0);
  if (mouseX > x) {
    x += 0.5;
    offset = -10;
  }
  if (mouseX < x) {
    x -= 0.5;
    offset = 10;
  }
  if (mouseY > y){
    y += 0.5;
    offset = 20;
  }
  if (mouseY < x){
    y-= 0.5;
    offset = 10;
  }  
  fill(244,0,0);
  ellipse(x,50,y,width);
  fill(0,244,0);
  triangle(50,x,60,y,width,100);
  fill(0,0,233);
  rect(x,0,y,width/2);
  line(mouseX,mouseY,mouseX+offset,mouseY-10);
  line(mouseX,mouseY,mouseX+offset,mouseY+10);
  line(mouseX,mouseY,mouseX+offset*3,mouseY);
}
