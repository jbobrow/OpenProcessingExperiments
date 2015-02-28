
Ball myPersonalBall;
Ball[] balls = new Ball[500];
 
void setup() {
  size(800, 800, P2D);
  myPersonalBall = new Ball(100, 100, 0, 4, 23, 0, 0, 0, 0);
  println(myPersonalBall.size);
  for(int i = 0; i < balls.length; i++)
    balls[i] = new Ball(random(width), random(height), random(-5, 5), random(-5, 5), random(3, 10), random(255), random(255), random(255), random(3));
}
void draw(){
  fill(0,0,(200+random(-50,50)),1);
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
  float attract;
   
  Ball(float x, float y, float xv, float yv, float s, float r, float g, float b, float a) {
    position = new PVector(x, y);
    velocity = new PVector(xv, yv);
    Bcolor = new PVector(r,g,b);
    size = s;
    attract = a;
  }
   
  void update() {
    position.x += velocity.x;
    position.y += velocity.y;
    velocity.x /= 1.05;
    velocity.y /= 1.05;
    if(mousePressed) {
      velocity.x += (mouseX-position.x)*0.00001*attract*dist(position.x, position.y, mouseX, mouseY);
      velocity.y += (mouseY-position.y)*0.00003*attract*dist(position.x, position.y, mouseX, mouseY);
    }
    else {
      velocity.x += random(-.2,.2);
      velocity.y += random(-.2,.2);
      Bcolor.x=Bcolor.x+random(-3,3);
      Bcolor.y=Bcolor.y+random(-3,3);
      Bcolor.z=Bcolor.z+random(-3,3);
      size=size+random(-1,1);
      if(size>20 || size<2) {
        size=8;
      }
    }
  }
   
  void display() {
    noStroke();
    fill (Bcolor.x, Bcolor.y, Bcolor.z);
    ellipse(position.x, position.y, size, size);
  }
}
