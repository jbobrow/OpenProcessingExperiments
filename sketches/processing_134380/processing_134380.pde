
float timer = 10;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int gamestate = 0;
int clicks = 0;
boolean up = false;
float mouseDist = 0;
ball red = new ball();

void setup(){
  size(500,500);
  textSize(30);
  frameRate(30);
}

void draw(){
  background(100);
  mouseDist = dist(red.x, red.y, mouseX, mouseY);
  if(gamestate == PLAY_STATE){
    timer = timer - (1.0 / 30.0);
    if(timer <= 0){
      timer = 0;
    }
    
    if(clicks%2 == 0){
      red.xspeed = -5;
    }
    
    else{
      red.xspeed = 5;
    }
    
    if(red.x <= 0+red.r/2){
      red.x = red.x + abs(red.xspeed);
    }    
    
    if(red.x >= width-red.r/2){
      red.x = red.x - abs(red.xspeed);
    }  
    
    if(red.y >= height-red.r/2){
      red.y = height-red.r/2;
      red.yspeed = 0;
      red.xspeed = 0;
    }
    
    if(timer == 0 && red.y < height){
      gamestate = WIN_STATE; 
    }
    
    if(red.y >= height-red.r/2 && timer > 0){
      gamestate = LOSE_STATE;
    }
    
    noStroke();
    fill(255,0,0);
    ellipse(red.x,red.y,red.r,red.r);
    fill(0);
    text("TIME: " + (int)timer, 5, 30);
    
    if(up == false){
      red.y = red.y + red.yspeed;
      red.x = red.x + red.xspeed;
    }
    
    if(red.y <= 0+red.r/2){
      up = false;
    }
    
    if(up){
      red.y = red.y - red.yspeed;
      red.x = red.x - red.xspeed;
    }
  }
  
  if(gamestate == LOSE_STATE){
    background(255,0,0);
    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("You lose", width/2, height/2); 
  }
  
  if(gamestate == WIN_STATE){
    background(0,255,0);
    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("You win", width/2, height/2);
  }
}

class ball{
  float r = 100;
  float x = random(0+r,500-r);
  float y = 50;
  float yspeed = random(10,20);
  float xspeed = 0;
}

void mouseReleased(){
  if(mouseDist < red.r){
    up = true;
    clicks++;
  }
}


