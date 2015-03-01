
void setup(){
  size(400, 400);
  textSize(50);
}

int playerX = 300;                            //general variables
int playerY = 300;
boolean hitBox = false;
boolean spawn = false;
int playerHP = 100;
boolean playerDamage = false;
boolean loading = true;

boolean zombieDamage1 = false;                // 1st zombie vaiables
int zombie1HP = 20;
float zombieX1 = random(width/2, width/2);
float zombieY1 = random(height/2, height/2);

boolean zombieDamage2 = false;                //2nd zombie variables
int zombie2HP = 100;
float zombieX2 = random(width/2, width/2);
float zombieY2 = random(height/2, height/2);

void draw(){
  if(loading){
    for(int wait = 10000; wait > 0; wait = wait - 1 ){
      println(wait); //This is a fake loading screen because we needed to put a while() or for() loop in here somehow.
    }
    loading = false;
  }
    background(155);
    zombie1();
    zombie2();
    stroke(0);
    fill(255);
    ellipse(playerX, playerY, 10, 10);
    if(keyPressed){  //movement
      if(key == 's')
        playerY++;
      if(key == 'w')
        playerY--;
      if(key == 'a')
        playerX--;
      if(key == 'd')
        playerX++;
    }
    spikes();
    hitBox();
    lifeBar();
}

void hitBox(){  //player's hitbox
  if(hitBox){
  stroke(0, 255, 0, 200);
  fill(0, 255, 0, 100);
  }else{
  stroke(0, 0, 0, 0);
  fill(0, 0, 0, 0);
  }
  rectMode(CENTER);
  rect(playerX, playerY, 10, 10);
  if(keyPressed){
  if(key == 'p')  //it will appear when p is pressed
    hitBox = !hitBox;
  }
}

void lifeBar(){  //player's health
  if((zombieX1-5 < playerX && zombieX1+5 > playerX && zombieY1-5 < playerY && zombieY1+5 > playerY) || (zombieX2-5 < playerX && zombieX2+5 > playerX && zombieY2-5 < playerY && zombieY2+5 > playerY)){
    playerDamage = true;
  }else{
    playerDamage = false;
  }
  if(playerDamage){
    playerHP = playerHP - 1;
  }
  if(playerHP > 70){        //different
  stroke(0, 255, 0);
  fill(0, 255, 0);
  }else if(playerHP > 40){  //colored
  stroke(255, 255, 0);
  fill(255, 255, 0);
  }else{                    //health!
  stroke(255, 0, 0);
  fill(255, 0, 0);
  }
  rectMode(CORNER);
  rect(playerX-5,  playerY-10, playerHP/10, 3);
  if(playerHP <= 0){
    background(0);
    fill(255, 0, 0);
    stroke(255, 0, 0);
    text("You is ded", width/6, height/2);  //if the player runs out of health, he/she will lose
    stop();
  }
}

void spikes(){
  point(width/2-3, height/2-3);
  point(width/2-1, height/2-3);
  point(width/2+1, height/2-3);
  point(width/2+3, height/2-3);
  point(width/2-2, height/2-2);
  point(width/2, height/2-2);
  point(width/2+2, height/2-2);
  point(width/2-3, height/2-1);
  point(width/2-1, height/2-1);
  point(width/2+1, height/2-1);
  point(width/2+3, height/2-1);   //drawing
  point(width/2-2, height/2);     //spikes
  point(width/2, height/2);       //...
  point(width/2+2, height/2);
  point(width/2-3, height/2+1);
  point(width/2-1, height/2+1);
  point(width/2+1, height/2+1);
  point(width/2+3, height/2+1);
  point(width/2-2, height/2+2);
  point(width/2, height/2+2);
  point(width/2+2, height/2+2);
  point(width/2-3, height/2+3);
  point(width/2-1, height/2+3);
  point(width/2+1, height/2+3);
  point(width/2+3, height/2+3);
  if(zombieX1-5 < width/2 && zombieX1+5 > width/2 && zombieY1-5 < height/2 && zombieY1+5 > height/2){   //zombies will get hurt
    zombieDamage1 = true;
  }else{
    zombieDamage1 = false;
  }
  if(zombieX2-5 < width/2 && zombieX2+5 > width/2 && zombieY2-5 < height/2 && zombieY2+5 > height/2){   //if they're on the spikes
    zombieDamage2 = true;
  }else{
    zombieDamage2 = false;
  }
}

void zombie1(){  //zombie 1 will move
  fill(0);
  stroke(0);
  if(zombie1HP > 0){
  ellipse(zombieX1, zombieY1, 10, 10);
    if(zombieX1<playerX)
      zombieX1=zombieX1+0.7;
    if(zombieX1>playerX)
      zombieX1=zombieX1-0.7;
    if(zombieY1<playerY)
      zombieY1=zombieY1+0.7;
    if(zombieY1>playerY)
      zombieY1=zombieY1-0.7;}
    if(zombieDamage1){
      zombie1HP = zombie1HP - 1;
    }
}

void zombie2(){  //zombie 2 will move
  fill(0);
  stroke(0);
  if(zombie2HP > 0){
    ellipse(zombieX2, zombieY2, 10, 10);
    if(zombieX2<playerX)
      zombieX2=zombieX2+0.3;
    if(zombieX2>playerX)
      zombieX2=zombieX2-0.3;
    if(zombieY2<playerY)
      zombieY2=zombieY2+0.3;
    if(zombieY2>playerY)
      zombieY2=zombieY2-0.3;
    if(zombieDamage2){
      zombie2HP = zombie2HP - 1;
    }
  }
}
