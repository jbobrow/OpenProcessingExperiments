
GameManager gManage;

void setup(){
  size(600, 600);
  frameRate(32); 
  smooth();
  
  gManage = new GameManager();
}

void draw(){
  gManage.run();
}

void mousePressed() {
  gManage.clickEvent();
}
class Button {
  float posX;
  float posY;
  float messageWidth;
  float messageHeight;
  String message;
  PFont font;
  
  Button(float newX, float newY, String newMessage, PFont newFont) {
    message = newMessage;  
    posX = newX;
    posY = newY;
    font = newFont;
    textFont(font,32);
    messageWidth = textWidth(message);
    messageHeight = 32;
  }
  
  void display() {
    textFont(font,32);
    if(mouseOver()) {
      fill(#18cae6);
    } else {
      fill(#34608d);
    }
    textAlign(CENTER);
    text(message, posX, posY);
  }
  
  boolean mouseOver() {
    if(mouseX > posX - (messageWidth / 2) && mouseX < posX + (messageWidth / 2) && mouseY < posY && mouseY > posY - messageHeight) {
      return true;
    }
    return false;
  }
  
  boolean clicked() {
    if(mousePressed && mouseOver()) {
      return true;
    }
    return false;
  }
}
class GameManager {
  GameState currentState;

  // Setup game states
  MainMenu mainMenu;
  SettingsMenu settingsMenu;
  RunGame runGame;
  
  GameManager() {
    // Init game states
    mainMenu = new MainMenu(this);
    settingsMenu = new SettingsMenu(this);
    runGame = new RunGame(this);
    setState(mainMenu);
  }
  
  void run() {
    currentState.update();
    currentState.display();
  }
  
  void setState(GameState newState) {
    currentState = newState;
  }
  
  void clickEvent() { // Called when mousePressed event occurs
    currentState.clickEvent();
  }
}
class GameState {
  GameManager thisGM;
  
  GameState(GameManager newGM) {
    thisGM = newGM;
  }
  
  void update() {
    // Update 
  }
    
  void display() {
    // Display Stuff
  }
  
  void clickEvent() {
    // default click event
    print("Click press not handled");
  }
  
  void drawGrid() {
    for(int i=20; i < width; i += 20) {
      stroke(255, 50);
      line(i,0,i,height);
    }
    for(int i=20; i < height; i += 20) {
      stroke(255, 50);
      line(0,i,width,i);
    }
  }
}
  
class MainMenu extends GameState {
  PFont font;
  Button startButton;
  Button settingsButton;
  Button quitButton;

  MainMenu(GameManager newGM) {
    super(newGM);
    font = loadFont("TRN-48.vlw");
    startButton = new Button(width/2, height/2+64, "Start", font);
    settingsButton = new Button( width/2, height/2+98, "Settings", font);
    quitButton = new Button( width/2, height/2+132, "Quit", font);
  }
  
  void update() {
    // Update event
  }
  
  void clickEvent() {
    if(startButton.clicked()) {
      // Reset game and set to state
      thisGM.runGame.reset();
      thisGM.setState(thisGM.runGame);
    }
    if(settingsButton.clicked()) {
      thisGM.setState(thisGM.settingsMenu);
    }
    if(quitButton.clicked()) {
      exit();
    }
  }
    
  void display() {
    background(#1e3845);
    drawGrid();
    fill(#18cae6);
    textAlign(CENTER);
    textFont(font,42);
    text("Light Cycle Paranoids", width/2, height/2);
    startButton.display();
    settingsButton.display();
    quitButton.display();
  }
}
//this is the class for the player
class Player {
  float xLoc = 200;
  float yLoc = 200;
  float speed = 4;
  float speedX = 0;
  float speedY = 0;
  int ribbonColor = #ffffff;
  int playerColor = #ffffff;
  boolean dirRight = true;
  String name = "Undefined Player";
  
  Ribbon[] ribbons = {}; //ribbon array

  Player(float newX, float newY) {
    // TODO This is all done in reset 
    xLoc = newX;
    yLoc = newY;
        
    Ribbon newRibbon = new Ribbon(xLoc, yLoc, ribbonColor);
    ribbons = (Ribbon[]) append(ribbons, newRibbon); //updating array at start with newribbon value
  }
  
  void setLoc(float newX, float newY) {
    xLoc = newX;
    yLoc = newY;
  }
  
  void update() {
      xLoc += speedX;
      yLoc += speedY;
      
      int currentRibbon = ribbons.length - 1; 
      ribbons[currentRibbon].update(xLoc, yLoc); //updating
  }
  
  void setSpeed(float newX, float newY) {
    speedX = newX;
    speedY = newY;
  }
  
  void setName(String newName) {
    name = newName;
  }
  
  void drawPlayer() {
    // Draw players ribbons
    for (int i = 0; i < ribbons.length; i++ ) {
      ribbons[i].display();    // Draw ribbons
    }
    
    // Draw player
    fill(playerColor);
    noStroke();
    
    if (speedX != 0) {
      beginShape ();
      vertex (xLoc-10, yLoc-5);
      vertex (xLoc-5, yLoc-5);
      vertex (xLoc-5, yLoc-2);
      vertex (xLoc-4, yLoc-2);
      vertex (xLoc-4, yLoc-3);
      vertex (xLoc+4, yLoc-3);
      vertex (xLoc+4, yLoc-2);
      vertex (xLoc+5, yLoc-2);
      vertex (xLoc+5, yLoc-5);
      vertex (xLoc+10, yLoc-5);
      vertex (xLoc+10, yLoc+5);
      vertex (xLoc+5, yLoc+5);
      vertex (xLoc+5, yLoc+2);
      vertex (xLoc+4, yLoc+2);
      vertex (xLoc+4, yLoc+3);
      vertex (xLoc-4, yLoc+3);
      vertex (xLoc-4, yLoc+2);
      vertex (xLoc-5, yLoc+2);
      vertex (xLoc-5, yLoc+5);
      vertex (xLoc-10, yLoc+5);
      endShape ();
      
      fill(0);
      beginShape();
      vertex (xLoc-7, yLoc-1);
      vertex (xLoc+7, yLoc-1);
      vertex (xLoc+7, yLoc+1);
      vertex (xLoc-7, yLoc+1);
      endShape();
    } 
    else {
      beginShape ();
      vertex (xLoc-5, yLoc-10);
      vertex (xLoc-5, yLoc-5);
      vertex (xLoc-2, yLoc-5);
      vertex (xLoc-2, yLoc-4);
      vertex (xLoc-3, yLoc-4);
      vertex (xLoc-3, yLoc+4);
      vertex (xLoc-2, yLoc+4);
      vertex (xLoc-2, yLoc+5);
      vertex (xLoc-5, yLoc+5);
      vertex (xLoc-5, yLoc+10);
      vertex (xLoc+5, yLoc+10);
      vertex (xLoc+5, yLoc+5);
      vertex (xLoc+2, yLoc+4);
      vertex (xLoc+2, yLoc+4);
      vertex (xLoc+3, yLoc+4);
      vertex (xLoc+3, yLoc-4);
      vertex (xLoc+2, yLoc-2);
      vertex (xLoc+2, yLoc-5);
      vertex (xLoc+5, yLoc-5);
      vertex (xLoc+5, yLoc-10);
      endShape ();
      
      fill(0);
      beginShape();
      vertex (xLoc-1, yLoc-7);
      vertex (xLoc+1, yLoc-7);
      vertex (xLoc+1, yLoc+7);
      vertex (xLoc-1, yLoc+7);
      endShape();
    }
    
  }
  
  void startRibbon() {
    Ribbon newRibbon = new Ribbon(xLoc, yLoc, ribbonColor);
    newRibbon.update(xLoc, yLoc); // Set initial ribbon end values
    ribbons = (Ribbon[]) append(ribbons, newRibbon);
  }
  
  void reset(float newX, float newY) {
    setLoc(newX,newY);
    setSpeed(speed,0);

    ribbons = new Ribbon[0]; // reset to array of ribbons with 0 elements
    Ribbon newRibbon = new Ribbon(xLoc, yLoc, ribbonColor); 
    ribbons = (Ribbon[]) append(ribbons, newRibbon); //updating array at start with newribbon value
  }
  
  float[] getNose() { // Return front x and y of craft
    float frontX = xLoc;
    float frontY = yLoc;
    
    if(speedX > 0) { // Player is going right
      frontX += 10;
    } else if(speedX < 0) { // Player is going left
      frontX -= 10;
    } else if(speedY > 0) { // Player is going down
      frontY += 10;
    } else if(speedY < 0) { // Player is goin up
      frontY -= 10;
    }
    
    float[] returnArr = {frontX,frontY};
    
    return returnArr;
  }
  
  boolean checkCollision(Ribbon[] ribbonArr) {
    // Get nose of player
    float[] noseArr = getNose();
    float noseX = noseArr[0];
    float noseY = noseArr[1];
    
    for (int i = 0; i < ribbonArr.length; i++ ) {
      // Check for intersection between the line between the center loc and nose, and each ribbon
      if(linesIntersect(xLoc,yLoc,noseX,noseY,ribbonArr[i].startX,ribbonArr[i].startY,ribbonArr[i].endX,ribbonArr[i].endY)) {
        return true;
      }
    }
    
    return false;
  }
  
  boolean linesIntersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  
    float a1, a2, b1, b2, c1, c2, r1, r2 , r3, r4, d;
  
    a1 = y2 - y1;
    a2 = y4 - y3;
    b1 = x1 - x2;
    b2 = x3 - x4;
    c1 = (x2 * y1) - (x1 * y2);
    c2 = (x4 * y3) - (x3 * y4);
    r1 = (a2 * x1) + (b2 * y1) + c2;
    r2 = (a2 * x2) + (b2 * y2) + c2;
    r3 = ((a1 * x3) + (b1 * y3) + c1);
    r4 = ((a1 * x4) + (b1 * y4) + c1);
    d = (a1 * b2) - (a2 * b1);
  
    if(
      ((r3 != 0) && (r4 != 0) && ( r3 * r4) >= 0) ||
      ((r1 != 0) && (r2 != 0) && (( r1 * r2) >= 0)) ||
      (d == 0)
      ){
      return false;
    } else {
      return true;
    }
  }
  
}

//designed and coded by Michael Spieler, mentored by Eric Grotzke 
//this is the class for the ribbon behind the cycle
class Ribbon {
  float startX;
  float startY;
  float endX;
  float endY;
  int ribbonColor;

  Ribbon(float newX, float newY, int newColor) {
    startX = newX;
    startY = newY;
    ribbonColor = newColor;
  }

  void update(float newX, float newY) {
    endX = newX;
    endY = newY;
  }

  void display() {
    stroke(ribbonColor); //line color
    line(startX, startY, endX, endY);
  }
}

class RunGame extends GameState {
  Player[] players = {}; //player array
  Player playerOne;
  Player playerTwo;
  boolean gameLoop = true;
  
  RunGame(GameManager newGM) {
    super(newGM);
    playerOne = new Player(200, 200);
    playerOne.setName("CLU");
    playerOne.playerColor = #e45c00;
    playerOne.ribbonColor = #ff7518;
    playerTwo = new Player(400, 200);
    playerTwo.setName("Tron");
    playerTwo.playerColor = #13a1b8;
    playerTwo.ribbonColor = #18cae6;
    players = (Player[]) append(players, playerOne);
    players = (Player[]) append(players, playerTwo);
  }
  
  void update() {
    // Main Key Logic
    if (keyPressed && key == 'q') {  //quit key
      thisGM.setState(thisGM.mainMenu);
    }
    if (keyPressed && key == 'r') {     //reset key
      reset();
    }
      
   if(gameLoop) {
      // Player key logic
      if (keyPressed && (key == CODED)) { // If it's a coded key
        // Check key and ensure player is not already moving in the same coord dir (so you can't go backwards over your own line
        if (keyCode == LEFT && playerOne.speedX == 0) {            // If it's the left arrow
          playerOne.setSpeed(-playerOne.speed,0);
          playerOne.startRibbon();
        } 
        else if (keyCode == RIGHT  && playerOne.speedX == 0) {      // If it's the right arrow
          playerOne.setSpeed(playerOne.speed,0);
          playerOne.startRibbon();
        }
        else if (keyCode == UP  && playerOne.speedY == 0) {     //If it's the up arrow
          playerOne.setSpeed(0,-playerOne.speed);
          playerOne.startRibbon();
        }
        else if (keyCode == DOWN  && playerOne.speedY == 0) {   //if it's the down arrow
          playerOne.setSpeed(0,playerOne.speed);
          playerOne.startRibbon();
        }
      }
      
      // Player two movements
      if (keyPressed) {
        if(key == 'a' && playerTwo.speedX == 0) {
          playerTwo.setSpeed(-playerTwo.speed,0);
          playerTwo.startRibbon();
        } else if(key == 'd' && playerTwo.speedX == 0) {
          playerTwo.setSpeed(playerTwo.speed,0);
          playerTwo.startRibbon();
        } else if(key == 'w' && playerTwo.speedY == 0) {
          playerTwo.setSpeed(0,-playerTwo.speed);
          playerTwo.startRibbon();
        } else if(key == 's' && playerTwo.speedY == 0) {
          playerTwo.setSpeed(0,playerTwo.speed);
          playerTwo.startRibbon();
        }
      }
      
      // Update players, check their coords against boundaries, then check against ribbons
      for(int i = 0; i < players.length; i++) {
        players[i].update();
        
        float[] checkCoords = players[i].getNose();
        
        if(checkCoords[0] <= 0 || checkCoords[0] >= width || checkCoords[1] <= 0 || checkCoords[1] >= height) {
          gameOver(players[i]);
        }
        
        for(int j = 0; j < players.length; j++) {
          if(players[i].checkCollision(players[j].ribbons)) {
            gameOver(players[i]);
          }
        }
        
      } // End looping through players
      
    }  // End if gameLoop
    
  } // End update()
    
  void display() {
    smooth ();
    background (#1e3845);
    drawGrid();
    playerOne.drawPlayer();
    playerTwo.drawPlayer();
  }
  
  void reset() {
    gameLoop = true;
    playerOne.reset(200,200);
    playerTwo.reset(400,200);
    background (#1e3845); // redraw background
  }
  
  void gameOver(Player loser) { // Called when a player dies
    gameLoop = false;
    print("GAME OVER\n");
    print(loser.name + " has lost The Game. END OF LINE.\n");
  }
}
  
class SettingsMenu extends GameState {
  PFont font;
  Button backButton;

  SettingsMenu(GameManager newGM) {
    super(newGM);
    font = loadFont("TRN-48.vlw");
    backButton = new Button( width/2,height/2+98, "Back", font);
  }
  
  void update() {
    // Update event
  }
    
  void display() {
    background(#1e3845);
    drawGrid();
    fill(#18cae6);
    textAlign(CENTER);
    textFont(font,42);
    text("Light Cycle Paranoids", width/2, height/2);
    backButton.display();
  }
  
  void clickEvent() {
    if(backButton.clicked()) {
      thisGM.currentState = thisGM.mainMenu;
    }
  }
}


