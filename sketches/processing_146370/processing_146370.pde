
Ball myPersonalBall;
Ball[] balls = new Ball[500];

void setup() {
  size(512, 512);
  myPersonalBall = new Ball(100, 100, 0, 4, 23, 0, 0, 0);
  println(myPersonalBall.size);
  for(int i = 0; i < balls.length; i++)
    balls[i] = new Ball(random(width), random(height), random(-5, 5), random(-5, 5), random(10, 20), random(255), random(255), random(255));
}
void draw(){
  fill(0,0,255,4);
  rect(0,0,width,height);
  myPersonalBall.update();
  myPersonalBall.display();
  for(int i = 0; i < balls.length; i++) {
    balls[i].update();
    balls[i].display();
  }
}

class Ball {
  PVector position;
  PVector velocity;
  PVector Bcolor;
  float size;
  
  Ball(float x, float y, float xv, float yv, float s, float r, float g, float b) {
    position = new PVector(x, y);
    velocity = new PVector(xv, yv);
    Bcolor = new PVector(r,g,b);
    size = s;
  }
  
  void update() {
    position.x += velocity.x;
    position.y += velocity.y;
    velocity.x /= 1.05;
    velocity.y /= 1.05;
    if(mousePressed) {
      velocity.x += (mouseX-position.x)*0.00003*dist(position.x, position.y, mouseX, mouseY);
      velocity.y += (mouseY-position.y)*0.00003*dist(position.x, position.y, mouseX, mouseY);
    }
    else {
      velocity.x += random(-.2,.2);
      velocity.y += random(-.2,.2);
    }
  }
  
  void display() {
    fill (Bcolor.x, Bcolor.y, Bcolor.z);
    ellipse(position.x, position.y, size, size);
  }
}
