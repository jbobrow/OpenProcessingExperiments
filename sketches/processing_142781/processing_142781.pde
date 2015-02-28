

Mover mover;
Bullet bullet;
Asteroid asteroid0, asteroid1, asteroid2, asteroid3, asteroid4;

boolean turningRight = false;
boolean turningLeft = false;
boolean isAccelerating = false;
boolean createBullet = false;
float angle;
float moverX;
float moverY;
float asteroidX;
float asteroidY;
PVector moverDirection;
int asteroidSize;
Asteroid[] asteroids = new Asteroid[5];
int[] asteroidsizes = new int[5];
boolean notDead = true;
int score = 0;
int asteroidCount = 0;
int level = 1;
int frameCounter = 60;
PImage stars;

void setup() {
  size(640,480);
  mover = new Mover(5);
  stars = loadImage("stars.jpg");
  setAsteroids();
}

void setAsteroids(){
  for(int i=0;i<asteroids.length;i++){
    asteroids[i] = new Asteroid(random(0,540),random(0,240),random(-3,3),random(-3,3));
    asteroidsizes[i] = asteroidSize;
  }
}
 
void draw() {
  background(stars);
  textSize(16);
  text("Score: "+score+" Level: "+level, 250, 20); 
  frameCounter++;
  mover.updatePosition();
  mover.display();
  moverX = mover.position.x;
  moverY = mover.position.y;
  moverDirection = mover.direction;
  angle = mover.direction.heading();
  if(createBullet == true){
    bullet.display();
    bullet.updatePosition();
    //checks for bullet collision
    for(int i = 0; i<asteroids.length; i++){
      if(bullet.position.x>asteroids[i].position.x && bullet.position.x<asteroids[i].position.x+asteroidsizes[i] && bullet.position.y>asteroids[i].position.y && bullet.position.y<asteroids[i].position.y+asteroidsizes[i]){
        asteroids[i].active = false;
        asteroids[i].position.x=99999;
        asteroids[i].position.y=99999;
        asteroids[i].astSX = 0;
        asteroids[i].astSY = 0;
        asteroidCount++;
        if(notDead = true){
          score+=asteroidsizes[i];
        }
        if(asteroidCount == 5){
          asteroidCount = 0;
          level++;
          setup();
        }
      }
    }
  }
  //checks for mover collision
  for(int i = 0; i<asteroids.length; i++){
    if(asteroids[i].position.x<mover.position.x+30 && asteroids[i].position.x+asteroidsizes[i]>mover.position.x && asteroids[i].position.y<mover.position.y+30 && asteroids[i].position.y+asteroidsizes[i]>mover.position.y){
        clearScreen();
        background(255,0,0);
        textSize(40);
        textAlign(CENTER);
        text("You died!", 325, 180); 
        text("Score: "+score+" points", 325, 220);
        textSize(30);
        text("Press R to restart", 325, 320);
    }
  }
  for(int i = 0; i<asteroids.length; i++){
    asteroids[i].display();
  }
}
void clearScreen(){
    mover.speed = 0;
    notDead = false;
    mover.position.x=width;
    mover.position.y=height;
    for(int i = 0; i<asteroids.length; i++){
      asteroids[i].astSX = 0;
      asteroids[i].astSY = 0;
      asteroids[i].position.x=width;
      asteroids[i].position.y=height;
    }
    if(keyPressed){
      if(key == 'r'){
        score = 0;
        asteroidCount = 0;
        level = 1;
        notDead = true;
        setup();
      }
    }
}
void keyPressed() {
  if(keyCode == RIGHT) {
      turningRight = true;
  } 
  if(keyCode == LEFT) {
      turningLeft = true;
  } 
  if(keyCode == UP) {
      isAccelerating = true;
  } 
  if(keyCode == ' '){
    if(frameCounter > 60){
      bullet = new Bullet();
      createBullet = true;
      frameCounter = 0;
    }
  }
  if(key == 's'){
      save("Screenshot.png");
  }
}

void keyReleased() {
  if(keyCode == RIGHT) {
      turningRight = false;
  } 
  if(keyCode == LEFT) {
      turningLeft = false;
  } 
  if(keyCode == UP) {
      isAccelerating = false;
  } 
} 

class Asteroid{
  
  PImage asteroid;
  PVector position;
  float asteroidX;
  float asteroidY;
  float astSX;
  float astSY;
  boolean active = true;
  
  Asteroid(float astX, float astY, float astSpeedY, float astSpeedX){
    
    astSX = astSpeedX;
    astSY = astSpeedY;
    asteroidSize = int(random(15,100));
    asteroid = loadImage("asteroid.png");
    asteroid.resize(0, asteroidSize);
    position = new PVector(astX,astY);
  }
  
  void display(){

    image(asteroid,position.x,position.y);
    if(position.x > width+asteroidSize && active) position.x = 0-asteroidSize;
    if(position.x < 0-asteroidSize && active) position.x = width+asteroidSize;
    if(position.y > height+asteroidSize && active) position.y = 0-asteroidSize;
    if(position.y < 0-asteroidSize && active) position.y = height+asteroidSize;
    
    position.x+=astSX;
    position.y+=astSY;
}
  
}

class Bullet{
  
  PVector position;
  float speed;
  PVector direction;
  PVector velocity;
  
  Bullet(){
    position = new PVector(moverX,moverY);
    direction = new PVector(0,0);
    velocity = new PVector(0,0);
    speed = 10.0;
    PVector.fromAngle(0, direction);
    velocity = PVector.mult(moverDirection, speed);
    strokeWeight(0);
  }

  void display(){
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle); 
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
    
  void updatePosition(){
    if(turningRight){
      direction.rotate(0.05);
    }
    if(turningLeft){
      direction.rotate(-0.05);
    }
    position.add(velocity);
  }
}

class Mover{
  
    PVector position;
    PVector velocity;
    PVector direction;
    float speed;
    float maxSpeed;
    float friction = .95;
  
    Mover(int s_){
        position = new PVector(270, 360);
        velocity = new PVector(0,0);
        direction = new PVector(0,0);
        PVector.fromAngle(0, direction);
        speed = s_;
        maxSpeed = speed + 3;
    }
    
    void updatePosition(){

        if(turningRight){
            direction.rotate(0.05);
        }
        if(turningLeft){
            direction.rotate(-0.05);
        }
        if(isAccelerating == true && notDead == true){
            speed += 0.2;
        }
        if(isAccelerating == false){
            speed = speed * friction;
        }
        velocity = PVector.mult(direction, speed);
        velocity.limit(maxSpeed);
        position.add(velocity);
        
        if(position.x > width) position.x = 0;
        if(position.x < 0) position.x = width;
        if(position.y > height) position.y = 0;
        if(position.y < 0) position.y = height;
    }
    
    void display(){

        pushMatrix();
        translate(position.x, position.y);
        rotate(direction.heading());
        translate(-15, 15);
        
        fill(255);
        beginShape();
        vertex(0, 0);
        vertex(30, -15);
        vertex(0, -30);
        endShape(CLOSE);
        popMatrix();
    }
    
}


