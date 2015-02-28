
//Problem Set 3.4
//by: Nathan Smofsky

maze m[] = new maze[100];

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < m.length; i++) {
    m[i] = new maze(width/2, height/2, 40, 40);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < m.length; i++) {
    m[i].display();
    m[i].move();
  }
}

class maze {
  float x;
  float y;
  float z;
  float width;
  float height;
  float speedY;
  float speedX;
  float scaleX;


  maze(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.width = width;
    this.height = height;
    this.speedX = random(-2, 2);
    this.speedY = random(-1, 2);
    this.scaleX = random(-3, 1);
  }

  void display() {
    rectMode(CENTER);
    fill(255, 50);
    rect(x, y, width, height);
    fill(185, 100);
    rect(x, y, width, height*0.75);
    fill(105, 150);
    rect(x, y, width*0.75, height*0.5);
    fill(0, 200);
    rect(x, y, width*0.25, height*0.25);
  }

  void move() {
    this.x = this.x + this.speedX;
    this.y = this.y + this.speedY;
    this.width = this.width + scaleX;
    this.height = this.height + scaleX;
    if ( this.x > (500 - this.width) || this.x < 0) {
      this.speedX = this.speedX * -1;
    }
    if ( this.y > 500- (this.height) || this.y < 0 ) {
      this.speedY = this.speedY * -1;
    }
    if ( this.width > 150 || this.width < 0 ) {
      this.scaleX = this.scaleX * -1;
    }
  }
}


