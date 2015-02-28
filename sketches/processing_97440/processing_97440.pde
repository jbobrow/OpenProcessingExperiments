
/* @pjs preload="bg.png"; */
/* @pjs preload="marioface.jpg"; */
/* @pjs preload="laser.png"; */
/* @pjs preload="mushroom.png"; */
/* @pjs preload="spacey.jpg"; */
/* @pjs preload="gameover.png"; */


PImage bg;
PImage mario;
PImage laser;
PImage spacey;
PImage gameover;
float y;

PVector[] vels = { 
  new PVector(5, 3), 
  new PVector(2, 3)
  };
  
Ball[] balls =  { 
  new Ball(100, 355, 15), 
  new Ball(700, 355, 15) 
};



  void setup() {
    size(380, 470);
    bg = loadImage("bg.png");
    mario = loadImage("marioface.jpg");
    laser = loadImage("laser.png");
    spacey = loadImage("spacey.jpg");
    gameover = loadImage("gameover.png");
    laserY = 330;
    
  }

void draw() {
  image(bg);
  if (mouseX < 350) {
    image(mario, mouseX, 355);
  }
  else {
    image(mario, 350, 355);
  }
  
  image(spacey,0,y);
  y = y+0.1;
  if (y > height-100) {
    image(gameover,0.0);
    noLoop();
  }
  
    for (int i = 0; i < 2; i++){
    balls[i].x += vels[i].x;
    balls[i].y += vels[i].y;
    ellipse(balls[i].x, balls[i].y, balls[i].r*2, balls[i].r*2);
    checkBoundaryCollision(balls[i], vels[i]);
    
    }
    checkObjectCollision(balls,vels);        
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
  else if (ball.y > 400) {
    ball.y = 400;
    vel.y *= -1;
  } 
  else if (ball.y < ball.r) {
    ball.y = ball.r;
    vel.y *= -1;
  }
  
/*  else if (ball.x = mouseX && ball.y <= 350) {
    println("true");
  }*/
  
  else if (ball.x > mouseX && ball.x < mouseX+10 && ball.y > 350) {
    ball.x = mouseX+15;
    ball.y = 350;
    vel.x *= -1;
    vel.y *= -1;
  }
}

void checkObjectCollision(Ball[] b, PVector[] v){

  // get distances between the balls components
  PVector bVect = new PVector();
  bVect.x = b[1].x - b[0].x;
  bVect.y = b[1].y - b[0].y;

  // calculate magnitude of the vector separating the balls
  float bVectMag = sqrt(bVect.x * bVect.x + bVect.y * bVect.y);
  if (bVectMag < b[0].r + b[1].r){
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



class Ball{
  float x, y, r, m;

  // default constructor
  Ball() {
  }

  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    m = r*.1;
  }
}


