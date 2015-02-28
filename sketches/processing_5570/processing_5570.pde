
/*
    mosquito collider
       ~emoc, 30 oct. 2009
       (collision detection + response)
*/


ArrayList balls = new ArrayList();
int nBalls = 197;

void setup() {
  size(600, 450);
  ellipseMode(CENTER);
  for (int i=0; i < nBalls; i++) {
    balls.add(  new Ball(random(0,width), random(0,height), 6, i)  );
    Ball b = (Ball) balls.get(i);
    b.setMove(random(-5,5), random(-5, 5));
  }
  colorMode(HSB);
}

void draw() {
  background(170,200,30);
  noStroke();
  for (int i = 0; i < balls.size(); i++) {
    Ball b = (Ball) balls.get(i);
    b.draw();
  }
}

class Ball{
  
  PVector pos, mov;
  int size, id;
  float r, n, bright;
  
  Ball(float _x, float _y, int _size, int _id){
    pos = new PVector(_x, _y);
    mov = new PVector(0, 0);
    size = _size;
    id = _id;
    this.r = 40;
    this.n = 80;
  }
  
  void draw() {
    checkCollision();
    update();
    for(int i=0; i<n; i++){
      float a = random(-PI,PI);
      float d = random(0,r); 
      stroke(33,255-(d*10),255 - (255/(r/(d+.1))),255 - (255/(r/(d+.1))));
      float xp = pos.x + (d * cos(a));
      float yp = pos.y + (d * sin(a));
      point(xp,yp);
    }
  }
  
  void checkCollision() {
    for (int i = 0; i < balls.size(); i++) {
      Ball b = (Ball) balls.get(i);
      if (b.id != this.id) {
        float dist = PVector.dist(this.pos, b.pos);
        if ( dist < ((this.size + b.size) / 2)) { // basic collision detection
          PVector cn = PVector.sub(this.pos, b.pos); // Collision Normal Vector
          float n = sqrt((cn.x * cn.x) + (cn.y * cn.y));
          cn.div(n);
          this.mov.add(cn);
          b.mov.sub(cn);
        }
      }
    }
  }
  
  void update() {
    pos.add(mov);
    
    /*  uncomment for screen borders bounces
    if (pos.y < size) mov.y = -mov.y;        // top bounce
    if (pos.y > height-size) mov.y = -mov.y; // bottom bounce
    if (pos.x < size) mov.x = -mov.x;        // top bounce
    if (pos.x > width-size) mov.x = -mov.x; // bottom bounce   
    */
    
    // border loop version
    if (pos.y < 0) pos.y = height;        // top bounce
    if (pos.y > height) pos.y = 0; // bottom bounce
    if (pos.x < 0) pos.x = width;        // top bounce
    if (pos.x > width) pos.x = 0; // bottom bounce       
    
    mov.mult(0.9999); // a friction coefficient
  }
  
  void setMove(float _movX, float _movY) {
    mov.set(_movX, _movY, 0);
  }
}

