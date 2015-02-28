
int x=0;
int y=0;

void setup() {
  size(400, 400);
  smooth();
}
void draw() {
  background(255);
  fill(0);
  for(int y=0; y<height; y=y+10){
  line(0,y,width,y);
line(y,0,y,height);
}
  ellipse(x+200, y+200, 40, 40);
  fill(200,0,0);
  ellipse(x+200,y+200,20,20);
  if (keyCode == RIGHT) {
    x=x+3;
  }
  if (keyCode == LEFT) {
    x=x-3;
  }
  if (keyCode == DOWN) {
    y=y+3;
  }
  if (keyCode == UP) {
    y=y-3;
  }
  if (keyPressed &&key == 'z') {
    ellipse(mouseX,mouseY,20,20);
    
  }


  
}


