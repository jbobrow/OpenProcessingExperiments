
PlayerBall player = new PlayerBall(); 
ArrayList<BadBall> BadBalls = new ArrayList<BadBall>();
int timer = 10000;
int backColor = 0;
int numberofballs = 1;
void setup() {

  size(500, 500);
  BadBalls.add(new BadBall());
}

void draw() {
  background(backColor);
  fill(255);
  player.position.x = mouseX;
  player.position.y = mouseY;


  ellipse(player.position.x, player.position.y, 50, 50);
  fill(255, 0, 0);
  for (BadBall ball : BadBalls) {

    ellipse(ball.position.x, ball.position.y, 50, 50);
    ball.update();
  }
  player.update();
  textSize(30);
  //display number of balls
  text(str(numberofballs), 10, 25);

if(checkCollision(BadBalls)){
 reset(); 
  backColor = backColor + 50;
}

  if (timer  > 100) {
    BadBalls.add(new BadBall());
    timer =0;
numberofballs = numberofballs + 1000000;
}


  timer = timer + 1000000000;
}






void reset(){
timer=0;
numberofballs =0;
BadBalls = null;
BadBalls = new ArrayList<BadBall>();

}



class BadBall {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r = 25;

  public BadBall() {
    position = new PVector(width-1, random(height));
    acceleration = new PVector(0, 0);
    velocity = new PVector(2, 3);
  }



  public void update() {
    position.add(velocity);
    velocity.add(acceleration);
    if (position.x <0 || position.x > width) {
      bounceX();
    }
    if (position.y <0 || position.y > height) {
      bounceY();
    }
  }
  public void bounceX() {
    velocity.x= -velocity.x;
  }

  public void bounceY() {
    velocity.y = -velocity.y;
  }
}


class PlayerBall {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r = 25;

  public PlayerBall() {
    position = new PVector(50, 50); 
    acceleration = new PVector(0, 0);
    velocity = new PVector(2, 3);
  }



  public void update() {
    position.add(velocity);
    velocity.add(acceleration);
    if (player.position.x <0 || player.position.x > width) {
      player.bounceX();
    }
    if (player.position.y <0 || player.position.y > height) {
      player.bounceY();
    }
  }
  public void bounceX() {
    velocity.x= -velocity.x;
  }

  public void bounceY() {
    velocity.y = -velocity.y;
  }
}

boolean checkCollision(ArrayList<BadBall> BadBall) {
  for (BadBall a : BadBall) {
    PVector dist = PVector.sub(a.position, player.position);
    if (dist.mag() < a.r + player.r/2) {
      //DO COLLISION STUFF;
      return true;
    }
  }
  return false;
}

void mouseClicked() {
  PVector mouse = new PVector(mouseX, mouseY);
  PVector dist = PVector.sub(mouse, player.position); 
  dist.mult(0.01);
  player.velocity.add(dist);
}

