
/**
 * 3D Billiards with camera rotation
 * by Darby Rathbone
 *
 * based off of: Circle Collision 
 * with Swapping Velocities by Ira Greenberg. 
 * 
 * Based on Keith Peter's Solution in
 * Foundation Actionscript Animation: Making Things Move!
 */


int rackx = 650; 
int racky = 200;

void setup() {
  size(800, 400, P3D);
  noStroke();
  frameRate(60);
}


Ball[] balls = { 
  new Ball(rackx, racky, 9, 1), 

  new Ball(rackx+sqrt(400), racky-10, 9, 2), 
  new Ball(rackx+sqrt(400), racky+10, 9, 3), 

  new Ball(rackx+(2*sqrt(400)), racky-20, 9, 4), 
  new Ball(rackx+(2*sqrt(400)), racky+0, 9, 5), 
  new Ball(rackx+(2*sqrt(400)), racky+20, 9, 6), 

  new Ball(rackx+(3*sqrt(400)), racky-30, 9, 7), 
  new Ball(rackx+(3*sqrt(400)), racky+10, 9, 8), 
  new Ball(rackx+(3*sqrt(400)), racky+30, 9, 9), 
  new Ball(rackx+(3*sqrt(400)), racky-10, 9, 10), 

  new Ball(rackx+(4*sqrt(400)), racky+0, 9, 11), 
  new Ball(rackx+(4*sqrt(400)), racky+20, 9, 12), 
  new Ball(rackx+(4*sqrt(400)), racky+40, 9, 13), 
  new Ball(rackx+(4*sqrt(400)), racky-20, 9, 14), 
  new Ball(rackx+(4*sqrt(400)), racky-40, 9, 15), 
  new Ball(20, 20, 9),
};

PVector[] vels = { 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), 
  new PVector(0, 0), new PVector(random(-5, 5), random(-5, 5))
  };
  int mousepressedintx =0;
int mousepressedinty=0;
int camerax =0;
int cameray =0;
void draw() {
    float tempx=0;
    float tempy=0;
  if (mousePressed && mousepressedintx ==0)
  {
    mousepressedintx = mouseX;
    mousepressedinty = mouseY;
  }
  if (mousePressed && mousepressedintx != 0)
  {
    tempx = mouseX-mousepressedintx;
    tempy = mouseY-mousepressedinty;
  }
  if (!mousePressed && mousepressedintx != 0)
  {
      camerax +=  mouseX-mousepressedintx;
      cameray +=mouseY-mousepressedinty;
      mousepressedintx = 0;
      mousepressedinty = 0;  
    }
  pushMatrix();
  background(0);

  beginCamera();
  camera();
  //translate((width-modelX(balls[15].x,balls[15].y,0))/2,(height-modelY(balls[15].x,balls[15].y,0))/2);

  //println(PI*mouseX*pow(width,-1));
  translate(0, 0, -400);
  rotateZ(-((2*PI))*(camerax+tempx)*pow(width, -1));
  rotateX(-(PI*(cameray+tempy)*pow(height, -1))/2);

  translate(0, 0, 500);



  //translate(width,height);

  endCamera();
  translate(0, 0, -100);

  fill(#114018);
  rect(0, 0, width, height);

  pointLight(255, 255, 255, width/2, height/2, 400);
  //ambientLight(102, 102, 102);
  lightSpecular(255, 255, 255); 
  //directionalLight(102, 102, 102, 0, 0, 100);
  specular(255, 255, 255); 
  fill(204);
  Ball[] baller = new Ball[2];
  PVector[] velas= new PVector[2];
  for (int i = 0; i < balls.length; i++) {
    balls[i].x += vels[i].x;
    balls[i].y += vels[i].y;
    //vels[i].y+=.1;
    //vels[i].mult(.995);
    pushMatrix();

    translate(balls[i].x, balls[i].y, 10);
    fill(balls[i].c);
    shininess(35.0); 
    specular(255, 255, 255);
    sphere(balls[i].r+1);
    popMatrix();
    for (int j = 0; j<balls.length;j++) {
      if (balls[i]!=balls[j]) {
        velas[0] =  vels[i];
        velas[1] = vels[j];
        baller[0] = balls[i];
        baller[1] = balls[j];
        checkBoundaryCollision(balls[j], vels[j]);
        checkObjectCollision(baller, velas);
      }
    }
  }

  popMatrix();
}

void checkObjectCollision(Ball[] b, PVector[] v) {

  // get distances between the balls components
  PVector bVect = new PVector();
  bVect.x = b[1].x - b[0].x;
  bVect.y = b[1].y - b[0].y;

  // calculate magnitude of the vector separating the balls
  float bVectMag = sqrt(bVect.x * bVect.x + bVect.y * bVect.y);
  if (bVectMag < b[0].r + b[1].r) {
    // get angle of bVect
    float theta  = atan2(bVect.y, bVect.x);
    // precalculate trig values
    float sine = sin(theta);
    float cosine = cos(theta);

    /* bTemp will hold rotated ball positions. You 
     just need to worry about bTemp[1] position*/
    Ball[] bTemp = {  
      new Ball(), new Ball()
      };

      /* b[1]'s position is relative to b[0]'s
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].x and bTemp[0].y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      bTemp[1].x  = cosine * bVect.x + sine * bVect.y;
    bTemp[1].y  = cosine * bVect.y - sine * bVect.x;

    // rotate Temporary velocities
    PVector[] vTemp = { 
      new PVector(), new PVector()
      };
      vTemp[0].x  = cosine * v[0].x + sine * v[0].y;
    vTemp[0].y  = cosine * v[0].y - sine * v[0].x;
    vTemp[1].x  = cosine * v[1].x + sine * v[1].y;
    vTemp[1].y  = cosine * v[1].y - sine * v[1].x;

    /* Now that velocities are rotated, you can use 1D
     conservation of momentum equations to calculate 
     the final velocity along the x-axis. */
    PVector[] vFinal = {  
      new PVector(), new PVector()
      };
      // final rotated velocity for b[0]
      vFinal[0].x = ((b[0].m - b[1].m) * vTemp[0].x + 2 * b[1].m * 
        vTemp[1].x) / (b[0].m + b[1].m);
    vFinal[0].y = vTemp[0].y;
    // final rotated velocity for b[0]
    vFinal[1].x = ((b[1].m - b[0].m) * vTemp[1].x + 2 * b[0].m * 
      vTemp[0].x) / (b[0].m + b[1].m);
    vFinal[1].y = vTemp[1].y;

    // hack to avoid clumping
    bTemp[0].x += vFinal[0].x;
    bTemp[1].x += vFinal[1].x;

    /* Rotate ball positions and velocities back
     Reverse signs in trig expressions to rotate 
     in the opposite direction */
    // rotate balls
    Ball[] bFinal = { 
      new Ball(), new Ball()
      };
      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
    bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
    bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
    bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

    // update balls to screen position
    b[1].x = b[0].x + bFinal[1].x;
    b[1].y = b[0].y + bFinal[1].y;
    b[0].x = b[0].x + bFinal[0].x;
    b[0].y = b[0].y + bFinal[0].y;

    // update velocities
    v[0].x = cosine * vFinal[0].x - sine * vFinal[0].y;
    v[0].y = cosine * vFinal[0].y + sine * vFinal[0].x;
    v[1].x = cosine * vFinal[1].x - sine * vFinal[1].y;
    v[1].y = cosine * vFinal[1].y + sine * vFinal[1].x;
  }
}

void checkBoundaryCollision(Ball ball, PVector vel) {
  if (ball.x > width-ball.r) {
    ball.x = width-ball.r;
    vel.x *= -1;
  } 
  else if (ball.x < ball.r) {
    ball.x = ball.r;
    vel.x *= -1;
  } 
  else if (ball.y > height-ball.r) {
    ball.y = height-ball.r;
    vel.y *= -1;
  } 
  else if (ball.y < ball.r) {
    ball.y = ball.r;
    vel.y *= -1;
  }
}

class Ball {
  float x, y, r, m;
  color c;
  // default constructor
  Ball() {
  }

  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    m = r*.1;
    this.c = color(255);
  }
  Ball(float x, float y, float r, int c) {
    this.x = x;
    this.y = y;
    this.r = r;
    m = r*.1;
    switch(c)
    {

    case 1: 
      this.c = #F2F218;
      break;
    case 2: 
      this.c = #141BC9;
      break;
    case 3: 
      this.c = #E52525;
      break;
    case 4: 
      this.c = #A02C85;
      break;
    case 5: 
      this.c = #FFAD08;
      break;
    case 6: 
      this.c = #1BA714;
      break;
    case 7: 
      this.c = #811A1A;
      break;

    case 8: 
      this.c = #000000;
      break;

    case 9: 
      this.c = #F2F218;
      break;
    case 10: 
      this.c = #141BC9;
      break;
    case 11: 
      this.c = #E52525;
      break;
    case 12: 
      this.c = #A02C85;
      break;
    case 13: 
      this.c = #FFAD08;
      break;
    case 14: 
      this.c = #1BA714;
      break;
    case 15: 
      this.c = #811A1A;
      break;
    }
  }
}

