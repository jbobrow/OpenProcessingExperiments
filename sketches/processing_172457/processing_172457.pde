
// PImage front;

int MAX_BALLS = 200;

int frontW, frontH;
float x,y,z,r;
float sx,sy,sz;

float dx = 30,
      dy = 30;

float noiseScale = 1100;
float speedScale = 3000;

float ballRadius = 60;
float speedZ = 20;
float speedR = 4;


ArrayList<Ball> balls;

void setup() {
  size(1066, 600, P3D);

  noStroke();
  // noFill();
  // stroke(255);
  fill(255, 218, 190);
  
  // front = loadImage("front.png");
  reset();
}

void reset() {

  x = width/2;
  y = height/2;
  z = 0;

  r = 0;

  balls = new ArrayList<Ball>();

}

void draw() {
  background(0);

  if (keyPressed) {
    reset();
  }

  //z += speedZ;
  r += speedR;

  sx = x/speedScale;
  sy = y/speedScale;
  sz = z/speedScale;

  x = width/2 + (noise(sx,sy,sz)-.5) * noiseScale;
  y = height/2 + (noise(sy,sx,sz)-.5) * noiseScale/1.5;
  
  z += (noise(sz,sx,sy))*speedZ;
  
  // x = width/2 + (noise(x/1000,y/1000,z/1000)-.5) * noiseScale;
  // y = height/2 + (noise(y/1000,x/1000,z/1000)-.5) * noiseScale/2;

  float cameraX = mouseX;
  float cameraY = mouseY;
  float cameraZ = z+300;

  camera(cameraX, cameraY, cameraZ, width/2, height/2, z, 0, 1, 0);
  
  // lights();
  // lightFalloff(1.0, 100, 100);
  lightFalloff(0.8, 0.00001, 0.000005);
  directionalLight(50,50,50,0,-1,0);
  ambientLight(100, 100, 100, x, y, z);
  // ambientLight(255, 218, 190, cameraX, cameraY, cameraZ);

  for (Ball ball: balls) {
    pushMatrix();
    translate(ball.x,ball.y,ball.z);
    rectMode(CENTER);
    rotateZ(radians(ball.r));
    sphere(ballRadius);
    popMatrix();
  }

  balls.add(new Ball(x,y,z,r));

  if (balls.size() == MAX_BALLS) {
    balls.remove(0);
  }

}

class Ball {
  float x, y, z, r;
  Ball(float x, float y, float z, float r) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.r = r;
  }
}
