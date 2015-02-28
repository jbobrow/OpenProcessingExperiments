
int numFish = 5;
ArrayList theFishes = new ArrayList();
AvatarFish avtFish;
Shark theShark;
AvatarFish introAvt;
Shark introShark;
EnemyFish introEnemy;
PImage img;
boolean INTRO=true;
boolean INPLAY=false;
boolean GAMEOVER=false;
boolean YOUWIN=false;
boolean sharkGo=false;
boolean enemyFishGo=false;
boolean nextButton=false;
boolean textWave1=true;
boolean textWave2=false;
boolean sharkText2=false;
boolean enemyText2=false;
boolean playButton=false;
int lives=5; //start with 5 lives
int score=0; //start at score 0
PFont kg;
int sharksKilled=0;
int textTimer1 = 0;
int textTimer2 = 0;
int textTimer3 = 0;
int textTimer4 = 0;
int textTimer5 = 0;
int textTimer6 = 0;
int nextButtonTimer = 0;
int playButtonTimer = 0;
int lifeTextSize=20;

boolean downKey, upKey, leftKey, rightKey;
void keyPressed() {
  if (key == CODED && keyCode == RIGHT) rightKey = true;
  if (key == CODED && keyCode == LEFT) leftKey = true;
  if (key == CODED && keyCode == UP) upKey = true;
  if (key == CODED && keyCode ==DOWN) downKey = true;
}
void keyReleased() {
  if (key == CODED && keyCode == RIGHT) rightKey = false;
  if (key == CODED && keyCode == LEFT) leftKey = false;
  if (key == CODED && keyCode == UP) upKey = false;
  if (key == CODED && keyCode ==DOWN) downKey = false;
}

Shark theSharkRespawn() {
  return new Shark();
}

void setup() {
  size(1000, 661);
  smooth();

  img = loadImage("underwater.jpg");

  for (int i=0; i<numFish; i++) {
    theFishes.add(new EnemyFish());
  }

  theShark = theSharkRespawn();
  avtFish = new AvatarFish(width/2, height/2);
  introAvt = new AvatarFish(-100, height/4);
  introShark = new Shark();
  introShark.pos.x=width+200;
  introShark.pos.y=height/2;
  introEnemy = new EnemyFish();
  introEnemy.pos.x=-100;
  introEnemy.pos.y=height-150;

  kg=loadFont("KGLoveYouThroughIt3-48.vlw");
}

void draw() {

  if (INTRO) { //begin if INTRO

      image(img, 0, 0, 1000, 661);
      
      stroke(0);
      strokeWeight(2);
      fill(160, 0, 0);
      
      fill(0, 191);
      rect(50,50,900,570);
  
      fill(255);
      textAlign(CENTER);
      textFont(kg, 25);
      //String s="Use the arrow keys to control your fish. Bite the shark's tail 4 times to kill him, but beware: after you bite him, he'll chase you for awhile! Eat fish smaller than you to grow larger & get points, but stay clear of the ones that are bigger than you. If you lose a life, don't despair; you'll have a few moments of incibility before beginning your quest again.";
      
      //INTRO AVT ANIMATION
      introAvt.drawFish();
      introAvt.fishScale=0.5;
      introAvt.moveFish();
      introAvt.amplitude = 0.4; //random(0.2,2);
      introAvt.waveSpeed = 0.1; //random(0.1,0.3);
      if(introAvt.pos.x<width/5){
        introAvt.velocity.x=5;
        introAvt.velocity.y=0;
      }
      else{
        introAvt.velocity.x=0;
        introAvt.velocity.y=0;
      }
      
      String a="Use the arrow keys to control your fish.";
      
      if(introAvt.pos.x>width/5 && textTimer1<=256 && textWave1){
        fill(255,textTimer1);
        text(a, width-800, 150, 800, 1000);
        if(textTimer1<255){
          textTimer1+=2;
        }
        if(textTimer1==254){
          sharkGo=true;
        }
      }
      
      String d="You have 5 lives to start. Gain a life by killing a shark. If you lose a life, you'll have a few brief moments of invincibility after you respawn.";      
      if(introAvt.pos.x>width/5 && textTimer4<=400 && textWave2){
        fill(255,textTimer4);
        text(d, width-675, 100, 600, 1000);
        if(textTimer4<399){
          textTimer4+=2;
        }
        if(textTimer4==398){
          sharkText2=true;
        }
      }
      
      //END INTRO AVT ANIMATION
      
      //INTRO FISH ANIMATION

      introShark.drawShark();
      introShark.boundaryDetection();
      introShark.moveFish(); 
      introShark.getBitten(avtFish);
      introShark.colourFlash();
      if(introShark.sharkSafe){
        introShark.checkPosition();
      }
      introShark.sharkDeath();
      introShark.sharkSwim(introAvt);
      
      if(introShark.pos.x>=width-260 && sharkGo){
        introShark.velocity.x=-5;
        introShark.velocity.y=0;
      }
      else{
        introShark.velocity.x=0;
        introShark.velocity.y=0;
      }
      
      String b="To win the game, kill 3 sharks. Bite the shark 4 times on the tail (swim up to it) to kill him.";
      if(introShark.pos.x<width-260 && textTimer2<=256 && textWave1){
        fill(255,textTimer2);
        text(b, width-925, 270, 500, 700);
        if(textTimer2<255){
          textTimer2+=2;
        }
        if(textTimer2==254){
          enemyFishGo=true;
        }
      }
      
      String e="You'll gain 400 points by killing a shark. But beware: right after you bite him, he'll chase you for awhile!";      
      if(introAvt.pos.x>width/5 && textTimer5<=400 && sharkText2 && textWave2){
        fill(255,textTimer5);
        text(e, width-925, 270, 500, 700);
        if(textTimer5<399){
          textTimer5+=2;
        }
        if(textTimer5==398){
          enemyText2=true;
          playButton=true;
        }
      }
      
      //INTRO FISH ANIMATION
      
      //INTRO ENEMY FISH ANIMATION
      introEnemy.drawFish(introAvt);
      introEnemy.fishScale=0.5;
      introEnemy.moveFish();
      introEnemy.amplitude = 0.4; //random(0.2,2);
      introEnemy.waveSpeed = 0.1; //random(0.1,0.3);
      if(introEnemy.pos.x<width/5 && enemyFishGo){
        introEnemy.velocity.x=5;
        introEnemy.velocity.y=0;
      }
      else{
        introEnemy.velocity.x=0;
        introEnemy.velocity.y=0;
      }
      
      String c="This is an enemy fish. Eat fish smaller than you to grow larger & get points, but stay clear of the ones that are bigger than you.";
      if(introEnemy.pos.x>width/5 && textTimer3<=256 && textWave1){
        fill(255,textTimer3);
        text(c, width-700, height-200, 600, 1000);
        if(textTimer3<255){
          textTimer3+=2;
        }
        if(textTimer3==254){
          nextButton=true;
        }
      }
      
      String f="Ready? Press play to begin!";
      if(introEnemy.pos.x>width/5 && textTimer6<=256 && textWave2 && enemyText2){
        fill(255,textTimer6);
        text(f, width-700, height-200, 600, 1000);
        if(textTimer6<255){
          textTimer6+=2;
        }
      }
      
      //END ENEMY FISH ANIMATION 
      
      //NEXT BUTTON
      if(nextButton && nextButtonTimer<=256){
        strokeWeight(3);
        stroke(255,nextButtonTimer);
        fill(0,nextButtonTimer);
        rect(width-175,height-110,100,50);
        fill(255,nextButtonTimer);
        text("NEXT", width-423, height-97, 600, 1000);
        if(nextButtonTimer<255){
          nextButtonTimer+=2;
        }
      }
      
      if (mousePressed && dist(mouseX, mouseY, width-150, height-85)<100) {
        textWave1=false;
        textWave2=true;
        nextButton=false;
      }
      
      if(playButton && playButtonTimer<=256){
        strokeWeight(3);
        stroke(255,playButtonTimer);
        fill(0,playButtonTimer);
        rect(width-175,height-110,100,50);
        fill(255,playButtonTimer);
        text("PLAY", width-423, height-97, 600, 1000);
        if(playButtonTimer<255){
          playButtonTimer+=2;
        }
      }
      
      if (mousePressed && dist(mouseX, mouseY, width-150, height-85)<100 && playButton) {
        textWave2=false;
        playButton=false;
        INPLAY=true;
      }
      
      textFont(kg, 20);
      strokeWeight(3);
      stroke(255);
      fill(0);
      rect(width-175,40,125,-30);
      fill(255);
      text("SKIP INTRO", width-410, 15, 600, 1000);
      
      if (mousePressed && dist(mouseX, mouseY, width-175, 40)<100) {
        INPLAY=true;
      }
      
  } //end if INTRO


  if (INPLAY) { //begin if INPLAY
  
    background(0);
    image(img, 0, 0, 1000, 661);

    if (rightKey) avtFish.moveRight();  
    if (leftKey) avtFish.moveLeft();    
    if (upKey) avtFish.moveUp();        
    if (downKey) avtFish.moveDown();   

    theShark.drawShark();
    theShark.boundaryDetection();
    theShark.moveFish(); 
    theShark.getBitten(avtFish);
    theShark.colourFlash();
    if(theShark.sharkSafe){
      theShark.checkPosition();
    }
    theShark.sharkDeath();
    
    if(theShark.pos.y>height+100) {
      theShark=new Shark();
      sharksKilled++;
      score=score+400;
      lives++;
      lifeTextSize=100;
    }
    
    if(sharksKilled==3){
      YOUWIN=true;
    }
    
    //avtFish.fishScale=0.2;
    avtFish.boundaryDetection();  
    if (avtFish.invincible) {
      avtFish.drawInvincibleFish();
    }
    else {
      avtFish.drawFish();
    }

    theShark.sharkSwim(avtFish);

    avtFish.checkInvincibility();

    //avtFish dies if shark hits it (head on or not) -- avtFish.velocity.x*theShark.velocity.x < 0 && abs(avtFish.pos.y-theShark.pos.y) < max((avtFish.fishSize*avtFish.fishScale)/8,(theShark.sharkSize/8)) && 
    if (dist(avtFish.pos.x, avtFish.pos.y, theShark.pos.x+50, theShark.pos.y) < (((avtFish.fishSize*avtFish.fishScale)/2) + theShark.sharkSize/2)*0.75 && abs(avtFish.pos.y-theShark.pos.y) < max((avtFish.fishSize*avtFish.fishScale)/8, (theShark.sharkSize/8)) && !avtFish.invincible && theShark.velocity.x>0) {
      //avtFish = avtFishRespawn();
      avtFish = new AvatarFish(width/2, height/2);
      avtFish.invincibleCount=60;
      lives--;
      lifeTextSize=100;
      theShark.hungry=false;
    }
    if (dist(avtFish.pos.x, avtFish.pos.y, theShark.pos.x-50, theShark.pos.y) < (((avtFish.fishSize*avtFish.fishScale)/2) + theShark.sharkSize/2)*0.75 && abs(avtFish.pos.y-theShark.pos.y) < max((avtFish.fishSize*avtFish.fishScale)/8, (theShark.sharkSize/8)) && !avtFish.invincible && theShark.velocity.x<0) {
      //avtFish = avtFishRespawn();
      avtFish = new AvatarFish(width/2, height/2);
      avtFish.invincibleCount=60;
      lives--;
      lifeTextSize=100;
      theShark.hungry=false;
    }


    for (int i=0; i<theFishes.size(); i++) {

      EnemyFish fishi = (EnemyFish)theFishes.get(i);
      
      fishi.moveFish();
      fishi.boundaryDetection();   
      fishi.drawFish(avtFish);

      for (int k=0; k<theFishes.size(); k++) {
        EnemyFish fishk = (EnemyFish)theFishes.get(k);
        theShark.detectFishInRange(fishk);        
        if (avtFish.detectCollision(fishk) && avtFish.checkHeadOn(fishk)) {   

          for (int m=1; m>0; m--) {
            if ( ((fishk.fishSize*fishk.fishScale) < (avtFish.fishSize*avtFish.fishScale)) ) {
              fishk.traceTimer=15;
              avtFish.fishScale *= 1.02; //fish grows after eating another fish
            }
          }

          avtFish.eat(fishk);


          if (!avtFish.fishAlive && !avtFish.invincible) {
            avtFish = new AvatarFish(width/2, height/2);
            avtFish.avtDeath();
          }
        }
        
        theShark.detectFishInRange(fishk);

        if (i != k) {
          if (fishi.detectCollision(fishk)) {
            fishi.collide(fishk);
          }
        }
      }
    }
    
    stroke(255);
    strokeWeight(2);
    fill(0,150);
    rect(width/2-75,height-63,150,50);

    textAlign(CENTER);
    noStroke();
    fill(255);
    textFont(kg, lifeTextSize);
    if(lifeTextSize>20){
      lifeTextSize-=2;
    }
    text("Lives: " + lives, width/2, height-20);
    textFont(kg, 20);
    text("Score: " + score, width/2, height-40);

    if (lives<=0) {
      INPLAY=false;
      INTRO=false;
      GAMEOVER=true;
      YOUWIN=false;
    }
    
  } //end if INPLAY

  if (GAMEOVER) { //begin if GAMEOVER

      image(img, 0, 0, 1000, 661);

    for (int i=0; i<theFishes.size(); i++) {
      EnemyFish fishi = (EnemyFish)theFishes.get(i);
      theFishes.remove(fishi);
    }
    
    stroke(0);
    strokeWeight(2);
    
    fill(0, 191);
    rect(50,50,900,570);
    fill(255);
    
    textFont(kg, 50);
    text("YOU LOSE!", width/2, height-500);
    text("Your score: " +score, width/2, height-420);
    
    textFont(kg, 20);
    stroke(255);
    strokeWeight(5);
    noFill();
    rect(width/2-60,height/2,120,50);
    fill(255);
    text("Try again?", width/2-299, height/2+14, 600, 1000);
    
    if (mousePressed && dist(mouseX, mouseY, width/2-60, height/2)<120) {
      GAMEOVER=false;
      INTRO=false;
      INPLAY=true;
      YOUWIN=false;
      
      //RESET GAME VALUES:
      lives=5;
      score=0;
      sharksKilled=0;
      theShark = new Shark(); //replace shark
      avtFish = new AvatarFish(width/2, height/2); //replace player fish
      //create new enemy fishes
      for (int i=0; i<numFish; i++) {
        theFishes.add(new EnemyFish());
      }
      
    }
    fill(255);
  } //end if GAMEOVER
  
  if(YOUWIN){

    image(img, 0, 0, 1000, 661);
    
    for (int i=0; i<theFishes.size(); i++) {
      EnemyFish fishi = (EnemyFish)theFishes.get(i);
      theFishes.remove(fishi);
    }

    stroke(0);
    strokeWeight(2);
    
    fill(0, 191);
    rect(50,50,900,570);
    fill(255);
    
    textFont(kg, 50);
    text("YOU WIN!", width/2, height-500);
    text("Your score: " +score, width/2, height-420);
    
    textFont(kg, 20);
    stroke(255);
    strokeWeight(5);
    noFill();
    rect(width/2-100,height/2,200,50);
    fill(255);
    text("Beat your score?", width/2-299, height/2+14, 600, 1000);
    
    if (mousePressed && dist(mouseX, mouseY, width/2-100, height/2)<200) {
      GAMEOVER=false;
      INTRO=false;
      INPLAY=true;
      YOUWIN=false;
      
      //RESET GAME VALUES:
      lives=5;
      score=0;
      sharksKilled=0;
      theShark = new Shark(); //replace shark
      avtFish = new AvatarFish(width/2, height/2); //replace player fish
      //create new enemy fishes
      for (int i=0; i<numFish; i++) {
        theFishes.add(new EnemyFish());
      }
      
    }
    fill(255);
  }
}

class AvatarFish extends Fish {
  int invincibleCount;
  boolean invincible, growth;

  AvatarFish(float xPos, float yPos) {
    super();
    velocity= new PVector (7, 7);
    pos=new PVector (xPos, yPos);
    fishScale = 0.2;
    invincibleCount=0;
  }

  void checkInvincibility() {
    if (invincibleCount>0) {
      invincible=true;
      invincibleCount--;
    }
    else {
      invincible=false;
    }
  }

  void moveRight() {
    if (velocity.x < 0)velocity.x *= -1;
    pos.x += velocity.x;
  }
  void moveLeft() {
    if (velocity.x > 0)velocity.x *= -1;
    pos.x += velocity.x;
  }
  void moveUp() {
    pos.y -= velocity.y;
  }
  void moveDown() {
    pos.y += velocity.y;
  }

  void eat(Fish other) {
    if ((fishSize*fishScale) > (other.fishSize*other.fishScale)) { 
      if (fishScale<2 && growth) { 
        fishScale *= 1.05;
        growth=false;
      }
    }
    else {
      this.fishAlive = false;
      if(!invincible){
        lives--;
        lifeTextSize=100;
      }
      
    }
  }

  void avtDeath() {  
    invincibleCount=60;
  }

  boolean checkHeadOn(Fish other) {
    if (velocity.x*other.velocity.x < 0 && abs(pos.y-other.pos.y) < max((fishSize*fishScale)/8, (other.fishSize*other.fishScale)/8)) {
      return true;
    }
    return false;
  }

  void drawFish() {
    super.drawFish();
  }

  void drawInvincibleFish() {
    if (invincible && invincibleCount%6==0) {
      super.drawFish();
    }
  }
}
class EnemyFish extends Fish {

  EnemyFish() {
    super();
    //deciding if shooting in left or right:
    if (random(0, 2)>1) {
      pos = new PVector(0-0.5*(fishScale*fishSize), random(height));
      velocity = new PVector(random(0, 2), random(-2, 2));
    }
    else {
      pos = new PVector(width+0.5*(fishScale*fishSize), random(height));
      velocity = new PVector(random(-2, 0), random(-2, 2));
    }
  }

  void boundaryDetection() { 
    //right
    if (pos.x+fishSize/2*fishScale>width+fishScale*fishSize) {
      killFish(theFishes);
      theFishes.add(new EnemyFish());
    }
    //left
    if (pos.x-fishSize/2*fishScale < -fishScale*fishSize) {
      killFish(theFishes);
      theFishes.add(new EnemyFish());
    }
    //bottom
    if (pos.y+fishSize/2*fishScale>height+fishScale*fishSize) {
      killFish(theFishes);
      theFishes.add(new EnemyFish());
    }
    //top
    if (pos.y-fishSize/2*fishScale<-fishScale*fishSize) {
      killFish(theFishes);
      theFishes.add(new EnemyFish());
    }
  }

  void drawFish(AvatarFish other) {
    if (traceTimer==0) {

      pushMatrix();
      translate(pos.x, pos.y);    
      scale(fishScale);
      if (velocity.x<0) {
        rotateY(PI);
      }

      noFill();
      //tail
      stroke(0);
      strokeWeight(1);
      fill(enemyTailColour);
      quad(-150, 90, -150, 0, -150, -90, -40, 0);
      //inner tail
      fill(enemyAccent);
      noStroke();
      quad(-135, 65, -110, 0, -135, -65, -60, 0);
      strokeWeight(1);
      stroke(0);

      //top fin
      fill(enemyFinColour);
      triangle(0, 70, 120, -50, -50, -110);
      //bottom fin
      triangle(0, -80, 120, 50, -50, 110);
      //inner top fin
      fill(enemyAccent);
      noStroke();
      triangle(20, 70, 120, -40, -40, -100);
      //inner bottom fin
      triangle(20, -70, 120, 40, -40, 100);

      //body
      strokeWeight(1);
      stroke(0);
      fill(enemyBodyColour);
      ellipse(25, 0, 244, 166);

      //body spots
      noStroke();
      fill(enemySpotsColour);
      ellipse(0, -60, 15, 15);
      ellipse(-10, 60, 15, 15);
      ellipse(-35, -55, 15, 15);
      ellipse(-35, 55, 15, 15);
      ellipse(-15, -30, 15, 15);
      ellipse(-20, 30, 15, 15);
      noFill();

      //body and face
      stroke(0);
      strokeWeight(1);
      curve(500, 0, 50, 81, 50, -81, 500, -100); //face outline
      bezier(20, 35, 0, 30, 0, -30, 20, -35); //first gill
      bezier(30, 33, 5, 30, 5, -30, 30, -33); //second gill
      fill(200, 0, 0);
      ellipse(70, 0, 50, 50); //eye
      strokeWeight(2);
      //eyebrow
      line(55, -20, 95, 3);
      fill(enemyBodyColour);
      noStroke();
      quad(51, -23, 97, 4, 120, -30, 40, -40);

      stroke(0);
      strokeWeight(1);
      fill(0);
      ellipse(70, 0, 10, 10); //pupil
      fill(50);
      bezier(95, 40, 100, 0, 130, 0, 125, 40); //mouth
      line(95, 40, 125, 40);

      //body fin
      fill(enemyFinColour);
      quad(-75, 45, -60, 0, -75, -45, -20, 0);
      //inner body fin
      noStroke();
      fill(enemyAccent);
      quad(-60, 25, -50, 0, -60, -25, -30, 0);
      popMatrix();
    }

    //DEATH TRACE:
    if (traceTimer>0) {
      pushMatrix();
      velocity.x=0;
      velocity.y=0;
      amplitude = 0;
      wave = 0;
      waveSpeed = 0;

      strokeWeight(3);
      stroke(enemyBodyColour);
      noFill();
      ellipse(pos.x, pos.y, fishSize*fishScale*traceTimer/10, fishSize*fishScale*traceTimer/10);
      
      fill(255);
      if (fishSize*fishScale > other.fishSize*other.fishScale*0.95) {
        textFont(kg, 20);
        text("+40!", pos.x, pos.y-traceTimer-20);
      }
      
      if (fishSize*fishScale <= other.fishSize*other.fishScale*0.95 && fishSize*fishScale > other.fishSize*other.fishScale*0.5) {
        textFont(kg, 20);
        text("+20!", pos.x, pos.y-traceTimer-20);
      }
      
      if (fishSize*fishScale <= other.fishSize*other.fishScale*0.5) {
        textFont(kg, 20);
        text("+10!", pos.x, pos.y-traceTimer-20);
      }
      
      traceTimer--;
      popMatrix();
    }

    //SCORING:
    if (traceTimer==1) {

      //BIG FISH
      if (fishSize*fishScale > other.fishSize*other.fishScale*0.95) {
        score=score+40;
      }
      //MEDIUM FISH
      if (fishSize*fishScale <= other.fishSize*other.fishScale*0.95 && fishSize*fishScale > other.fishSize*other.fishScale*0.5) {
        score=score+20;
      }
      //SMALL FISH
      if (fishSize*fishScale <= other.fishSize*other.fishScale*0.5) {
        score=score+10;
      }

      killFish(theFishes);
      theFishes.add(new EnemyFish());
    }
  }
}

class Fish{
  float fishSize, fishScale, amplitude, wave, waveSpeed, sharkSize, traceTimer;
  color bodyColour, tailColour, accentColour, enemyBodyColour, enemyTailColour, enemyAccent, enemyFinColour, enemySpotsColour;
  boolean fishAlive;
  PVector pos, velocity;
  
  Fish(){
    bodyColour = color(240,175,0);
    tailColour = color(240,175,0);
    accentColour = color(255);
    pos = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
    enemyBodyColour = color(random(0,255),random(0,255),random(0,255));
    enemyTailColour = color(random(0,255),random(0,255),random(0,255));
    enemyAccent = color(random(0,255),random(0,255),random(0,255));
    enemyFinColour = color(random(0,255),random(0,255),random(0,255));
    enemySpotsColour = color(random(0,255),random(0,255),random(0,255));
    fishSize = 380;
    fishScale=random(0.08,0.5);
    amplitude = random(0.2,2);
    wave = random(4*PI);
    waveSpeed = random(0.1,0.3);
    fishAlive=true;
    sharkSize = 300;
    traceTimer=0;
    
  }

  void boundaryDetection(){
    //right
    if(pos.x+fishSize/2*fishScale>width+(fishSize*fishScale)/10){
      pos.x=width+(fishSize*fishScale)/10-fishSize/2*fishScale;
    }
    //left
    if(pos.x-fishSize/2*fishScale < -(fishSize*fishScale)/10){
      pos.x = fishSize/2*fishScale-(fishSize*fishScale)/10;
    }
    //bottom
    if(pos.y+fishSize/2*fishScale>height+(fishSize*fishScale)/5){
      pos.y = height-fishSize/2*fishScale+(fishSize*fishScale)/5;
    }
    //top
    if(pos.y-fishSize/2*fishScale<-(fishSize*fishScale)/5){
      pos.y=fishSize/2*fishScale-(fishSize*fishScale)/5;
    }
  }
  
  void moveFish(){
    pos.x += velocity.x;
    pos.y += velocity.y+sin(wave)*amplitude;
    wave += waveSpeed;
  }
  
  boolean detectCollision(Fish other){
    if(dist(pos.x,pos.y,other.pos.x,other.pos.y) < (((fishSize*fishScale)/2) + ((other.fishSize*other.fishScale)/2))*0.75){
      return true;
    }
    return false;
  }
  
  void killFish(ArrayList theFishes){
    theFishes.remove(this);
  }
  
  void collide(Fish other){
      float angle=atan2(pos.y-other.pos.y, pos.x-other.pos.x);      
      velocity.x=2*cos(angle);
      velocity.y=2*sin(angle);   
      other.velocity.x=2*cos(angle-PI);
      other.velocity.y=2*sin(angle-PI);
  }
  
  void drawFish(){
      pushMatrix();
      translate(pos.x,pos.y);    
      scale(fishScale);
      if(velocity.x<0){
        rotateY(PI);
      }
      //tail
      stroke(0);
      strokeWeight(1);
      fill(tailColour);
      triangle(-150,75,-75,0,-150,-75);
      
      //body Colour
      fill(bodyColour);
      curve(60,810,-82,0,148,0,0,810); 
      curve(60,-810,-82,0,148,0,0,-810);
      
      //stripes
      noFill();
      stroke(accentColour);
      strokeWeight(3);
      bezier(-48,-68,-45,-20,-90,-15,-51,65); //1st body stripe
      bezier(2,-97,0,-20,-80,-15,3,97); //2nd body stripe   
      
      //tail decorations
      noStroke();
      fill(accentColour);
      ellipse(-100,0,15,15);
      noFill();
      stroke(0);
      strokeWeight(2);
      stroke(accentColour);
      bezier(-130,-55,-140,-40,-140,35,-130,55); //1st tail stripe
      bezier(-110,-35,-120,-20,-120,25,-110,35); //2nd tail stripe
      
      //body and face
      stroke(0);
      strokeWeight(1);
      curve(60,810,-82,0,148,0,0,810); //bodycurvetop
      curve(60,-810,-82,0,148,0,0,-810); //bodycurvebottom
      curve(500,-100,50,99,50,-100,500,-100); //face outline
      bezier(20,35,0,30,0,-30,20,-35); //first gill
      bezier(30,33,5,30,5,-30,30,-33); //second gill
      fill(255);
      ellipse(70,0,50,50); //eye
      fill(0);
      ellipse(70,0,10,10); //pupil
      fill(50);
      bezier(100,20,100,60,130,60,130,20); //mouth
      line(100,20,130,20);
      noFill();
    
      //fins
      fill(bodyColour);
      curve(400,-500,-20,10,-20,-10,400,500); //back of body fin
      bezier(-65,-23,-40,-15,-50,-10,-35,-5); //top finline
      bezier(-70,-8,-40,-5,-55,-5,-40,0); //2nd finline
      bezier(-69,4,-40,8,-55,5,-40,5); //3rd finline
      bezier(-67,20,-44,15,-55,12,-38,12); //bottom finline
      curve(300,100,-40,-75,-15,-90,-150,100); //topfin
      curve(300,-100,-40,75,-15,90,-150,-100); //bottomfin
      noFill();
      curve(-35,-95,-50,-100,-35,-80,30,-100); //top first finline
      curve(-35,-95,-40,-105,-30,-85,-35,-100); //top second finline
      curve(-45,-95,-25,-105,-25,-85,-35,-100); //top third finline
      curve(-35,95,-50,100,-35,80,30,100); //bottom first finline
      curve(-35,95,-40,105,-30,85,-35,100); //bottom second finline
      curve(-45,95,-25,105,-25,85,-35,100); //bottom third finline
      popMatrix();
  } 
}
class Shark extends EnemyFish {
  color sharkColour;
  int colourTimer, sharkBites, boundaryTimer, stalkTimer, gracePeriod, sharkDeathTimer;
  boolean hungry, sharkSafe, detectFishInRange, deadShark;
  PVector nosePosition;

  Shark() {
    super();
    sharkSize = 370;

    if (random(0, 2)>1) {
      pos = new PVector(-sharkSize/2, height/2);
      velocity = new PVector(1, random(-0.5, 0.5));
    }
    else {
      pos = new PVector(width+sharkSize/2, height/2);
      velocity = new PVector(-1, random(-0.5, 0.5));
    }

    hungry=false;
    sharkSafe=true;
    detectFishInRange=false;
    stalkTimer=0;
    sharkBites=0;
    sharkDeathTimer=0;
    deadShark=false;
 
  }

  void getBitten(AvatarFish avtFish) {
    if (dist(pos.x+175, pos.y, avtFish.pos.x, avtFish.pos.y)<(avtFish.fishSize*avtFish.fishScale/2) && (velocity.x*avtFish.velocity.x)>0 && velocity.x<0 && colourTimer<30) {
      colourTimer = 60;
    }
    if (dist(pos.x-175, pos.y, avtFish.pos.x, avtFish.pos.y)<(avtFish.fishSize*avtFish.fishScale/2) && (velocity.x*avtFish.velocity.x)>0 && velocity.x>0 && colourTimer<30) {
      colourTimer = 60;
    }
  }


  void sharkSwim(AvatarFish other) {
    if (stalkTimer>=0 && hungry && sharkDeathTimer==0) {
      PVector foodDistance = PVector.sub(other.pos, pos);
      if (foodDistance.mag()>15) {
        foodDistance.mult(32/foodDistance.dot(foodDistance));
      }
      if (velocity.x<5 && velocity.y<5) {
        velocity.add(foodDistance);
      }
      stalkTimer--;
    }
    else {
      if (velocity.x>1) {
        velocity.x=velocity.x-0.5;
      }
      if (velocity.y>1) {
        velocity.y=velocity.y-0.5;
      }
    }
  }

  void colourFlash() {
    if (sharkBites==4) {
      sharkDeathTimer=120;
    }
    else {
      if (colourTimer>=0) {
        if (colourTimer==59) {
          sharkBites=sharkBites+1;
        }  
        if (colourTimer>30 && colourTimer!=59) {
          sharkColour = color(100+colourTimer);
        }
        if (colourTimer<30) {
          sharkColour = color(100-colourTimer);
        }
        if (colourTimer==1) {
          stalkTimer=360;
          hungry=true;
        }
        colourTimer--;
      }
      else{
        sharkColour = color(150);
      }      
    }
  }

  void sharkDeath() {
    if (sharkDeathTimer>0) {
      if (velocity.x>0) {
        velocity.x=0.0001;
      }
      if (velocity.x<0) {
        velocity.x=-0.0001;
      }
      velocity.y=3;
      sharkSafe=true;
      sharkDeathTimer--;
      deadShark=true;
    }
  }

  void checkPosition() { //so boundary detection doesn't kick in until shark is onscreen
    if (0<pos.x-sharkSize/2 && pos.x+sharkSize/2<width && 0<pos.y-sharkSize/4 && pos.y+sharkSize/4<height) {
      sharkSafe=false;
    }
  }

  void moveFish() {
    pos.x += velocity.x;
    pos.y += velocity.y;
  }

  void boundaryDetection() {
    //NOTE: shark edge goes slightly off screen so that when chasing the fish, its nose is able to
    //reach the corners & catch the fish (otherwise, it bounces away too quickly and the fish could just 
    //sit in the corner and be safe... something I realized while testing)

    //right
    if (pos.x+sharkSize/4>width && !sharkSafe) {
      velocity.x*=-1;
      //hungry=false;
    }
    //left
    if (pos.x-sharkSize/4 < 0 && !sharkSafe) {
      velocity.x*=-1;
    }
    //bottom
    if (pos.y+sharkSize/6>height && !sharkSafe) {
      velocity.y*=-1;
    }
    //top
    if (pos.y-sharkSize/6<0 && !sharkSafe) {
      velocity.y*=-1;
    }
  }

  void detectFishInRange(Fish other) {
    if (dist(pos.x, pos.y, other.pos.x, other.pos.y) < ((sharkSize/2 + (other.fishSize*other.fishScale)/2)*0.75)) {
      float angle=atan2(pos.y-other.pos.y, pos.x-other.pos.x);      
      other.velocity.x=2*cos(angle-PI);
      other.velocity.y=2*sin(angle-PI);
    }
  }

  void drawShark() {

    if (deadShark) {

      pushMatrix();
      translate(pos.x, pos.y);    
      if (velocity.x>0) {
        rotateY(PI);
      }
      
      scale(1,-1);

      stroke(0);
      strokeWeight(2);


      fill(sharkColour);


      //TOPFIN
      triangle(-75, -43, 2, -90, -50, 23);
      noStroke();
      triangle(-75, -43, 1, -90, -50, 23); 
      strokeWeight(1);
      stroke(0);
      curve(-40, 0, -73, -43, 2, -90, 10, 0); 
      //END TOPFIN

      //BOTTOM FIN1
      triangle(-75, 43, 2, 90, -50, -23); 
      noStroke();
      triangle(-75, 43, 1, 90, -50, -23); 
      strokeWeight(1);
      stroke(0);
      curve(-40, 0, -73, 43, 2, 90, 10, 0);  
      //ENDBOTTOMFIN1

      //BOTTOM FIN2
      triangle(-95, 43, -18, 90, -70, -23); 
      noStroke();
      triangle(-95, 43, -19, 90, -70, -23); 
      strokeWeight(1);
      stroke(0);
      curve(-60, 0, -93, 43, -18, 90, -10, 0); 
      //ENDBOTTOMFIN2

      //TAIL
      fill(sharkColour);
      triangle(120, 20, 160, -20, 200, 40); 
      triangle(120, -20, 160, 20, 200, -75); 
      noStroke();
      triangle(120, 20, 160, -20, 190, 27);   
      //END TAIL

      //TAIL CURVE
      strokeWeight(1);
      stroke(0);
      fill(132, 217, 242);
      //curve(400,-400,200,-75,200,40,500,100);
      //TAIL CURVE

      //BODY
      fill(sharkColour);
      ellipse(0, 0, 300, 110);
      //ENDBODY

      //TAIL BLOCK
      noStroke();
      fill(sharkColour);
      ellipse(140, -3, 25, 53);
      //TAIL BLOCK

      //BOTTOMFINLINES
      strokeWeight(1);
      stroke(0);
      curve(-100, 0, -92, 43, -105, 33, -170, 0);
      //BOTTOMFINLINES

      //BOTTOMFINFBLOCK
      noStroke();
      ellipse(-57, 53, 45, 15);
      ellipse(-80, 42, 25, 15);
      //END BOTOMFINBLOCK

      //TopFINFBLOCK
      ellipse(-37, -53, 45, 25);
      //END TopFINBLOCK

      //LITTLEFIN
      strokeWeight(1);
      stroke(0);
      curve(-100, 50, 52, 49, 83, 43, 100, -50);
      //ENDLITTLEFIN

      //HEAD
      fill(sharkColour);
      curve(300, -150, -111, -37, -111, 37, 300, 150);
      //ENDHEAD

      //MOUTH
      strokeWeight(1);
      stroke(0);
      fill(132, 217, 242);
      //curve(-400,150,-145,20,-126,30,-200,0);
      //mouthlineblock
      noStroke();
      //ellipse(-135,25,20,15);
      //ENDMOUTH

      //EYE
      strokeWeight(1);
      stroke(0);
      fill(255);
      ellipse(-125, -5, 25, 25);
      fill(0);
      ellipse(-127, -5, 5, 5);
      //ENDEYE

      //GILLS
      noFill();
      curve(-120, 0, -70, -25, -70, 25, -120, 0);
      curve(-115, 0, -65, -25, -65, 25, -115, 0);
      //ENDGILLS

      popMatrix();
    }

    else {
      
      pushMatrix();
      translate(pos.x, pos.y);    
      if (velocity.x>0) {
        rotateY(PI);
      }


      stroke(0);
      strokeWeight(2);

      fill(sharkColour);

      //TOPFIN
      triangle(-75, -43, 2, -90, -50, 23);
      noStroke();
      triangle(-75, -43, 1, -90, -50, 23); 
      strokeWeight(1);
      stroke(0);
      curve(-40, 0, -73, -43, 2, -90, 10, 0); 
      //END TOPFIN

      //BOTTOM FIN1
      triangle(-75, 43, 2, 90, -50, -23); 
      noStroke();
      triangle(-75, 43, 1, 90, -50, -23); 
      strokeWeight(1);
      stroke(0);
      curve(-40, 0, -73, 43, 2, 90, 10, 0);  
      //ENDBOTTOMFIN1

      //BOTTOM FIN2
      triangle(-95, 43, -18, 90, -70, -23); 
      noStroke();
      triangle(-95, 43, -19, 90, -70, -23); 
      strokeWeight(1);
      stroke(0);
      curve(-60, 0, -93, 43, -18, 90, -10, 0); 
      //ENDBOTTOMFIN2

      //TAIL
      fill(sharkColour);
      triangle(120, 20, 160, -20, 200, 40); 
      triangle(120, -20, 160, 20, 200, -75); 
      noStroke();
      triangle(120, 20, 160, -20, 190, 27);   
      //END TAIL

      //TAIL CURVE
      strokeWeight(1);
      stroke(0);
      fill(132, 217, 242);
      //curve(400,-400,200,-75,200,40,500,100);
      //TAIL CURVE

      //BODY
      fill(sharkColour);
      ellipse(0, 0, 300, 110);
      //ENDBODY

      //TAIL BLOCK
      noStroke();
      fill(sharkColour);
      ellipse(140, -3, 25, 53);
      //TAIL BLOCK

      //BOTTOMFINLINES
      strokeWeight(1);
      stroke(0);
      curve(-100, 0, -92, 43, -105, 33, -170, 0);
      //BOTTOMFINLINES

      //BOTTOMFINFBLOCK
      noStroke();
      ellipse(-57, 53, 45, 15);
      ellipse(-80, 42, 25, 15);
      //END BOTOMFINBLOCK

      //TopFINFBLOCK
      ellipse(-37, -53, 45, 25);
      //END TopFINBLOCK

      //LITTLEFIN
      strokeWeight(1);
      stroke(0);
      curve(-100, 50, 52, 49, 83, 43, 100, -50);
      //ENDLITTLEFIN

      //HEAD
      fill(sharkColour);
      curve(300, -150, -111, -37, -111, 37, 300, 150);
      //ENDHEAD

      //MOUTH
      strokeWeight(1);
      stroke(0);
      fill(132, 217, 242);
      //curve(-400,150,-145,20,-126,30,-200,0);
      //mouthlineblock
      noStroke();
      //ellipse(-135,25,20,15);
      //ENDMOUTH

      //EYE
      strokeWeight(1);
      stroke(0);
      fill(255);
      ellipse(-125, -5, 15, 15);
      fill(0);
      ellipse(-127, -5, 5, 5);
      //eyeblock
      fill(sharkColour);
      curve(0, -90, -110, -20, -135, -10, -100, -100);
      //ENDEYE

      //GILLS
      noFill();
      curve(-120, 0, -70, -25, -70, 25, -120, 0);
      curve(-115, 0, -65, -25, -65, 25, -115, 0);
      //ENDGILLS

      popMatrix();
    }
  }
}



