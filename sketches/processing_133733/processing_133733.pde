
float back = 50;
float left = 0;
float right = 0;
boolean lost = false;
obstacle[] obstacles = new obstacle[8];
player dude = new player();

void setup(){
  textSize(100);
  size(500,500);
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new obstacle();
     obstacles[i].posXO = obstacles[i].posX;
  }
}

void draw(){
  background(back);
  fill(255,255,0);
  rectMode(CENTER);
  noStroke();
  dude.x += (right - left) * dude.speed;
  dude.y = width - 10;
  rect(dude.x,dude.y,dude.size,dude.size);
  fill(255,0,0);
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i].posY = obstacles[i].posY + obstacles[i].ySpeed;
    obstacles[i].posX = obstacles[i].posX + obstacles[i].xSpeed;
    
    if(obstacles[i].posX > obstacles[i].posXO + 40){
      obstacles[i].xSpeed *= -1;
    }
    
    if(obstacles[i].posX < obstacles[i].posXO - 40){
      obstacles[i].xSpeed = 1;
    }
    rect(obstacles[i].posX, obstacles[i].posY, obstacles[i].w, obstacles[i].h);
    
    if(colliding(dude.x, dude.y, dude.x + dude.size, dude.y + dude.size, obstacles[i].posX, obstacles[i].posY, obstacles[i].posX + obstacles[i].w, obstacles[i].posY + obstacles[i].h)){
      lost = true;
    }
    
    if(lost){
      back = 0; 
      textAlign(CENTER);
      text("You lost", width/2, height/2);
    }
  }
}

class obstacle{
  float w = random(20,80);
  float h = w;
  float posX = random(width);
  float posXO;
  float posY = 0;
  float ySpeed = random(1,5);
  float xSpeed = random(1,20);
}

class player{
  float x = 0;
  float y = 0;
  int size = 20;
  float speed = 3.0;
}

void keyPressed(){ 
  if(key == CODED){
    if(keyCode == LEFT){
      left = 1;
    }
    if(keyCode == RIGHT){
      right = 1; 
    }
  }
}

void keyReleased(){
  if (key == CODED){
    if (keyCode == LEFT){
      left = 0;
    }
    if (keyCode == RIGHT){
      right = 0;
    }
  }
}

boolean colliding(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



