
int a = 50;
int b = 50;
float r; //red variable
float g; //green variable
float bl; //blue variable
float alph; //color transparency/opacity
float diam;
float diamA;
float x = 0; // location variables
float y = 0;
float z = 900;
float w = 60;
float h = 60;
float xspeed = 3;
float yspeed = 3;
float zspeed = 3;
float speed = 0; //bouncer speed
float gravity = 0.1; //bouncer acceleration
float xx = 450; // bouncer location w
float yy = 0; //bouncer location h
float xRndm; //splatter width
float yRndm; //splatter height


void setup() {
  size(900,900);
   background(0); //background under setup for trails
  smooth();
}

void draw() {
  r = random(150);
  g = random(20);
  bl = random(100);
  alph = random(255);
  diam = random(300);
  diamA = random(30);
  xRndm = random(width);
  yRndm = random(height);
  
   x = x + xspeed; // for movement, otherwise would stay in corners
  y = y + yspeed;
  z = z + zspeed;
                                   //if and or statements
   if ((z > width) || (z < 0)) {
    zspeed = zspeed * -1;
  }
  
  if ((x > width) || (x < 0)) { 
    xspeed = xspeed * -1;
  }

  if ((y > height) || (y < 0)) { // ^denotes all axes return upon reaching edges
    yspeed = yspeed * -1;
  }

  
  frameRate(30);
  noStroke();
  ellipseMode(CENTER);
  fill(r,g,0,alph);
  
  ellipse(xx,yy,100,100); //bouncer
  ellipse(x,450,w,h); //middle width left
  ellipse(z,450,w,h); //middle width right
  ellipse(450,y-h/2,w,h); //middle height
  ellipse(y,y-h/2,diam,diam); //left corner
  ellipse(z,y-h/2,diam,diam); //right corner
  
  fill(r,g,0,alph); //splatter fill
  ellipse(xRndm,yRndm,diamA,diamA); //splatter random ellipse
  
  yy = yy + speed;
  
  speed = speed + gravity;
  
  if (yy > height) { //if goes beyond height, goes other way
    
    speed = speed * -0.95; //bouncer return
  }
  
  a = a + 1;
}



