
Ball[] balls;
boolean overlap;

class Ball {
  float px, py, vx, vy;
  Ball(float _px, float _py, float _vx, float _vy) {
    px = _px; 
    py = _py; 
    vx = _vx; 
    vy = _vy;
  }
  void simulate() {
    px+=vx;
    py+=vy;
    vx*=((px > width) || (px < 0))?-1:1;
    vy*=((py > width) || (py < 0))?-1:1;
  }
  
  void render() {
    
    fill (175);
    
    if (overlap){
      fill(random(255), random(255), random(255));
    }
    
    ellipse(px, py, 60, 60);
  }
  
  boolean overlaps() {
    return( dist( mouseX, mouseY, px, py ) <= 33 );
  }
}

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  balls = new Ball[11];
  balls[0] = new Ball(100, 100, 8, 8);
  balls[1] = new Ball(300, 200, 4, 4);
  balls[2] = new Ball(150, 400, 5, 5);
  balls[3] = new Ball(400, 40, 7, 7);
  balls[4] = new Ball(20, 250, 6, 6);
  balls[5] = new Ball(370, 70, 5, 5);
  balls[6] = new Ball(230, 150, 8, 8);
  balls[7] = new Ball(30, 250, 6, 6);
  balls[8] = new Ball(230, 20, 4, 4);
  balls[9] = new Ball(40, 50, 7, 7);
  balls[10] = new Ball(30, 120, 6, 6);

  overlap = false;
}

void draw() {
  simulate();
  render();
}

void simulate() {
  overlap = false;  
  for ( int i = 0; i < balls.length; i++) {
    if ( balls[i].overlaps() ) {
      overlap = true;
    }
  }
  if ( !overlap ) {
    for ( int i = 0; i < balls.length; i++) {
      balls[i].simulate();
    }
  }
}  

void render() {
  background(0);
  fill(255);
  ellipse(mouseX, mouseY, 30, 30);
  for ( int i = 0; i < balls.length; i++) {
    balls[i].render();
    if ( balls[i].overlaps() ) {
    }
  }
}

