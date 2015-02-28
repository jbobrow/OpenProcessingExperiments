
/**
  This class, along with the Grid class, implements a very basic "scrolling game".
  There is a fixed difficulty level that doesn't change as the game progresses.
  The player cannot move out of the left edge of the grid.
  points objects give +1 to the score and spike objects give -1.
  
  Author: Weston Mossman
*/

Grid theGrid;
PImage player, points,spike, heart, medicine, attack, hit,
enemy, enemyAttack, enemy1, zelda;
int playerRow;
int scoreHeight;
int score;
int difficulty = 150; // a smaller number will make it harder - see the comment for the loop in draw
int stage = 1;
int level=1;
int myFrameRate = 30;
int life=6;
boolean attacking,enemyAttacking;
int attackTime,attackTime2, dark;
Player link;
int r,g,b;
int hold;
int winX=-20;
int win=0;
boolean play=false;
int walkSpeed=2;

void setup() {
  link=new Player(0);
  size(400, 220);
  scoreHeight = 20;
  theGrid = new Grid(10, 20,width, (height-scoreHeight));
  heart= loadImage("heart.png");
  player = loadImage("LinkRight.png");
  attack=loadImage("attack.png");
  hit = loadImage("hit.png");
  spike = loadImage("spike.png");
  points = loadImage("point.png");
  medicine = loadImage("medicine.png");
  enemy = loadImage("enemy1.png");
  enemyAttack=loadImage("enemy2.png");
  zelda=loadImage("zelda.png");
  PFont font = loadFont("ArialMT-18.vlw"); 
  fill(0);
  textFont(font);
  textAlign(CENTER);
  
}

/*
 Add some new "things" on the far right of the scene then refresh the display.
 */
void draw() {
 if(play==false){
    startUp();
  }
  
  if(life<=0){
    gameOver();
  }
  else if(stage==325){
    win();
  }
  else if (play){
  if (frameCount % (myFrameRate-(level*5)) == 0) { // update the grid just once per second
    theGrid.scrollLeft();
    // add some new stuff on the right
    if(stage<=300){
    for (int row = 0; row < theGrid.numRows(); row++) {
      int choice = int(random(difficulty));
      // 1 chance in difficulty it will be points, 1 in difficutly it will be spike, the rest get nothing
      if (choice == 0||choice==1) {
        theGrid.newStuff(row, points);
      }
      else if (choice >=3&&choice<=10+(5*level)) {
        theGrid.newStuff(row, spike);
      }
      
      else if (choice==2){
        theGrid.newStuff(row, medicine);
      }
      else if (choice>=31&&choice<=35+(5*level)){
        theGrid.newStuff(row, enemy);
      }
      else {
        theGrid.newStuff(row, null);
      }
    }
    }
    refresh();
    stage++;
  }
  if(!attacking){
  link.walk(walkSpeed);
  }
  else if(attacking){
    player= attack;
    attackTime++;
    if(attackTime==20){
      attackTime=0;
      attacking=false;
    }
  }
  if(enemyAttacking){
    enemy1= enemyAttack;
    attackTime2++;
    if(attackTime2==20){
      attackTime2=0;
      enemyAttacking=false;
    }
  }
  link.health();
  }
}

/*
 Refresh the display.
 */
void refresh() {
  if(stage==0){
    r=20;
    g=200;
    b=0;
    walkSpeed=2;
    level=1;
  }
  if(stage==120){
    r=220;
    g=190;
    b=100;
    level++;
    stage++;
    walkSpeed=4;
  }
  if(stage==220){
    r=210;
    g=20;
    b=10;
    level++;
    stage++;
    walkSpeed=5;
  }
  theGrid.setPlayer(playerRow);
  background(r,g,b);
  checkCollision();
  theGrid.draw();
  text("Score: " + score, width/2, height-2);
  text("Level: " +level, width-50,height-2);
  
}

/*
 Use arrows keys to move the player position up and down.
 Modifies the global playerRow.
 */
void keyPressed() {
  if(life!=0&&stage!=375){
    if (key == CODED) { // tells us it was a "special" key
    if (keyCode == UP) {
      playerRow--;
    } 
    else if (keyCode == DOWN) {
      playerRow++;
    }
  }
  if(key== ' '){
    if(hold<1){
      attacking=true;
      hold++;
    }
  }
  
  playerRow = constrain(playerRow, 0, theGrid.numRows()-1);
  refresh();
  }
}
void keyReleased() { 
  if(key==' ')
  hold = 0;
}

/*
    Here is the game logic about what happens when the player collides with various "stuff".
 */
void checkCollision() {
  
  if (theGrid.isPoints(playerRow,0)) {
    theGrid.clear(playerRow,0);
    score++;
  }
  else if (theGrid.isSpike(playerRow,0)) {
    theGrid.clear(playerRow,0);
    life--;
    link.hit();
    
  }
  
  else if (theGrid.isMedicine(playerRow,0)) {
    theGrid.clear(playerRow,0);
    if(life<6)
    life++;
    else
    score+=2;
  }
  
  
  else if (theGrid.isEnemy(playerRow,0)) {
    theGrid.clear(playerRow,0);
    theGrid.cells[playerRow][1] = enemy1;
    enemyAttacking=true;
    life--;
    link.hit();
    
  }
  else if (theGrid.isEnemy1(playerRow,0)) {
    theGrid.clear(playerRow,0);
    theGrid.cells[playerRow][1] = enemy1;
    enemyAttacking=true;
    life--;
    link.hit();
  }
  else if (theGrid.isEnemy(playerRow,1)){
    if(attacking){
      theGrid.clear(playerRow,1);
      score+=5;
    }
  }
    else if (theGrid.isEnemy1(playerRow,1)){
    if(attacking){
      theGrid.clear(playerRow,1);
      score+=5;
    }
  }
  
  
  
}

void gameOver(){
  background(255,0,0);
  fill(dark);
  rectMode(CENTER);
  rect(width/2,height/2,100,20);
  fill(255);
  text("GAME OVER",width/2,(height/2)-20);
  text("Play again?", width/2, (height/2)+5);
  text("Score: " +score, width/2,(height/2)+25);
  if(abs((width/2)-mouseX)<=50&&abs((height/2)-mouseY)<=10){
    dark=100;
    if (mousePressed){
    life=6;
    dark=0;
    fill(0);
    score=0;
    stage=0;
    level=0;
    theGrid.clearAll();
    }
  }
  else
  dark=0;
}

class Player{
  int walkStage;
  Player(int w){
    walkStage=w;
  }
  void walk(int speed){
    println(walkStage);
    if(walkStage%20==0){
      player= loadImage("walk"+walkStage/20+".png");
    }
    walkStage+=speed;
    if(walkStage>=80)
      walkStage=0;
  }
  void health(){
    for(int i=0;i<life;i++){
      image(heart, 15*i,height-15,15,15);
    }
  }
  void hit(){
    player= hit;
    
  }
}
void win(){
  
  background(130,70,160);
  image(zelda,width/2,height/2);
  image(player,winX,height-80);
  if(win<100){
    link.walk(2);
    winX++;
    win++;
  }
  else if(win<300){
    player=hit;
    text("Damn girl! You're huge! And 3D! WHAT IS THIS?",width/2,height-10);
    win++;  
}
  else{
    link.walk(1);
    if(frameCount%2==0)
    winX--;
    fill(dark);
  rectMode(CENTER);
  rect(width/2,(height/2)-25,100,20);
  fill(255);
    text("Play again?", width/2, (height/2)-20);
  text("Score: " +score, width/2,(height/2));
  if(abs((width/2)-mouseX)<=50&&abs(((height/2-25))-mouseY)<=10){
    dark=100;
    if (mousePressed){
    life=6;
    dark=0;
    fill(0);
    score=0;
    stage=0;
    level=0;
    theGrid.clearAll();
    win=0;
    }
  }
  else
  dark=0;
    
  }
}
void startUp(){
  background(200,180,80);
  fill(dark);
  rectMode(CENTER);
  rect(width/2,height/2,100,20);
  fill(60,45,230);
  text("The Adventures of Link",width/2,(height/2)-20);
  text("Play", width/2, (height/2)+5);
  text("By Weston Mossman", width/2,(height/2)+30);
  if(abs((width/2)-mouseX)<=50&&abs((height/2)-mouseY)<=10){
    dark=100;
    if (mousePressed){
    life=7;
    dark=0;
    fill(0);
    score=0;
    stage=0;
    level=0;
    theGrid.clearAll();
    play=true;
    }
  }
  else
  dark=0;
}

