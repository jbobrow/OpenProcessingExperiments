
import processing.opengl.*;

ArrayList balls;
Box box = new Box();

PVector location;
PVector speed;
int radius;
boolean light = false;

void setup() {
  size (600,600,P3D);
  smooth();
  balls = new ArrayList();
  for (int i=0; i< 10;i++) {  
    radius = int (random(15,30));
    speed = new PVector(random(-5,5),random(5), random(5));
    balls.add(new Ball(speed, radius));
  }
}

void draw() {
  background(255);
  if (light == true){
    light();
  }
  rotatectrl();

  for (int i=0; i< balls.size() -1;i++) {  
    Ball thisBall = (Ball) balls.get(i);
    thisBall.move();
    thisBall.display();
    thisBall.collide();
  }
  box.display();
}

void keyPressed(){
  if (key == 'a'){
    light = true;
  }else if (key == 's'){
    light = false;
  }
}
  



