
int y = 0;
int x = 0;

void setup() {
  size(800,800);
}


void draw() {
  background(255);



if (mousePressed == true) {

}

if(mouseY < width/2) {
  ellipse( mouseX, mouseY + y, 30, 30);
  fill(0,0);
  y -= 3;
  x = 0;
}else{
  rect( mouseX , mouseY - x, 200, 200);
  fill(0,200);
  x -= 3;
  y = 0;
  
  
}
  
}
