
Ball ball1;
Ball ball2;
PImage[] me = new PImage[9];
float distance;

void setup() {
  me[0] = loadImage("Me.jpg");
  me[1] = loadImage("Me2.jpg");
  me[2] = loadImage("Me3.jpg");
  me[3] = loadImage("Me4.jpg");
  me[4] = loadImage("Me5.jpg");
  me[5] = loadImage("Me6.jpg");
  me[6] = loadImage("Me7.jpg");
  me[7] = loadImage("Me8.jpg");
  me[8] = loadImage("Me9.jpg");
  rectMode(CENTER);
  size(600,600);
  imageMode(CENTER);
  smooth();
  ball1 = new Ball(random(32,64));
  ball2 = new Ball(random(32,64));
}

void draw() {
  distance = sqrt(pow(ball1.x - ball2.x, 2) + pow(ball1.y - ball2.y, 2));
  if(distance <= ball1.r + ball2.r){
    ball1.bounce();
    ball2.bounce();
  }
  background(0);
  ball1.move();
  ball2.move();
  ball1.display();
  ball2.display();
}


class Ball {
  int trans;
  int col1;
  int col2;
  int col3;
  float r;
  float x,y;
  float xspeed,yspeed;
  
  Ball(float tempR) {
    trans = int(random(0,255));
    col1 = int(random(0,255));
    col2 = int(random(0,255));
    col3 = int(random(0,255));
    r = tempR;
    x = random(r + 5,width - (r + 5));
    y = random(r + 5,height - (r + 5));
    xspeed = random(-5,5);
    yspeed = random(-5,5);
  }
  
  void move() {
    x += xspeed;
    y += yspeed;
      
    
    if (x > width -r || x < r) {
      xspeed *= -1;
    }
    
    if (y > width -r || y < r) {
      yspeed *= -1;
    }
  }
  
  void display() {
    stroke(col1,col2,col3);
    fill(col1,col2,col3,trans);
    ellipse(x,y,r*2,r*2);
  }
  
  void bounce(){
    xspeed = xspeed * -1;
    yspeed = yspeed * -1;
  }
}

