
/*
Mahjong
 created by Peter Lager
 
 This game makes use of the Shapes3D (V1.8.0) library.
 
 It is possible to create your own Mahjong games and add
 to this game with having to program.
 
 Full instructions can be found on the website with this 
 example.
 
 www.lagers.org.uk
 */

import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;


// Game state descriptors 
final int GAMESELECT = 101;
final int INSTRUCTIONS = 102;
final int GAMEON = 103;
final int HINT = 104;
final int WIN = 105;

// States available during game play
// Do not change the next 2 values
final int PICK1 = 0;
final int PICK2 = 1;

// Change angle smoothing factors
final float ANG_SMOOTH = 0.25f;
final float DIST_SMOOTH = 0.8f;

// Game status message
PGraphics statusImg;
String statusMessage = "";

// Tile selectors
Shape3D[] selected = new Shape3D[2];
Shape3D isOver, lastOver;

// Information images
PImage selCtrls;
PImage gameCtrls;
PImage gameWin;
boolean showGameCtrls = true;

// Camera to view the board
OrbitCam ocam;
float angLat = 0;
float angLong = 0;
float zoom = 0;

// Game and play status variables
int gState, pState;
int nbrTilesLeft;

// Variables for show pairs option
int hintPairNbr = 0;
float hintLeftTime = 0;
float hintShowTime = 2.5f;
int pairsLeft;
boolean mouseMoved = false;

// Game timer
StopWatch swatch;

// Game selection variables
Box gameSelector;
String[] gameFolderName;
PImage[] gameIconImage;
Board[] game;
int boardNo = 0;
int angle = 0;
float gameCamDistance;

// Required for Processing 1.0.9
PFont font;

void setup() {
  size(600, 600, P3D);
  cursor(CROSS);
  // load info images
  selCtrls = Textures.loadImage(this, "mj_select.png");
  gameCtrls = Textures.loadImage(this, "mj_ctrls.png");
  gameWin = Textures.loadImage(this, "mj_win.png");
  // Create camera and timer
  ocam = new OrbitCam(this, new PVector(), 120);
  swatch = new StopWatch();		
  // Graphics object to display game status - used to
  // overcome poor text output in P3D
  statusImg = createGraphics(width,30,JAVA2D);
  // Need to create a font for Processing 1.0.9
  font = createFont("Arial", 16); // for 1.0.9
  // Start with game select mode
  createGameSelector();
  gState = GAMESELECT;
}

/**
 * Create the game selector and load the game icon
 * images for the selector
 * 
 */
void createGameSelector() {
  gameSelector = new Box(this, 210,210,30);
  gameSelector.pickable(false);
  gameSelector.fill(color(255));
  String[] rawdata = loadStrings("mj_game_list.txt");
  ArrayList temp = new ArrayList();

  for(int i = 0; i < rawdata.length; i++) {
    rawdata[i] = rawdata[i].trim();
    if(rawdata[i].length() > 0 && rawdata[i].charAt(0) != '#') {
      temp.add(rawdata[i]);
    }
  }
  rawdata = (String[]) temp.toArray(new String[temp.size()]);
  gameFolderName = new String[rawdata.length];
  gameIconImage = new PImage[rawdata.length];
  game = new Board[rawdata.length];
  String[] stringValue;

  for(int i = 0; i < rawdata.length; i++) {
    stringValue = splitTokens(rawdata[i], " ");
    gameFolderName[i] = stringValue[0];
    gameIconImage[i] = Textures.loadImage(this, gameFolderName[i]+"/"+stringValue[1]);
    game[i] = null;
  }
  PImage tempImg = Textures.loadImage(this, "mj_selback.png");
  gameSelector.setTexture(tempImg);
  gameSelector.setTexture(gameIconImage[0], Box.BACK);
  gameSelector.setTexture(gameIconImage[0], Box.FRONT);
  gameSelector.drawMode(Shape3D.TEXTURE);
  gameSelector.tag = "Game selector";
}

/**
 * Initialise the camera view for a new game
 */
void initCamera() {
  ocam.setRangeDist(0.9f * gameCamDistance, 2 * gameCamDistance);
  ocam.setDistance(gameCamDistance);
  ocam.setRangeLatAngle(radians(5), radians(80), OrbitCam.LIMIT);
  ocam.setRangeLongAngle(0, TWO_PI, OrbitCam.WRAP);
  ocam.setAngles(radians(42), radians(90));
  ocam.camera();
}

void mouseMoved() {
  mouseMoved = true;
}

void mouseDragged() {
  switch(gState) {
  case HINT:
  case GAMEON:
    updateCamera();
    break;
  }
}

void mouseReleased() {
  switch(gState) {
  case HINT:
  case GAMEON:
    angLat = angLong = 0;
    zoom = 0;
    break;
  }
}

void mouseClicked() {
  switch(gState) {
  case GAMEON:
    if(mouseButton == LEFT)
      selectTile();
    break;
  }
}

/**
 * Only called when the mouse is clicked
 */
void selectTile() {
  if(isOver != null && game[boardNo].isFree(isOver)) {
    selected[pState] = isOver;
    isOver = null;
    game[boardNo].selectTile(selected[pState]);
    switch(pState) {
    case PICK1:
      pState = PICK2;
      break;
    case PICK2:
      if(selected[0] != selected[1] && selected[0].tagNo == selected[1].tagNo) {
        // A pair has been selected so remove
        game[boardNo].removePair(selected);
        game[boardNo].deselectTile(selected[0]);
        game[boardNo].deselectTile(selected[1]);
        selected[0] = selected[1] = null;
        nbrTilesLeft -= 2;
        statusMessage = "";
      }
      else {
        statusMessage = "No Match";
        game[boardNo].deselectTile(selected[0]);
        game[boardNo].deselectTile(selected[1]);
        selected[0] = selected[1] = null;
      }
      pState = PICK1;
    }
  }
  else { 
    // clicked off tiles cancel move so deselect tiles
    // and go back to initial pick
    game[boardNo].deselectTile(selected[0]);
    game[boardNo].deselectTile(selected[1]);
    selected[0] = selected[1] = null;
    pState = PICK1;
  }
}

/**
 * Highlight if over a free tile.
 * isOver keeps track of the tile
 */
void highlightTileIfFree() {
  // Only de-select if not picked
  if(isOver != selected[0])
    game[boardNo].deselectTile(isOver);	

  ocam.camera();
  isOver = Shape3D.pickShapeB(this, mouseX, mouseY);
  // If over a free tile highlight it.
  if(isOver != null) {
    if(game[boardNo].isFree(isOver))
      game[boardNo].selectTile(isOver);
    else  // not free
    game[boardNo].deselectTile(isOver);
  }
}

void updateCamera() {
  // Update camera angle and distance applying simple smoothing
  float lapTime = swatch.lapTime();
  if(mouseButton == LEFT) {
    angLong = mouseX - pmouseX;
    angLat = -(mouseY - pmouseY);
    angLat *= ANG_SMOOTH;
    angLat = (abs(angLat) < 0.05) ? 0 : angLat;
    angLong *= ANG_SMOOTH;
    angLong = (abs(angLong) < 0.05) ? 0 : angLong;
    ocam.changeAngles(0.5f * angLat * lapTime, 0.8f * angLong * lapTime);
  }
  else if(mouseButton == RIGHT) {
    zoom = mouseY - pmouseY;
    zoom *= DIST_SMOOTH;
    zoom = (abs(zoom) < 0.05) ? 0 : zoom;
    ocam.changeDistance(10 * zoom * lapTime);
  }
}

void undoMove() {
  if(game[boardNo].undo())
    nbrTilesLeft += 2;		
  clearSelections();
}

/**
 * Show oneof the available pairs
 */
public void showHint() {
  if(game[boardNo].showPair(hintPairNbr)) {
    statusMessage = "PAIR "+(hintPairNbr+1)+" of "+pairsLeft;
    hintLeftTime -= swatch.lapTime();
    if(hintLeftTime < 0) {
      hintPairNbr++;
      hintLeftTime = hintShowTime;
    }
  }
  else {
    gState = GAMEON;
    statusMessage = "";
    clearSelections();
  }
}

void clearSelections() {
  for(int i = 0; i< 2; i++) {
    game[boardNo].deselectTile(selected[i]);	
    selected[i] = null;
  }		
  pState = PICK1;
}

void draw() {
  swatch.update();
  switch(gState) {
  case GAMESELECT:
    drawGameStatus();
    drawGameSelector();
    break;
  case INSTRUCTIONS:
    drawInstructions();
    break;
  case HINT:
    showHint();
    drawGame();
    drawGameStatus();
    break;
  case GAMEON:
    if(mouseMoved) {
      highlightTileIfFree();
      mouseMoved = false;
    }
    drawGame();
    drawGameStatus();
    if(nbrTilesLeft == 0) {
      gState = WIN;
      initCamera();
    }
    break;
  case WIN:
    drawWin();
    break;
  }
  //		println(frameRate);
}

void drawInstructions() {
  background(0);
  pushMatrix();
  camera();
  image(gameCtrls, (width - gameCtrls.width)/2, (height - gameCtrls.height)/2, gameCtrls.width, gameCtrls.height);
  popMatrix();
}

void drawWin() {
  background(0);
  pushMatrix();
  camera();
  image(gameWin, (width - gameWin.width)/2, (height - gameWin.height)/2, gameWin.width, gameWin.height);
  popMatrix();
}

void drawGameSelector() {
  // Display instructions
  pushMatrix();
  background(0);
  noLights();
  camera();
  fill(255,0,0);
  noStroke();
  image(selCtrls, 0,0);
  popMatrix();
  // Display selector
  pushMatrix();
  lights();
  camera(0,0,300,0,0,0,0,1,0);
  gameSelector.draw();
  popMatrix();
}

/**
 * Display the keyboard and mouse controls for the game.
 * Note they will only be displayed just before the first game.
 */
void drawGameControls() {
  pushMatrix();
  background(0);
  noLights();
  camera();
  fill(255,0,0);
  noStroke();
  image(selCtrls, 0,0);
  popMatrix();
  pushMatrix();
  lights();
  camera(0,0,0,0,0,-300,0,1,0);
  gameSelector.draw();
  popMatrix();
}

/**
 * Draw the game in play
 */
void drawGame() {
  pushMatrix();		
  ocam.camera();
  background(64);
  ambientLight(60,60,60);
  directionalLight(120,120,120,1,4,-3);
  directionalLight(70,70,70,-1,4,3);
  game[boardNo].draw();
  noLights();
  popMatrix();
}

/**
 * Display game status information
 */
void drawGameStatus() {
  statusImg.beginDraw();
  statusImg.textFont(font, 16);
  if(gState == HINT) {
    statusImg.background(220,0,0);
    statusImg.fill(255);
  }
  else {
    if(pState == PICK1) {
      statusImg.background(0,220,0);
      statusImg.fill(0);
    }
    else {
      statusImg.background(0,0,220);
      statusImg.fill(255);
    }
  }
  statusImg.textAlign(LEFT);
  textFont(createFont("Arial", 16), 16);
  statusImg.text("Tiles left " + nbrTilesLeft, 10, 8, 100, 20);
  statusImg.textAlign(CENTER);
  statusImg.text(statusMessage, 150,8, 200, 20);
  int currTime = (int) swatch.currTime();
  String time = "Time  " + currTime / 60 +"m "+ currTime % 60 +"s";
  statusImg.textAlign(RIGHT);
  statusImg.text(time, width - 180, 8, 140, 20);
  statusImg.endDraw();

  pushMatrix();
  camera();
  noLights();
  image(statusImg,0,0);
  popMatrix();
}


void keyReleased() {
  switch(gState) {
  case GAMESELECT:
    keyReleasedGAMESELECT();
    break;
  case INSTRUCTIONS:
    keyReleasedINSTRUCTIONS();
    break;
  case HINT:
    break;
  case GAMEON:
    keyReleasedGAMEON();
    break;
  case WIN:
    gState = GAMESELECT;
    break;
  }
}

void keyReleasedINSTRUCTIONS() {
  if(key == ' ') {
    gState = GAMEON;
    showGameCtrls = false;
    initCamera();
    swatch.reset();
  }
}

void keyReleasedGAMESELECT() {
  if(key == CODED && (keyCode == LEFT || keyCode == RIGHT)) {
    if(keyCode == LEFT) {
      angle -= 180;
      boardNo--;
    }
    else {
      angle += 180;
      boardNo++;
    }
    gameSelector.rotateTo(0, radians(angle), 0, 1,0);
    boardNo = (boardNo + game.length)%game.length;
    int face = abs(angle)%360;
    switch(face) {
    case 0:
      gameSelector.setTexture(gameIconImage[boardNo], Box.FRONT);
      break;
    case 180:
      gameSelector.setTexture(gameIconImage[boardNo], Box.BACK);				
      break;
    default:
      println("INVALID ROTATION "+ angle);
    }
  }
  else if(key == ENTER || key == RETURN) {
    // If the game has not already been loaded then do so
    if(game[boardNo] == null)
      game[boardNo] = MahjongLoader.createGame(this, gameFolderName[boardNo]);
    // Initialise the game
    game[boardNo].placeTiles();
    nbrTilesLeft = game[boardNo].getNbrOfTiles();
    gameCamDistance = game[boardNo].getCamMinDist();
    pState = PICK1;
    clearSelections();		
    statusMessage = "";
    if(showGameCtrls)
      gState = INSTRUCTIONS;
    else {
      gState = GAMEON;
      initCamera();
      swatch.reset();
    }
  }
}

void keyReleasedGAMEON() {
  if(key == 'q' || key == 'Q') {
    game[boardNo].removeFromPlay();
    gState = GAMESELECT;
  }
  if(key == 'u' || key == 'U') {
    undoMove();
  }
  if(key == 'p' || key == 'P') {
    int pairs = game[boardNo].findPairs();
    if(pairs > 0)
      statusMessage = ""+ pairs + " pairs available";
    else
      statusMessage = "No pairs left!!!";
    clearSelections();
  }
  if(key == 's' || key == 'S' && gState != HINT) {
    pairsLeft = game[boardNo].findPairs();
    if(pairsLeft > 0) {
      gState = HINT;
      hintPairNbr = 0;
      // Cancel any selections
      clearSelections();
      game[boardNo].deselectTile(isOver);	
      hintLeftTime = hintShowTime;
    }
    else {
      statusMessage = "No pairs to show!!!";
    }
  }
}

