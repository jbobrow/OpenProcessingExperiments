
Ball[] balls; 

void setup() {
  size(800,600);
  balls = new Ball[100];
  for(int i = 0; i < 100; i++) {
    balls[i] = new Ball();
  }
  smooth();
}

void draw() {
 // background(0);  
  for(int i = 0; i < 100; i++) {
    balls[i].move();
    balls[i].render();
  }
}



class Ball {
  float x,y;
  float mx,my;
  color c;
  float s;

  Ball() {
    x = random(width);
    y = random(height);
    mx = random(-3,3);
    my = random(-3,3);
    c = color(random(255),random(255),random(255));
    s = random(10,30);
  }

  void move() {
    x += mx; 
    y += my;
    if(x > width || x < 0) {
      mx*=-1;
    }
    if(y > height || y < 0)
    {
      my*=-1;
    }
  }

  void render() {
    fill(c);
    ellipse(x,y,s,s);
  }
}



