
Paddle paddle;
Ball ball;
Brick[] bricks;

void setup() {
  background(127);
  size(700, 500);
  smooth();
  paddle = new Paddle();
  ball = new Ball();
  bricks = new Brick[36];
  for (int i = 0; i<bricks.length; i++) {
    bricks[i] = new Brick(((i%12)*55)+20,  (Math.floor(i/12)*25)+40);
  }
}

void update() {
  paddle.update();
  ball.update();
  for (int i = 0; i<bricks.length; i++) {
    bricks[i].update();
  }

  if (paddle.isColliding(ball) ) {
    ball.doPaddleCollision(paddle.getY());
  }

  if (mousePressed && ball.isDead()) {
    ball.setVelocity(-2, -2);
    ball.makeAlive();
  }

  if (ball.getY() > 500 + ball.getRadius()) {
    //lose life
    ball.makeDead();
  }

  if (ball.isDead()) {
    ball.setPosition(mouseX, paddle.getY()- ball.getRadius());
    ball.setVelocity(0, 0);
  }

  for (int i = 0; i<bricks.length; i++) {

    if (bricks[i].isCollidingBottom(ball)) {
      ball.setPosition(ball.getX(), (bricks[i].getY()+bricks[i].getHeight())+ball.getRadius());
      ball.setVelocity(ball.getVelX(), ball.getVelY()*-1);
      bricks[i].makeDead();
    }

    else if (bricks[i].isCollidingTop(ball)) {
      ball.setPosition(ball.getX(), bricks[i].getY()-ball.getRadius());
      ball.setVelocity(ball.getVelX(), ball.getVelY()*-1);
      bricks[i].makeDead();
      //make ball bounce away
    }
    else if (bricks[i].isCollidingSideLeft(ball)) {
      ball.setPosition(bricks[i].getX()-ball.getRadius(), ball.getY());
      ball.setVelocity(ball.getVelX()*-1, ball.getVelY());
      bricks[i].makeDead();
      //make ball bounce away
    }
    else if (bricks[i].isCollidingSideRight(ball)) {
      ball.setPosition(bricks[i].getX()+bricks[i].getWidth()+ball.getRadius(), ball.getY());
      ball.setVelocity(ball.getVelX()*-1, ball.getVelY());
      bricks[i].makeDead();
    }
  }
}

void draw() {
  update();
  background(127);
  paddle.draw();
  ball.draw();
  for (int i = 0; i<bricks.length; i++) {
    bricks[i].draw();
    //println("drawing brick " + i);
  }
}

class Ball {
  private int xpos;
  private int ypos;
  private int radius;
  private int xvel;
  private int yvel;
  private boolean deadness;


  public Ball() {

    xpos = 0;
    ypos = 0;
    xvel = 0;
    yvel = 0;
    deadness = true;
    radius = 10;
  }

  public void draw() {

    ellipse(xpos, ypos, radius*2, radius*2);
  }


  public void update() {
    xpos = xpos + xvel;
    ypos = ypos + yvel;

    if (ypos < 0+ radius ) {
      yvel = yvel * -1;
    }

    if (xpos > 700- radius || xpos < 0+ radius) {
      xvel = xvel * -1;
    }
  }

  public int getX() {
    return xpos;
  }

  public int getY() {
    return ypos;
  }

  public int getRadius() {
    return radius;
  }

  public void doPaddleCollision(int paddleY) {
    yvel = yvel *-1;
    ypos = paddleY-this.getRadius();
  }

  public boolean isDead() {
    return deadness;
  }

  public void makeDead() {
    deadness = true;
  }

  public void makeAlive() {
    deadness = false;
  }

  public void setPosition(int x, int y) {
    ypos = y;
    xpos = x;
  }

  public void setVelocity(int x, int y) {
    yvel = y;
    xvel = x;
  }
  
  public int getVelX(){
    return xvel;
  }
  public int getVelY(){
    return yvel;
  }
}

class Brick {

  private int posx;
  private int posy;
  private int width;
  private int height;
  private boolean isDead;

  public Brick(int x, int y) {
    posx = x;
    posy = y;
    width = 50;
    height = 20;
    isDead = false;
  }

  public void draw() {
    //return;
    if (isDead) {
      return;
    }
    rect(posx, posy, width, height);
  }

  public void update() {
  }

  public boolean isCollidingTop(Ball ball) {
    //bottom of ball hits top of brick
    if (isDead) {
      return false;
    }
    return (ball.getY() + ball.getRadius() >= posy && ball.getY() + ball.getRadius() <= posy + height && ball.getX() >= posx && ball.getX() <= posx + width);
  }

  public boolean isCollidingBottom(Ball ball) {
    if (isDead) {
      return false;
    }
    //top of ball hits bottom of brick
    return (ball.getY() - ball.getRadius() <= posy + height && ball.getY() - ball.getRadius() >= posy && ball.getX() >= posx && ball.getX() <= posx + width);
  }

  public boolean isCollidingSideLeft(Ball ball) {
    if (isDead) {
      return false;
    }
    //left side
    return (ball.getX()+ ball.getRadius() >= posx && ball.getX() + ball.getRadius() <= posx + width && ball.getY() + ball.getRadius()>= posy && ball.getY() - ball.getRadius() <= posy +height);
  }
  public boolean isCollidingSideRight(Ball ball) {
    if (isDead) {
      return false;
    }
    //right side
    return (ball.getX() - ball.getRadius() <= posx + width && ball.getX() - ball.getRadius() >= posx && ball.getY() + ball.getRadius() >= posy && ball.getY() - ball.getRadius() <= posy +height);
  }

  public int getY() {
    return posy;
  }

  public int getHeight() {
    return height;
  }

  public void makeDead() {
    isDead = true;
  }
  
  public int getX(){
    return posx;
  }
  
  public int getWidth(){
    return width;
  }
}

class Paddle {
  private int width;
  private int xpos;
  private int ypos;
  private int height;

  public Paddle() {
    width = 70;
    ypos = 450;
    height = 20;
  }
  public void draw() {
    rect(xpos-(width/2), ypos, width, height);
  }

  public void update() {
    xpos = mouseX;
  }

  public int getWidth() {
    return width;
  }

  public int getCenter() {
    return xpos;
  }

  public int getY() {
    return ypos;
  }

  public boolean isColliding(Ball ball) {
    //return true when the ball is within 
    //return false otherwise

    return (ball.getY()+ball.getRadius()>=ypos && ball.getX()>=xpos-width/2 && ball.getX()<xpos+width/2 && ball.getY()+ball.getRadius()<=ypos+height);
  }
}


