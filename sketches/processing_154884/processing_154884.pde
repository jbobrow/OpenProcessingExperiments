
Walker w;
int spacing = 8;
int speed = 8;
int pointX, pointY;

   
void setup() {
  size(400, 400);
  w = new Walker();
  background(0);
  pointX = random(width);
  pointY = random(height);
  rectMode(CENTER);
}
   
void draw() {
  noStroke();
  fill(0,10);
  rect(width/2,height/2,width,height);  
  w.step();
  w.display();
  if(
      w.x < pointX + 10 && w.x > pointX - 10 &&
      w.y < pointY + 10 && w.y > pointY - 10
  ){
      w.size = w.size + 1;
      pointX = random(width);
      pointY = random(height);
  }
  noStroke();
  fill(255);
  rect(pointX, pointY,spacing,spacing);
}
   
class Walker {
  int x, y;
  int size;

  Walker() {
    x = width/2;
    y = height/2;
    size = 1;
  }
     
  void display() {
    fill(0,random(255),random(255));
    noStroke();
    rect(x,y,spacing+size,spacing+size);
    if(size>10) size = 0;
  }
   
  void step() {
         
    float r = random(1);
    float left, right, up, down;
    right = left = up = down = 0.1;
     
    if(x < mouseX){
        right = 0.4;
    } else {
        left = 0.4;
    }
    if(y < mouseY){
        down = 0.4;
    } else {
        up = 0.4;
    }
                 
    if (r < right) {
      x+=speed;
    } else if (r < right+left) {
      x-=speed;
    } else if (r < right+left+down) {
      y+=speed;
    } else {
      y-=speed;
    }
  }
}
