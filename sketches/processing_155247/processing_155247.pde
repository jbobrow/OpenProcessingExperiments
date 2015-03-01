
Cell[][] cell;
Ship ship;

int gridWidth = 100;
int gridHeight = 100;
int cellHeight = 4;

boolean aPressed = false;
boolean sPressed = false;
boolean aHeld = false;
boolean sHeld = false;
boolean bombPressed = false;
boolean bombHeld = false;

int rate = 50; //

int currentLevel = 0;

boolean showMenu = true;
boolean showLevelDescription = false;
boolean showControls = false;
boolean showGameOver = false;
boolean animateText = false;

int animateCounter = 0;
int animateMax = 25;
boolean holdAnimate = false;

void setup(){
  //frameRate(16);
  size(400,400);
  noStroke();
  
  cell = new Cell[gridWidth][gridHeight];
  for(int i = 0; i < gridWidth; i++){
    for(int j = 0; j < gridHeight; j++){
     cell[i][j] = new Cell(i,j);
    }
  }
  
  ship = new Ship();
  
  setLevel(ship.x,ship.y,currentLevel);
  
}

void draw(){
  int startTime = millis();
  background(0);
  
  // findNeighbourStates
  for(int i = 0; i < gridWidth; i++){
    for(int j = 0; j < gridHeight; j++){
     cell[i][j].findNStates();
    }
  }
  
  // Update States
  for(int i = 0; i < gridWidth; i++){
    for(int j = 0; j < gridHeight; j++){
     cell[i][j].updateState();
    }
  }
  
  // menu and description items
  if(showControls){
    controls();
  }
  else if(showMenu){
    menu();
  }
  else if(showLevelDescription){
    levelDescription(); 
  }
  else if(showGameOver){
    gameOver(); 
  }
  
  
  // display
  fill(255);
  for(int i = 0; i < gridWidth; i++){
    for(int j = 0; j < gridHeight; j++){
     cell[i][j].display();
    }
  }
  
  // fade out when animating text
  if(animateText || holdAnimate){
    fill(0,animateCounter*10);  
    rect(0,0,width,height);
    holdAnimate = false;
    
    if(animateText){
      holdAnimate = true;
    }
  }
    
  
  ship.changeDirection();
  ship.updateShip();
  
  
  if(!showControls && !showMenu && !showLevelDescription && !showGameOver && !animateText){
    ship.dropBomb(); 
    ship.checkForDamage();
  }
  
  // test for complete kill
  int countLiving = 0;
  for(int i = 0; i < gridWidth; i++){
    for(int j = 0; j < gridHeight; j++){
     if(cell[i][j].getState() == 1){
       countLiving++; 
     }
    }
  }
  
  if(countLiving == 0){
    currentLevel++;
    ship.levelStartHealth = ship.health;
    showLevelDescription = true; 
  }
  
  if(ship.health <= 0){
    showGameOver = true; 
  }
  
  // control rate of movement
  while(millis() < startTime + rate){
  }
}

void keyPressed(){
  if((key == 'a' || key == 'A') && !aHeld){
    aPressed = true; 
    aHeld = true;
  }
  if((key == 's' || key == 'S') && !sHeld){
    sPressed = true;
    sHeld = true;
  }
  if(key == ' ' && !bombHeld){
    bombPressed = true;
    bombHeld = true; 
  }
  
  if(key == 'r' || key == 'R'){
    showLevelDescription = true;
    showControls = false;
    showMenu = false; 
    showGameOver = false;
    
    ship.health = ship.levelStartHealth;
  }
  
  if(key == 'c' || key == 'C'){
    showControls = true; 
    showMenu = false;
    showLevelDescription = false;
    showGameOver = false;
  }
  
  if(key == 'm' || key == 'M'){
    showMenu = true;
    showControls = false;
    showLevelDescription = false; 
    showGameOver = false;
    
    ship.health = 100;
  }
}

void keyReleased(){
  if(key == 'a' || key == 'A'){
    aHeld = false; 
  }
  if(key == 's' || key == 'S'){
    sHeld = false;
  }
  
  if(key == ' '){
    bombHeld = false; 
  }
}
class Cell{
  
  int x,y;
  int h = cellHeight;
  int state;
  
  int[] nState = new int[8]; // n, e, s, w
  
  Cell(int tx, int ty){
    x = tx;
    y = ty;
  } 
  
  void shipDisplay(){
    
    if(state == 1){
      rect(x*h,y*h,h,h); 
    }
  }
  
  void findShipNStates(){      
    // N
    nState[0] = ship.bits[x][(y-1+gridHeight)%gridHeight].getState();
    
    // NE *    
    nState[1] = ship.bits[(x+1+gridHeight)%gridHeight][(y-1+gridHeight)%gridHeight].getState();
        
    // E
    nState[2] = ship.bits[(x+1+gridHeight)%gridWidth][y].getState();
    
    // SE
    nState[3] = ship.bits[(x+1)%gridWidth][(y+1)%gridHeight].getState();
    
    // S
    nState[4] = ship.bits[x][(y+1)%gridHeight].getState();
    
    // SW *
    nState[5] = ship.bits[(x-1+gridHeight)%gridHeight][(y+1+gridHeight)%gridHeight].getState();
    
    // W *
    nState[6] = ship.bits[(x-1+gridHeight)%gridHeight][y].getState(); 
    
    // NW *
    nState[7] = ship.bits[(x-1+gridHeight)%gridHeight][(y-1+gridHeight)%gridHeight].getState();    
  }
  
  void display(){
    if(state == 1){    
     rect(x*h,y*h,h,h);
    }
  }
  
  int getState(){
    return state; 
  }
  
  void findNStates(){ // n e s w    
    // N
    nState[0] = cell[x][(y-1+gridHeight)%gridHeight].getState();
    
    // NE *    
    nState[1] = cell[(x+1+gridHeight)%gridHeight][(y-1+gridHeight)%gridHeight].getState();
        
    // E
    nState[2] = cell[(x+1+gridHeight)%gridWidth][y].getState();
    
    // SE
    nState[3] = cell[(x+1)%gridWidth][(y+1)%gridHeight].getState();
    
    // S
    nState[4] = cell[x][(y+1)%gridHeight].getState();
    
    // SW *
    nState[5] = cell[(x-1+gridHeight)%gridHeight][(y+1+gridHeight)%gridHeight].getState();
    
    // W *
    nState[6] = cell[(x-1+gridHeight)%gridHeight][y].getState(); 
    
    // NW *
    nState[7] = cell[(x-1+gridHeight)%gridHeight][(y-1+gridHeight)%gridHeight].getState();    
  }
  
  void updateState(){
    int count = 0;
   
    for(int i = 0; i < nState.length; i++){
      if(nState[i] == 1){
        count++; 
      }
    } 
    
    if(state == 1){
      if(count < 2 || count > 3){
        state = 0;
      } 
    }
    else if(state == 0){
      if(count == 3){
        state = 1;
      } 
    }
  }
  
  
}
void menu(){
  if(!animateText){ 
    killAll();
    
    writeString(10,10,1,"king's");
    writeString(10,26,1," conway's game");
    writeString(10,34,1," of life");
    writeString(10,50,1,"   game");
    
    writeString(10,80,1,"Space - start");
    writeString(10,88,1,"C - controls");
    
    if(bombPressed){
      bombPressed = false;
      animateText = true;
      animateCounter = 0;
    }
  }
  
  if(animateText){
    animateCounter++;
    
    if(animateCounter > animateMax){
      animateText = false;
      showMenu = false;
      showLevelDescription = true;
      ship.health = 100;
      ship.levelStartHealth = 100;
      currentLevel = 0;
    }
  }
}

void controls(){
  killAll();
 
  writeString(10,10,1,"a-turn left"); 
  writeString(10,18,1,"s-turn right");
  writeString(10,26,1,"space-cellbomb");
  writeString(10,34,1,"r-retry");
  writeString(10,42,1,"m-menu");
   
}

void gameOver(){
  killAll();
 
  writeString(10,42,1,"game over");
 
  writeString(10,80,1,"r-retry");
  writeString(10,88,1,"m-menu"); 
}

void levelDescription(){
  
  String theLevel = "";
  String enemyName = "";
  
  if(currentLevel == 0){
    enemyName = "block"; 
    theLevel = "level one";
  }
  else if(currentLevel == 1){
    enemyName = "beehive"; 
    theLevel = "level two";
  }
  else if(currentLevel == 2){
    enemyName = "glider"; 
    theLevel = "level three";
  }
  else if(currentLevel == 3){
    enemyName = "LWSS";
    theLevel = "level four"; 
  }
  else if(currentLevel == 4){
    enemyName = "pulsar";
    theLevel = "level five"; 
  }
  else if(currentLevel == 5){
    enemyName = "weekender";
    theLevel = "level six"; 
  }
  else{
    showMenu = true;
    showLevelDescription = false; 
    currentLevel = 0; 
  }
  
  if(!animateText){
    killAll();
    
    writeString(10,10,1,theLevel);
    writeString(10,18,1,enemyName); 
    writeString(10,34,1,"destroy all    life");
    
    writeString(10,80,1,"START - SPACE");
    
    if(bombPressed){
      bombPressed = false;
      animateText = true;
      animateCounter = 0;
    }
  }
  
  if(animateText){
      animateCounter++;
    
    if(animateCounter > animateMax){
      animateText = false;
      showLevelDescription = false;
      setLevel(ship.x,ship.y,currentLevel);      
      ship.health = ship.levelStartHealth;
    }
  }
}

void setLevel(int x, int y, int level){
  killAll();
  
  int enemyX;
  int enemyY;
  
  if(x < gridWidth/2){
    enemyX = int((float)gridWidth*0.75); 
  }
  else{
    enemyX = int((float)gridWidth*0.25);
  }
  
  if(y < gridHeight/2){
    enemyY = int((float)gridWidth*0.75); 
  }
  else{
    enemyY = int((float)gridWidth*0.25);
  }
  
  if(level == 0){
    block(enemyX,enemyY);   
  }
  else if(level == 1){
    beehive(enemyX,enemyY); 
  }
  else if(level == 2){
    glider(enemyX,enemyY); 
  }
  else if(level == 3){
    lwss(enemyX,enemyY); 
  }
  else if(level == 4){
    pulsar(enemyX,enemyY); 
  }
  else if(level == 5){
    weekended(enemyX,enemyY); 
  }
  else{
    showMenu = true; 
  }
   
}

void killAll(){
  for(int i = 0; i < gridWidth; i++){
   for(int j = 0; j < gridHeight; j++){
     cell[i][j].state = 0; 
   }
 } 
}

// still lifes
void block(int x, int y){
  cell[x][y].state = 1;
  cell[x+1][y+1].state = 1;
  cell[x+1][y].state = 1;
  cell[x][y+1].state = 1;
}

void beehive(int x, int y){
  cell[x-1][y].state = 1;
  cell[x][y-1].state = 1;
  cell[x][y+1].state = 1;
  cell[x+1][y-1].state = 1;
  cell[x+1][y+1].state = 1; 
  cell[x+1][y].state = 1;
}

void loaf(int x, int y){
  cell[x-1][y].state = 1;
  cell[x][y-1].state = 1;
  cell[x][y+1].state = 1;
  cell[x+1][y-1].state = 1;
  cell[x+1][y+2].state = 1;
  cell[x+2][y].state = 1;
  cell[x+2][y+1].state = 1;
}

void boat(int x, int y){
  cell[x-1][y-1].state = 1;
  cell[x-1][y].state = 1;
  cell[x][y-1].state = 1;
  cell[x][y+1].state = 1;
  cell[x+1][y].state = 1; 
}

// oscillators
void blinker(int x, int y){
  cell[x][y].state = 1;
  cell[x-1][y].state = 1;
  cell[x+1][y].state = 1; 
}

void blinkerV(int x, int y){
  cell[x][y].state = 1;
  cell[x][y-1].state = 1;
  cell[x][y+1].state = 1;  
}

void toad(int x, int y){
  blinker(x+1,y);
  blinker(x,y+1); 
}

void beacon(int x, int y){
  block(x-1,y-1);
  block(x+1,y+1); 
}

void pulsar(int x, int y){
  blinker(x-3,y-1);
  blinker(x-3,y+1);
  blinker(x-3,y-6);
  blinker(x-3,y+6);
  
  blinker(x+3,y-1);
  blinker(x+3,y+1);
  blinker(x+3,y-6);
  blinker(x+3,y+6);
  
  blinkerV(x-1,y+3);
  blinkerV(x+1,y+3);
  blinkerV(x-6,y+3);
  blinkerV(x+6,y+3);
  
  blinkerV(x-1,y-3);
  blinkerV(x+1,y-3);
  blinkerV(x-6,y-3);
  blinkerV(x+6,y-3);
   
}

//spaceships
void glider(int x, int y){
  blinker(x,y+1);
  cell[x][y-1].state = 1;
  cell[x+1][y].state = 1; 
}

void lwss(int x, int y){
  blinkerV(x-2,y+1);
  blinker(x,y+2);
  cell[x-1][y-1].state = 1;
  cell[x+2][y-1].state = 1;
  cell[x+2][y+1].state = 1; 
}

void weekended(int x, int y){
  // left arm
  blinkerV(x-6,y-4);
  blinkerV(x-6,y-2);
  blinker(x-6,y-3);
  cell[x-5][y].state = 1;
  cell[x-6][y-3].state = 0;
 
  // right arm
  blinkerV(x+7,y-4);
  blinkerV(x+7,y-2);
  blinker(x+7,y-3);
  cell[x+6][y].state = 1;
  cell[x+7][y-3].state = 0;
  
  //body
  blinker(x,y);
  blinker(x,y+1);
  cell[x+2][y].state = 1;
  cell[x+2][y+1].state = 1;
 
  blinker(x-4,y+2);
  cell[x-2][y+2].state = 1;
 
  blinker(x+4,y+2);
  cell[x+6][y+2].state = 1;
 
  //left foot
  cell[x-3][y+4].state = 1;
  cell[x-2][y+5].state = 1;
  cell[x-1][y+5].state = 1;
 
  // right foor
  cell[x+4][y+4].state = 1;
  cell[x+3][y+5].state = 1;
  cell[x+2][y+5].state = 1; 
}

class Ship{
   Cell[][] bits;
   int x,y; // track position of ship
   int direction; // 0,1,2,3 is SE,SW,NW,NE
   
   int health = 100;
   int levelStartHealth = 100;
   
   Ship(){
     bits = new Cell[gridWidth][gridHeight];
    
     for(int i = 0; i < gridWidth; i++){
       for(int j = 0; j < gridHeight; j++){
        bits[i][j] = new Cell(i,j);
        bits[i][j].state = 0;
       }
     }
    
     // make ship
     x = gridWidth/2;
     y = gridHeight/2;
     sPressed = true;
     changeDirection();
   }
   
   void updateXY(){
     if(direction == 0){
       if(bits[(x+2 + gridWidth)%gridWidth][(y+2 + gridHeight)%gridHeight].state == 1){
         x++;
         y++;
         
         if(x > gridWidth - 1){
           x = 0; 
         }
         if(y > gridHeight - 1){
           y = 0; 
         }
       }
     }
    
     if(direction == 1){
       if(bits[(x-2 + gridWidth)%gridWidth][(y+2 + gridHeight)%gridHeight].state == 1){
         x--;
         y++;
         
         if(x < 0){
           x = gridWidth -1; 
         }
         if(y > gridHeight - 1){
           y = 0; 
         }
       }
     }
    
     if(direction == 2){
       if(bits[(x-2 + gridWidth)%gridWidth][(y-2 + gridHeight)%gridHeight].state == 1){
         x--;
         y--;
         
         if(x < 0){
           x = gridWidth - 1; 
         }
         if(y < 0){
           y = gridHeight - 1; 
         }
       }
     }
    
     if(direction == 3){
       if(bits[(x+2 + gridWidth)%gridWidth][(y-2 + gridHeight)%gridHeight].state == 1){
         x++;
         y--;
         
         if(x > gridWidth -1){
           x = 0; 
         }
         if(y < 0){
           y = gridHeight - 1; 
         }
       }
     }  
   }
   
   void dropBomb(){
     int xShift = 0;
     int yShift = 0;
     
     // make bomb appear behind ship
     if(direction == 0 || direction == 3){
       xShift = -3; 
     }
     if(direction == 1 || direction == 2){
       xShift = 3; 
     }
     
     if(direction == 0 || direction == 1){
       yShift = -3; 
     }
     if(direction == 2 || direction == 3){
       yShift = 3; 
     }
     
     if(bombPressed){         
       bombPressed = false;
       
       // draw bomb on black white grid
       for(int i = -2; i < 2; i++){
         for(int j = -2; j < 2; j++){
           cell[(x+xShift+i+gridWidth)%gridWidth][(y+yShift+j+gridHeight)%gridHeight].state = 1;
         }
       }
     }
     
     // display bomb aimer
     fill(0,0,255);
     rect((((x+xShift+gridWidth)%gridWidth)*cellHeight)+(cellHeight/4),(((y+yShift+gridHeight)%gridHeight)*cellHeight)+cellHeight/4,2,2);
     
   } 
   
   
   void changeDirection(){
     
     if(aPressed || sPressed){
       
       if(aPressed){
         direction--; 
         aPressed = false;
       }
       
       else if(sPressed){
         direction++;
         sPressed = false;
       }
       
       direction = (direction+4)%4; // restrain direction between 0 and 3
       
       // reset all states
       for(int i = 0; i < gridWidth; i++){
         for(int j = 0; j < gridHeight; j++){
          bits[i][j].state = 0;
         }
       }
       
       // check which direction
       if(direction == 2){         
         bits[(x+1 + gridWidth)%gridWidth][y].state = 1;
         bits[(x + gridWidth)%gridWidth]  [(y-1 + gridHeight)%gridHeight].state = 1;
         bits[(x-1 + gridWidth)%gridWidth][(y+1 + gridHeight)%gridHeight].state = 1;
         bits[(x-1 + gridWidth)%gridWidth][y].state = 1;
         bits[(x-1 + gridWidth)%gridWidth][(y-1 + gridHeight)%gridHeight].state = 1;
       } 
       else if(direction == 3){         
         bits[(x-1 + gridWidth)%gridWidth][(y-1 + gridHeight)%gridHeight].state = 1;
         bits[(x + gridWidth)%gridWidth][(y-1 + gridHeight)%gridHeight].state = 1;
         bits[(x + gridWidth)%gridWidth][(y+1 + gridHeight)%gridHeight].state = 1;
         bits[(x+1 + gridWidth)%gridWidth][(y-1 + gridHeight)%gridHeight].state = 1;
         bits[(x+1 + gridWidth)%gridWidth][(y + gridHeight)%gridHeight].state = 1;
         
       }
       else if(direction == 1){         
         bits[(x+1 + gridWidth)%gridWidth][(y+1 + gridHeight)%gridHeight].state = 1;
         bits[(x + gridWidth)%gridWidth][(y+1 + gridHeight)%gridHeight].state = 1;
         bits[(x + gridWidth)%gridWidth][(y-1 + gridHeight)%gridHeight].state = 1;
         bits[(x-1 + gridWidth)%gridWidth][(y+1 + gridHeight)%gridHeight].state = 1;
         bits[(x-1 + gridWidth)%gridWidth][(y + gridHeight)%gridHeight].state = 1;
       }
       else if(direction == 0){
         bits[(x-1 + gridWidth)%gridWidth][y].state = 1;
         bits[x][(y+1 + gridWidth)%gridWidth].state = 1;
         bits[(x+1 + gridWidth)%gridWidth][(y-1 + gridHeight)%gridHeight].state = 1;
         bits[(x+1 + gridWidth)%gridWidth][y].state = 1;
         bits[(x+1 + gridWidth)%gridWidth][(y+1 + gridHeight)%gridHeight].state = 1;
       }
     
     }
       
   }
   
   void checkForDamage(){
     for(int i = 0; i < gridWidth; i++){
       for(int j = 0; j < gridHeight; j++){
         if(bits[i][j].getState() == 1 && cell[i][j].getState() == 1){
           health--; 
           fill(255,0,0);
           rect(i*cellHeight,j*cellHeight,cellHeight,cellHeight);
         }
       }
     }
   }
   
   void updateShip(){
     for(int i = 0; i < gridWidth; i++){
       for(int j = 0; j < gridHeight; j++){
         bits[i][j].findShipNStates();
       }
     }
     
     for(int i = 0; i < gridWidth; i++){
       for(int j = 0; j < gridHeight; j++){
         bits[i][j].updateState();
       }
     }
     
     updateXY(); // update known position of shit
     
     fill(0,255,0);
     
     // flash on low healt
     if(health < 1){
       fill(255,0,0); 
     }     
     else if(health < 8){
       if(frameCount%4 < 2){
         fill(255,0,0);
       } 
     }
     else if (health < 16){
       if(frameCount%8 < 4){
         fill(255,0,0);
       } 
     }
     else if (health < 32){
       if(frameCount%16 < 4){
         fill(255,0,0);
       } 
     }
     else if (health < 64){
       if(frameCount%32 < 4){
         fill(255,0,0);
       } 
     }
     
     for(int i = 0; i < gridWidth; i++){
       for(int j = 0; j < gridHeight; j++){
         bits[i][j].shipDisplay();
       }
     }
   }

}
void writeString(int x, int y, int thick, String theText){
  int xStart = x;
  theText = theText.toUpperCase();
  
  for(int i = 0; i < theText.length(); i++){

    // set at the beginning of line    
    if(x + ((i+1)*thick*6) > gridWidth){
      x -= gridWidth - xStart;
      y += 8*thick;
    }
    
    if(theText.charAt(i) == "'".charAt(0)){
      charApostrophy(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "-".charAt(0)){
      charDash(x + (i*thick*6), y, thick); 
    }
    
    if(theText.charAt(i) == "A".charAt(0)){
      letterA(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "B".charAt(0)){
      letterB(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "C".charAt(0)){
      letterC(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "D".charAt(0)){
      letterD(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "E".charAt(0)){
      letterE(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "F".charAt(0)){
      letterF(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "G".charAt(0)){
      letterG(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "H".charAt(0)){
      letterH(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "I".charAt(0)){
      letterI(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "J".charAt(0)){
      letterJ(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "K".charAt(0)){
      letterK(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "L".charAt(0)){
      letterL(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "M".charAt(0)){
      letterM(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "N".charAt(0)){
      letterN(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "O".charAt(0)){
      letterO(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "P".charAt(0)){
      letterP(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "Q".charAt(0)){
      letterQ(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "R".charAt(0)){
      letterR(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "S".charAt(0)){
      letterS(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "T".charAt(0)){
      letterT(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "U".charAt(0)){
      letterU(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "V".charAt(0)){
      letterV(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "W".charAt(0)){
      letterW(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "X".charAt(0)){
      letterX(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "Y".charAt(0)){
      letterY(x + (i*thick*6), y, thick);
    }
    else if(theText.charAt(i) == "Z".charAt(0)){
      letterZ(x + (i*thick*6), y, thick);
    }
  } 
   
}

// 5 X 7 letters

// -2,-3  -1,-3  0,-3  1,-3  2,-3
// -2,-2  -1,-2  0,-2  1,-2  2,-2
// -2,-1  -1,-1  0,-1  1,-1  2,-1
// -2, 0  -1, 0  0, 0  1, 0  2, 0
// -2, 1  -1, 1  0, 1  1, 1  2, 1
// -2, 2  -1, 2  0, 2  1, 2  2, 2
// -2, 3  -1, 3  0, 3  1, 3  2, 3

void letterA(int x, int y, int thick){
  drawLine(x-(2*thick),y-(2*thick),6,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),6,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),3,thick,"right");
  drawLine(x-(2*thick),y,5,thick,"right");  
}

void letterB(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),2,thick,"down");
  drawLine(x+(2*thick),y+(1*thick),2,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),3,thick,"right");
  drawLine(x-(1*thick),y-(0*thick),3,thick,"right");
  drawLine(x-(1*thick),y+(3*thick),3,thick,"right");  
}

void letterC(int x, int y, int thick){
  drawLine(x-(2*thick),y-(2*thick),5,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),4,thick,"right");
  drawLine(x-(1*thick),y+(3*thick),4,thick,"right");
}

void letterD(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),5,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),3,thick,"right");
  drawLine(x-(1*thick),y+(3*thick),3,thick,"right");
}

void letterE(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),4,thick,"right");
  drawLine(x-(1*thick),y-(0*thick),3,thick,"right");
  drawLine(x-(1*thick),y+(3*thick),4,thick,"right");
}

void letterF(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),4,thick,"right");
  drawLine(x-(1*thick),y-(0*thick),3,thick,"right");
}

void letterG(int x, int y, int thick){
  drawLine(x-(2*thick),y-(2*thick),5,thick,"down");
  drawLine(x+(2*thick),y-(0*thick),3,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),4,thick,"right");
  drawLine(x-(0*thick),y-(0*thick),3,thick,"right");
  drawLine(x-(1*thick),y+(3*thick),4,thick,"right");
}

void letterH(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x+(2*thick),y-(3*thick),7,thick,"down");
  
  drawLine(x-(2*thick),y,5,thick,"right");  
}

void letterI(int x, int y, int thick){
  drawLine(x-(0*thick),y-(3*thick),7,thick,"down");
  
  drawLine(x-(2*thick),y-(3*thick),5,thick,"right"); 
  drawLine(x-(2*thick),y+(3*thick),5,thick,"right"); 
}

void letterJ(int x, int y, int thick){
  drawLine(x+(2*thick),y-(3*thick),6,thick,"down");
  
  drawLine(x-(2*thick),y-(3*thick),5,thick,"right");
  drawLine(x-(2*thick),y+(3*thick),4,thick,"right");
}

void letterK(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x+(2*thick),y-(3*thick),2,thick,"down");
  drawLine(x+(2*thick),y+(2*thick),2,thick,"down");
  
  drawLine(x+(1*thick),y-(1*thick),1,thick,"right");
  drawLine(x-(1*thick),y-(0*thick),2,thick,"right");
  drawLine(x+(1*thick),y+(1*thick),1,thick,"right");
}

void letterL(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  
  drawLine(x-(1*thick),y+(3*thick),4,thick,"right");
}

void letterM(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x-(1*thick),y-(3*thick),1,thick,"down");
  drawLine(x-(0*thick),y-(2*thick),6,thick,"down");
  drawLine(x+(1*thick),y-(3*thick),1,thick,"down");
  drawLine(x+(2*thick),y-(3*thick),7,thick,"down"); 
}

void letterN(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x-(1*thick),y-(2*thick),1,thick,"down");
  drawLine(x-(0*thick),y-(1*thick),3,thick,"down");
  drawLine(x+(1*thick),y+(2*thick),1,thick,"down");
  drawLine(x+(2*thick),y-(3*thick),7,thick,"down"); 
}

void letterO(int x, int y, int thick){
  drawLine(x-(2*thick),y-(2*thick),5,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),5,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),3,thick,"right");
  drawLine(x-(1*thick),y+(3*thick),3,thick,"right");
}

void letterP(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),2,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),3,thick,"right");
  drawLine(x-(1*thick),y+(0*thick),3,thick,"right");
}

void letterQ(int x, int y, int thick){
  drawLine(x-(2*thick),y-(2*thick),5,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),5,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),3,thick,"right");
  drawLine(x-(0*thick),y+(1*thick),1,thick,"right");
  drawLine(x+(1*thick),y+(2*thick),1,thick,"right");
  drawLine(x-(1*thick),y+(3*thick),3,thick,"right");
}

void letterR(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),7,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),2,thick,"down");
  drawLine(x+(2*thick),y+(1*thick),3,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),3,thick,"right");
  drawLine(x-(1*thick),y+(0*thick),3,thick,"right");
}

void letterS(int x, int y, int thick){
  drawLine(x-(2*thick),y-(2*thick),2,thick,"down");
  drawLine(x+(2*thick),y+(1*thick),2,thick,"down");
  
  drawLine(x-(1*thick),y-(3*thick),4,thick,"right");
  drawLine(x-(1*thick),y-(0*thick),3,thick,"right"); 
  drawLine(x-(2*thick),y+(3*thick),4,thick,"right"); 
}

void letterT(int x, int y, int thick){
  drawLine(x-(0*thick),y-(3*thick),7,thick,"down");
  
  drawLine(x-(2*thick),y-(3*thick),5,thick,"right"); 
}

void letterU(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),6,thick,"down");
  drawLine(x+(2*thick),y-(3*thick),6,thick,"down");

  drawLine(x-(1*thick),y+(3*thick),3,thick,"right");
}

void letterV(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),4,thick,"down");
  drawLine(x-(1*thick),y+(1*thick),2,thick,"down");
  drawLine(x+(1*thick),y+(1*thick),2,thick,"down");
  drawLine(x+(2*thick),y-(3*thick),4,thick,"down");
  

  drawLine(x-(0*thick),y+(3*thick),1,thick,"right");
}

void letterW(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),6,thick,"down");
  drawLine(x-(0*thick),y+(1*thick),2,thick,"down");
  drawLine(x+(2*thick),y-(3*thick),6,thick,"down");

  drawLine(x-(1*thick),y+(3*thick),1,thick,"right");
  drawLine(x+(1*thick),y+(3*thick),1,thick,"right");
}

void letterX(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),2,thick,"down");
  drawLine(x-(2*thick),y+(2*thick),2,thick,"down");
  
  drawLine(x-(1*thick),y-(1*thick),1,thick,"down");
  drawLine(x-(1*thick),y+(1*thick),1,thick,"down");
  
  drawLine(x-(0*thick),y-(0*thick),1,thick,"down");
  
  drawLine(x+(1*thick),y-(1*thick),1,thick,"down");
  drawLine(x+(1*thick),y+(1*thick),1,thick,"down");
  
  drawLine(x+(2*thick),y-(3*thick),2,thick,"down");
  drawLine(x+(2*thick),y+(2*thick),2,thick,"down");
}

void letterY(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),2,thick,"down");
  
  drawLine(x-(1*thick),y-(1*thick),1,thick,"down");
  
  drawLine(x-(0*thick),y-(0*thick),4,thick,"down");
  
  drawLine(x+(1*thick),y-(1*thick),1,thick,"down");
  
  drawLine(x+(2*thick),y-(3*thick),2,thick,"down");
}

void letterZ(int x, int y, int thick){
  drawLine(x-(2*thick),y-(3*thick),5,thick,"right");
  drawLine(x-(2*thick),y+(2*thick),1,thick,"down");
  drawLine(x-(1*thick),y+(1*thick),1,thick,"down");
  drawLine(x-(0*thick),y-(0*thick),1,thick,"down");
  drawLine(x+(1*thick),y-(1*thick),1,thick,"down");
  drawLine(x+(2*thick),y-(2*thick),1,thick,"down");
  drawLine(x-(2*thick),y+(3*thick),5,thick,"right"); 
}

void charApostrophy(int x, int y, int thick){
  drawLine(x-(0*thick),y-(3*thick),3,thick,"down"); 
}

void charDash(int x, int y, int thick){
  drawLine(x-(2*thick),y-(0*thick),5,thick,"right"); 
}


void drawLine(int sX, int sY, int l, int thick, String downOrRight){
  int hTB; // half thick before
  int hTA; // half thick after
  int tS;  // shift for thickness
  int fE;  // for even
  
  if(thick%2 == 0){
    //even
    hTB = -(thick/2);
    hTA = thick/2;
    tS = -1+(thick/2);
    fE = 1;
  }else{
    //odd
    hTB = -(thick-1)/2;
    hTA = (thick-1)/2;
    tS = (thick-1)/2;
    fE = 0;
  }
  
  
  if(downOrRight.equals("down")){  
    for(int i = sY-tS; i < sY-tS+(l*thick)-fE; i++){
      for(int j = hTB; j <= hTA - fE; j++){
         cell[sX+j][i].state = 1;        
      }
    }
  }
  else if(downOrRight.equals("right")){
    for(int i = sX-tS; i < sX-tS+(l*thick)-fE; i++){
      for(int j = hTB; j <= hTA - fE; j++){
         cell[i][sY+j].state = 1;
        
      }
    }
  } 
  
}


