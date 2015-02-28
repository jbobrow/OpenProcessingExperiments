
/* WARNING: This sketch takes over your mouse
 Press escape to close running sketch */
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.InputEvent; 
 
RoboMouse robo; 
Bot bot;
float tempX = 0;
float tempY = 0;
float springSpeed = .002;
float damping = .985;

void setup(){
  size(400, 400);
  noStroke();
  robo = new RoboMouse(frame.getLocation().x+width/2, frame.getLocation().y+height/2, 5, 0, 0);
  bot = new Bot(random(50 , width - 50), random(50, width - 50), random(5, 20), random(.5, 5), random(.5, 5));
}

void draw(){
  fill(200, 40);
  rect(0, 0, width, height);
  robo.move();
  // Uncheck to keep mouse in sketch window
  // robo.checkBoundaries();

  fill(255);
  bot.create();
  bot.move();
  bot.checkBoundaries();

  // spring stuff
  float dx = (bot.x+8-robo.x)*springSpeed;
  float dy = (bot.y+8-robo.y)*springSpeed;
  tempX += dx;
  tempY += dy;
  robo.x += tempX;
  robo.y += tempY;
  tempX *= damping;
  tempY *= damping;
}

class RoboMouse extends RoundSprite{

  Robot robot;
  float localX, localY;

  RoboMouse(float x, float y, float radius, float speedX, float speedY){
    super(x, y, radius, speedX, speedY);
    localX = frame.getLocation().x;
    localY = frame.getLocation().y;
    x+=localX;
    y+=localY;
    try { 
      robot = new Robot();
    } 
    catch (AWTException e) {
      e.printStackTrace(); 
    }
  }

  void checkBoundaries(){
    if (x>width-radius+localX){
      x = width-radius+localX;
      speedX *= -1;
    }
    if (x<radius+localX){
      x = radius+localX;
      speedX *= -1;
    }
    if (y>height-radius+localY){
      y = height-radius+localY;
      speedY *= -1;
    }
    if (y<radius+localY){
      y = radius+localY;
      speedY *= -1;
    }
  }

  void move(){
    x += speedX;
    y += speedY;
    robot.mouseMove(frame.getLocation().x+(int)x, frame.getLocation().y+(int)y);
  }
}

class Bot extends RoundSprite{

  Bot(float x, float y, float radius, float speedX, float speedY){
    super(x, y, radius, speedX, speedY);
  }

  void create(){
    ellipse(x, y, radius*2, radius*2);
  }
}

// extend me please
class RoundSprite {

  float x, y, radius;
  float speedX, speedY;
  RoundSprite(float x, float y, float radius, float speedX, float speedY){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speedX = speedX;
    this.speedY = speedY;
  }
  void move(){
    x += speedX;
    y += speedY;
  }

  void checkBoundaries(){
    if (x>width-radius){
      x = width-radius;
      speedX *= -1;

    }
    if (x<radius){
      x = radius;
      speedX *= -1;
    }
    if (y>height-radius){
      y = height-radius;
      speedY *= -1;
    }
    if (y<radius){
      y = radius;
      speedY *= -1;
    }
  }
}


