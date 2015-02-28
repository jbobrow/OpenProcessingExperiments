
/*  
 Perlin Snake
 - writhe with the noise
 Stinging Eyes, copysense.co.uk, 18 April 2010
 - some ideas gained from Matt Richard's Tube Drawing
 mouseclick to reset origin; T to toggle snake motion type */

int numSnakeSegments = 400;
Segment[] snake = new Segment[numSnakeSegments];
boolean snakeType = false;
int snakeTypeVal = 1000;


void setup() {

  size(500, 500);
  background(0);
  colorMode(HSB);
  frameRate(60); // adjust for effects
  noStroke();
  smooth();

  for (int i = 0; i < numSnakeSegments; i++) {
    snake[i] = new Segment(); 
  }
}

void draw() {

  background(0);

  for (int i = 0; i < numSnakeSegments; i++) {
    snake[i].move();
  }  
}

class Segment {

  float xp, yp, n, r, offset;
  float cX = width * 0.5; // centerX
  float cY = height * 0.5; // centerY
  float increment = 0.01; // noise increment
  color col;

  Segment() {

    this.offset = random(1);
    this.col = (random(1) > 0.5) ? color(0, 0, random(25, 40)) : color(85, random(170, 210), random(120, 180));
    // grey or green segment
  }

  void move(){

    this.n = noise(this.offset) * snakeTypeVal;
    this.r = noise(this.offset) * 10;
    this.offset += this.increment;

    this.xp = (cos(radians(this.n)) * this.r) + this.cX;
    this.yp = (sin(radians(this.n)) * this.r) + this.cY;

    if (mousePressed){ // reset all particle origins to mouse position
      this.xp = mouseX;
      this.yp = mouseY;
    }

    if (this.xp < 5) {
      this.xp = 5;
    }
    if (this.xp > width-5) {
      this.xp = width-5;
    }
    if (this.yp < 5) {
      this.yp = 5;
    }
    if (this.yp > height-5) {
      this.yp = height-5;
    }

    fill(this.col);
    ellipse(this.xp, this.yp, 7, 7);

    this.cX = this.xp;
    this.cY = this.yp;
  }
}

void keyPressed() {

  if (key == 't') {
    snakeType = !snakeType;
    snakeTypeVal = snakeType ? 10000 : 1000;
  }
}


