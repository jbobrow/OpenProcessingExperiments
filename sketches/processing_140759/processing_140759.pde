
float timer = 10;
int PLAY = 0;
int Victory= 1;
int Loss = 2;
int gamestate = 0;
int bounce = 0;
boolean up = false;
float mouseDist = 0;
ball game = new ball();
 
void setup(){
  size(500,500);
  textSize(30);
  frameRate(30);
}
 
void draw(){
  background(255, 0, 0);
  mouseDist = dist(game.x, game.y, mouseX, mouseY);
  if(gamestate == PLAY){
    timer = timer - (1.0 / 30.0);
    if(timer <= 0){
      timer = 0;
    }
     
    if(bounce%2 == 0){
     game.xspeed = -5;
    }
     
    else{
      game.xspeed = 5;
    }
     
    if(game.x <= 0+game.r/2){
      game.x = game.x + abs(game.xspeed);
    }   
     
    if(game.x >= width-game.r/2){
      game.x = game.x - abs(game.xspeed);
    } 
     
    if(game.y >= height-game.r/2){
      game.y = height-game.r/2;
      game.yspeed = 0;
      game.xspeed = 0;
    }
     
    if(timer == 0 && game.y < height){
      gamestate = Victory;
    }
     
    if(game.y >= height-game.r/2 && timer > 0){
      gamestate = Loss;
    }
     
    noStroke();
    fill(random(255), random(255), random(255));
    ellipse(game.x,game.y,game.r,game.r);
    fill(0);
    text("TIME: " + (int)timer, 5, 30);
     
    if(up == false){
      game.y = game.y + game.yspeed;
      game.x = game.x + game.xspeed;
    }
     
    if(game.y <= 0+game.r/2){
      up = false;
    }
     
    if(up){
      game.y = game.y - game.yspeed;
      game.x = game.x - game.xspeed;
    }
  }
   
  if(gamestate == Loss){
    background(255,0,0);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("Thank you come again", width/2, height/2);
  }
   
  if(gamestate == Victory){
    background(0,255,0);
    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("Too easy", width/2, height/2);
  }
}
 
class ball{
  float r = 50;
  float x = random(0+r,500-r);
  float y = 50;
  float yspeed = random(10,20);
  float xspeed = 0;
}
 
void mouseReleased(){
  if(mouseDist < game.r){
    up = true;
    bounce++;
  }
}


