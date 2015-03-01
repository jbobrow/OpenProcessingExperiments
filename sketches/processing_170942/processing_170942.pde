
Laser laser = new Laser();

void setup(){
  size(400,400);
  background(0);
  noStroke();
  noSmooth();
  frameRate(30);
}

void draw(){
  background(0);
  fill(255);
  noStroke();
  rect(380,0,2,height);
  rect(40,0,2,height);
  laser.update();
  float x1, x2, y1, y2;
  int bounce = 1;
  x1 = laser.x+40;
  y1 = laser.y + 10;
  x2 = laser.x+40;
  y2 = laser.y + 10;
  while (y1 > 0 && y1 < height && bounce < 15) {
    while (x1 < 380){
      x1 = x1 + 1;
      y1 = y1 - tan(laser.theta);
    }
    stroke(255,0,0, 255 - bounce*15);
    line(x2, y2, x1, y1);
    x2 = x1;
    y2 = y1;    
    while (x2 > 42){
      x2 = x2 - 1;
      y2 = y2 - tan(laser.theta);
    }
    stroke(255,0,0, 255 - (bounce + 1) * 15);
    line(x2, y2, x1, y1);
    x1 = x2;
    y1 = y2;
    bounce += 1;
  }
  stroke(255,0,0);
  //line(laser.x+40, laser.y + 10, x1, y1);
  laser.display();
}
class Laser {
  int x = 0;
  int y = 200;
  float theta = 0;
  
  Laser(){
  }
  
  void update() {
    if (keyPressed && key == CODED){
      switch(keyCode) {
        case UP:
          y -= 3;
          break;
        case DOWN:
          y += 3;
          break;
        case LEFT:
          theta += 0.004;
          break;
        case RIGHT:
          theta -= 0.004;
          break;
      }
    }
  }
  
  void display() {
    fill(255);
    noStroke();
    rect(x,y,40,20);
  }
  
}


