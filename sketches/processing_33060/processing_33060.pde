
int cordX = 5;
int cordY = 100;
int rad = 20;
int velX = 5;
int velY = 5;
float r,g,b;

void setup() {
  size(500, 400);
  frameRate(70);
}

void draw() {  
  background(159, 81, 250);
  fill (r, g, b);
  noStroke();
  ellipse(cordX, cordY, rad, rad);
  
  int circleX = 200;
  int vel = 10;
  int circleY = 30;
  int rad = 60;


  //move 5px every frame
  cordX = cordX + velX;
  cordY = cordY + velY;

  if (cordX >= width || cordX <= 0) {
    velX = -velX;
    r = random(1,255);
    g = random(1,255);
    b = random(1,255);
  }

  if ( cordY >= height || cordY <= 0) {
    velY = -velY;
    r = random(1,255);
    g = random(1,255);
    b = random(1,255);
  }
}

