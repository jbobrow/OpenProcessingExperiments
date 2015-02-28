
int num = 25;

Ball[] myBalls = new Ball[num];




void setup() {

  size(200,200);
  background(200);
  
  for(int i=0;i<num;i++){
    myBalls[i] = new Ball();
  }
  
  background(220);
  smooth();
}




void draw() {

  for(int i=0; i < num; i++) {
    myBalls[i].draw();
  }
}

class Ball {

  float xpos = random(0,width);
  float ypos = random(0,height);
  float speed = random(-5,5);
  color c = color (int(random(255)));

  Ball() {
  }

  void update() {
    fill(random(255));
  }

  void draw() {
    stroke(c);
    ypos = ypos + random(-1,1);
    xpos = xpos + random(-1,1);
    point(xpos,ypos);
  }
}


