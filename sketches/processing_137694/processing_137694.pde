
/*
 
 The Game :)
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 !!!!!!REMEMBER TO REMOVE HACK KEYS BEFORE RELEASE!!!!!!!
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
 
 
 
 
 *       ___           _          _   _      _           
 *      /   \   _  _  | |_   ___ | | (_)  __| |  ___   _ _ 
 *     |  0  | | || | |  _| (_-< | | | | / _` | / -_) | '_|
 *      \___/   \___|  \__| /__/ |_| |_| \__,_| \___| |_|
 *                 Outslider  Creative Design
 *                 paweltokarz.chem@gmail.com 
 *

*/


Mode  mode;
Level level;
Score score;
Gui   welcomeGui; //TO DO
Gui   mainMenuGui;
Gui   playLevelUpGui;
Gui   playOneLevelGui;
Gui   levelChoseGui;
DataStorage storage;

// units for easy on-screen positioning
// general unit is ex!
// ey should be used only if really needed!
float ex;
float ey;

boolean debug = true;
boolean debug = false;

void setup() {
  size(400,600);

//  cool for ANDROID:
//  size(displayWidth, displayHeight);


  // Android restarts sketch when the screen is rotated.
  // To disable such behavior we have to fix it to one orientation
  // Compatibility issue:
  // JS doesn't have a placeholder for PORTRAIT, therefore we have to put it in try{}
  // we can't use the ReferenceError class for error throwed as it doesn't exist in the Java mode.
  try { 
    orientation(PORTRAIT);
  } 
  catch(Throwable e) { 
    dbg("orientation(PORTRAIT) is not supported here...");
  }
  ex = width/100.0;
  ey = height/100.0;
  storage = new DataStorage();
  mode  = new Mode();
  level = new Level();
//  level.makeLevel(level.levelNumber, 4);
  score     = new Score();
  initGuis();
  //  That would be cool, but might require GUI updates:
  //  frame.setResizable(true);
}

void draw() {
  switch( mode.supermode ) {
  case WELCOME:
    welcome();
    break;
  case MENU:
    menu();
    break;
  case LEVEL_CHOSE:
    levelChose();
    break;
  case PLAY:
    play(); //in this case play() means doTheWholeF*ckinWorkPlease(), but I can't use "*" in function name
    break;
  }
}

void mousePressed() {
  switch( mode.supermode ) {
  case WELCOME:
    break;
  case MENU:
    break;
  case PLAY:
    level  .onClick();
    break;
  }
}

void mouseMoved() {
  switch( mode.supermode ) {
  case WELCOME:
    break;
  case MENU:
    break;
  case PLAY:
    break;
  }
}

//some hacks to debug.
void keyPressed() {
  switch( key ) {
  case 'q' :
    exit();
    break;
  case '=' :
    level.myMode = level.DONE_LEVEL;
    break;
  }
}


//  highscores save and general storage module

//  frame.setResizable(true);
//  which requires gui sizes updates
class Bulb {

  float x;
  float y;
  float size;
  boolean state;
  ArrayList<Bulb> neighs;

  Bulb( float x, float y ) {
    this.x       = x;
    this.y       = y;
    this.state   = true;
    this.neighs  = new ArrayList();
    this.size    = 4*ex;
  }

  void connectToRandom(ArrayList<Bulb> bulbs) {
    if (neighs.size() < 2) {
      int r1 = int(random(bulbs.size()));
      int r2 = int(random(bulbs.size()));
      //below loop avoids duplication: r2=r1, which is where we can start from;
      while (r2==r1) {
        r2 = int(random(bulbs.size()));
      }
      Bulb n1 = bulbs.get(r1);
      Bulb n2 = bulbs.get(r2);
      boolean canAdd1 = true;
      boolean canAdd2 = true;
      for (int i=0; i<neighs.size(); i++) {
        if (neighs.get(i)==n1) canAdd1 = false;
        if (neighs.get(i)==n2) canAdd2 = false;
      }
      if (canAdd1) {
        neighs.add(n1);
        n1.neighs.add(this);
      }
      if (canAdd2) {
        neighs.add(n2);
        n2.neighs.add(this);
      }
    }
  }

  boolean checkClicked() {
    if (dist(mouseX, mouseY, x, y) < size) {
      flipMeAndFriends();
      score.moves++;
      return true;
    }
    return false;
  }

  void flipMeAndFriends() {
    state = !state;
    level.halos.add(new Halo(x, y));
    for (int i=0; i<neighs.size(); i++) {
      neighs.get(i).state = !neighs.get(i).state;
      level.halos.add(new Halo(neighs.get(i).x, neighs.get(i).y));
    }
  }

  void draw() {
    pushStyle();
    ellipseMode(CENTER);
    if (state) {
      fill(0, 255, 0);
      ellipse(x, y, size, size);
    }
    if (!state) {
      fill(255);
      ellipse(x, y, size, size);
    }
    stroke(255);
    for (int i=0; i<neighs.size(); i++) {
      line(x, y, neighs.get(i).x, neighs.get(i).y);
    }
    popStyle();
  }
}

class Halo {
  float x;
  float y;
  int startTime;
  float r;
  float rMax = 30*ex;

  Halo(float x, float y) {
    this.x = x;
    this.y = y;
    startTime=millis();
    r=0;
  }

  void draw() {
    pushStyle();
    r=0.2*ex*(millis()-startTime);
    noFill();
    stroke( 0, 255, 0, 255*(rMax-r)/rMax );
    strokeWeight(2);
    ellipseMode(CENTER);
    ellipse(x, y, r, r);
    strokeWeight(1);
    popStyle();
    if(r>rMax) {
      level.halos.remove(this);
    }
  }
}

class Level {

  final int INIT_LEVEL = 20;
  final int PLAY_LEVEL = 21;
  final int DONE_LEVEL = 22;

  int levelNumber;
  ArrayList<Bulb> bulbs;
  ArrayList<Halo> halos;
  int myMode;

  int initFlipStartTime;
  int initFlipDelay   = 200;
  int initFlipsNumber = 5;
  int initFlipped     = 0;
  int bestTime      = -10;
  
  int startPlayTime   = -1; 

  Level() {
    levelNumber = 0;
    myMode      = INIT_LEVEL;
    bulbs       = new ArrayList();
    halos       = new ArrayList();
  }

  boolean checkLevelEnd() {
    return(myMode==DONE_LEVEL);
    /*
    if (myMode != DONE_LEVEL) {
      return false;
    }
    return checkComplete();
    */
  }
  
  boolean checkComplete() {
    boolean ans = true;
    for (int i=0; i<bulbs.size(); i++) {
      if (!bulbs.get(i).state) {
        ans = false;
      }
    }
    return ans;
  }

  void makeLevel(int levelN, int bulbsN) {
    dbg("makeLevel...");
    levelNumber = levelN;
    if( storage.get("bestLevelTime"+levelNumber)!=null) {
      this.bestTime = parseInt(storage.get("bestLevelTime"+levelNumber));
    }
    else {
      this.bestTime = -1;
    }
    // if there are some bulbs - remove them
    for (int i=bulbs.size()-1; i>=0; i--) {
      bulbs.remove(i);
    }
    // make new bulbs
//    int bulbsNum = 4+int(levelNumber/2);
    int bulbsNum = bulbsN;
    dbg("to create bulbs: "+bulbsNum);
    for (int i=0; i<bulbsNum; i++) {
      bulbs.add(new Bulb(width/2+35*ex*sin(TWO_PI*i/bulbsNum), height/2-35*ex*cos(TWO_PI*i/bulbsNum)));
    }
    // connect them
    for (int i=0; i<bulbs.size(); i++) {
      Bulb bulb = bulbs.get(i);
      bulb.connectToRandom(bulbs);
      dbg(bulb.neighs);
    }
    initFlipStartTime = millis();
    myMode = INIT_LEVEL;
  }

  void onClick() {
    if (myMode == PLAY_LEVEL) {
      for (int i=bulbs.size()-1; i>=0; i--) {
        bulbs.get(i).checkClicked();
      }
    }
  }

  void work() {
//    dbg("work...");
    switch(myMode) {
    case INIT_LEVEL:
      dbg("initing...");
      if (initFlipped < initFlipsNumber) {
        dbg("flipping: "+initFlipped);
        if (initFlipStartTime + initFlipDelay < millis()) {
          Bulb bulb = bulbs.get(int(random(bulbs.size())));
          bulb.flipMeAndFriends();
          initFlipped++;
          initFlipStartTime = millis();
        }
      }
      else {
        if (initFlipStartTime + initFlipDelay < millis()) {
          dbg("fliped: "+initFlipped);
          initFlipped = 0;
          myMode = PLAY_LEVEL;
          startPlayTime = millis();
        }
      }
      break;
    case PLAY_LEVEL:
      if( checkComplete() ) {
        if((bestTime>0 && bestTime>(millis()-startPlayTime)) || bestTime<0) {
          bestTime = millis()-startPlayTime;
          storage.put("bestLevelTime"+levelNumber, str(bestTime));
        }
        myMode = DONE_LEVEL;
      }
      break;
    }
  }

  void draw() {
//    dbg("draw...");
    fill(0,50);
    noStroke();
    rect(0, 0, width, height);
    for (int i=bulbs.size()-1; i>=0; i--) {
      bulbs.get(i).draw();
    }
    for (int i=halos.size()-1; i>=0; i--) {
      halos.get(i).draw();
    }
    if (myMode == INIT_LEVEL) {
      fill(255, 100);
      noStroke();
      ellipseMode(CENTER);
//      float supAngle = TWO_PI*(millis()-initFlipStartTime)/initFlipDelay;
      float supAngle = TWO_PI*(initFlipped+(1.0*millis()-initFlipStartTime)/initFlipDelay)/(initFlipsNumber+1);
      arc(width/2, height/2, 40*ex, 40*ex, -HALF_PI, -HALF_PI+supAngle);
    }
  }
}

final int NULL       = -1;
final int WELCOME    = 0;
final int MENU       = 1;
final int PLAY       = 2;

// playTypes

final int LEVEL_UP    = 100;    //go level by level
final int ONE_LEVEL   = 101;    //repeat variants of the same level
final int LEVEL_CHOSE = 102;    //show the level choser

class Mode {

  int supermode;
  int playType;

  Mode() {
    supermode = WELCOME;
  }
}

class Score {
  
  int points;
  int lifes;
  int moves;
  int highLevel;
  int highPoints;
  
  int reverses = 3;
  
  Score() {
    this.points    = 0;
    this.lifes     = 1;
    this.moves     = 0;
    if( storage.get("highLevel")!=null) {
      this.highLevel = parseInt(storage.get("highLevel"));
    }
    else {
      this.highLevel = 0;
    }
  }
  
  void clear() {
    dbg("clear score start...");
    storage.remove("highLevel");
    for(int i=0; i<300; i++) {
      storage.remove("bestLevelTime"+i);
    }
    this.highLevel = 0;
    dbg("cleared");
  }
  
  void draw() {
    pushStyle();
    fill(255);
    stroke(255);
    textSize(3.5*ex);
    textAlign(LEFT, TOP);
    if(level.myMode == level.PLAY_LEVEL) {
      if( (level.bestTime<0) || (millis()-level.startPlayTime) < level.bestTime ) {
        fill(150,255,150);
      }
      else {
        fill(255,150,150);
      }
      text("TIME:  "+(millis()-level.startPlayTime)/1000.0, 2*ex, 2*ex);
    }
    else {
      text("BE READY...", 2*ex, 2*ex);
    }
    fill(255);
    if(level.bestTime>0) {
      text("BEST  : "+level.bestTime/1000.0, 2*ex, 7*ex);
    }
    else {
      text("BEST  : ?", 2*ex, 7*ex);
    }
    
    textAlign(CENTER, TOP);
    text("LEVEL: "+level.levelNumber, 50*ex, 2*ex);
    text("BEST: "+highLevel, 50*ex, 7*ex);
    
    textAlign(RIGHT, TOP);
    text("MOVES: "+score.moves, 98*ex, 2*ex);
    text("BULBS: "+level.bulbs.size(), 98*ex, 7*ex);
    popStyle();
  }
  
}
class DataStorage {

  Table data;
  String file;
  boolean autoSave = true;

  int platform;
  final int UNKNOWN    = -1;
  final int JAVASCRIPT = 0;
  final int JAVA       = 1;
  
  //line: FakeLocalStorage localStorage must be:
//    - commented in JavaScript mode
//    - uncommented in Java/Android mode

//  FakeLocalStorage localStorage;

  DataStorage() {
    file = "storageModuleData.csv";

    setPlatform();

    switch(platform) {
    case JAVA:
      try {
        data = loadTable(file, "header");
      }
      catch(NullPointerException e) {
        data = new Table();
        data.addColumn("key");
        data.addColumn("value");
      }
      break;
    case JAVASCRIPT:
      break;
    }
  }

  String get(String dKey) {
    String ans = "";
    switch(platform) {
    case JAVA:
      TableRow r = data.matchRow(dKey, "key");
      if (r==null) {
        return(null);
      }
      ans = r.getString("value");
      break;
    case JAVASCRIPT:
      ans = localStorage.getItem(dKey);
      break;
    }
    return ans;
  }

  void put(String dKey, String dValue) {
    switch(platform) {
    case JAVA:
      TableRow r = data.matchRow(dKey, "key");
      //if there is no such key, we have to create one
      if (r==null) {
        r = data.addRow();
      }
      r.setString("key", dKey);
      r.setString("value", dValue);
      autoSaveData();
      break;
    case JAVASCRIPT:
      localStorage.setItem(dKey, dValue);
      break;
    }
  }

  void remove(String dKey) {
    switch(platform) {
    case JAVA:
      //why there's no removeRow(TableRow row) but only removeRow(int rowNumber) ?!
      for (int i=0; i< data.getRowCount(); i++) {
        if ( data.getRow(i).getString("key").equals(dKey) ) {
          data.removeRow(i);
        }
      }
      autoSaveData();
      break;
    case JAVASCRIPT:
      localStorage.removeItem(dKey);
      break;
    }
  }

  void autoSaveData() {
    if (autoSave) {
      save();
    }
  }

  void save() {
    switch(platform) {
    case JAVA:
      saveTable(data, file);
      break;
    case JAVASCRIPT:
      break;
    }
  }

  void setPlatform() {
    platform = UNKNOWN;
    try {
      java.lang.Object a;
      a = new java.lang.Object();
      platform = JAVA;
    }
    catch(Throwable e) {
      platform = JAVASCRIPT;
    }
  }

  // sugar for those, who prefer set over put.
  // avoid usage set()!
  void set(String dKey, String dData) {
    put(dKey, dData);
  }

  class FakeLocalStorage {
    FakeLocalStorage() {
    }
    String getItem( String dKey ) {
      return "---";
    };
    void setItem( String dKey, String dValue ) {
    };
    void removeItem( String dKey ) {
    };
  }
}

class Gui {

  ArrayList<Button> buttons;
  ArrayList<Popup>  popups;

  Gui() {
    buttons = new ArrayList();
    popups  = new ArrayList();
  }

  void draw() {
    for (int i=0; i<buttons.size(); i++) {
      buttons.get(i).draw();
    }
    for (int i=0; i<popups.size(); i++) {
      popups.get(i).draw();
    }
  }

  void lock() {
    for (int i=0; i<buttons.size(); i++) {
      buttons.get(i).lock();
    }
  }

  void unlock() {
    for (int i=0; i<buttons.size(); i++) {
      buttons.get(i).unlock();
    }
  }

  Button addButton(float x, float y, float w, float h, float r) {
    Button b = new Button(x, y, w, h, r);
    buttons.add(b);
    return b;
  }


  Popup addPopup(float x, float y, float w, float h, float r) {
    Popup p = new Popup(x, y, w, h, r);
    popups.add(p);
    return p;
  }


  // BUTTON
  class Button {

    float x;
    float y;
    float w;
    float h;
    float r;
    boolean keepsPressed;
    boolean locked;
    String txt;
    float txtSize;

    Button(float x, float y, float w, float h, float r) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.r = r;
      this.keepsPressed = false;
      this.txt    = "-";
      this.txtSize = 0.7*h;
    }

    void draw() {
      //      dbg("draw btn at: "+x+" , "+y);
      pushStyle();
      if (pressed()) {
        rectMode(CORNER);
        //background
        fill(180);
        stroke(255);
        rect(x, y, w, h, r);
        //shine
        fill(255, 80);
        noStroke();
        rect(x+0.02*w, y+0.02*h, w-0.04*w, 0.4*h, r);
        //text
        fill(55);
        stroke(55);
        textAlign(CENTER, CENTER);
        textSize(txtSize);
        text(txt, x+w/2, y+0.4*h);
      }
      else if (hover()) {
        rectMode(CORNER);
        fill(20);
        stroke(255);
        rect(x, y, w, h, r);
        fill(255, 80);
        noStroke();
        rect(x+0.02*w, y+0.02*h, w-0.04*w, 0.4*h, r);
        fill(255);
        stroke(255);
        textAlign(CENTER, CENTER);
        textSize(txtSize);
        text(txt, x+w/2, y+0.4*h);
      }
      else {
        rectMode(CORNER);
        fill(0);
        stroke(255);
        rect(x, y, w, h, r);
        fill(255, 80);
        noStroke();
        rect(x+0.02*w, y+0.02*h, w-0.04*w, 0.4*h, r);
        fill(255);
        stroke(255);
        textAlign(CENTER, CENTER);
        textSize(txtSize);
        text(txt, x+w/2, y+0.4*h);
      }
      popStyle();
      if (!pressed()) {
        keepsPressed = false;
      }
    }

    boolean hover() {
      if (locked) return false;
      return ( mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h );
    }

    boolean pressed() {
      if (locked) return false;
      return ( hover() && mousePressed );
    }

    boolean clicked() {
      if (locked) return false;
      if ( !keepsPressed && pressed() ) {
        keepsPressed = true;
        return true;
      }
      return false;
    }

    void lock() {
      locked = true;
    }

    void unlock() {
      locked = false;
    }
  }

  class Popup {

    float x;
    float y;
    float w;
    float h;
    float r;
    String txt;
    float  txtSize;
    String title;
    Button okBtn;
    Button cancelBtn;

    Popup(float x, float y, float w, float h, float r) {
      lock(); //locks the parent gui
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.r = r;
      this.txtSize = 0.07*h;
      this.txt    = "-";
      this.title  = "-";
      this.okBtn     = new Button(x+0.1*w, y+0.7*h, 0.3*w, 0.1*w, r);
      okBtn.txt = "OK";
      this.cancelBtn = new Button(x+0.6*w, y+0.7*h, 0.3*w, 0.1*w, r);
      cancelBtn.txt = "CANCEL";
    }

    int getAnswer() {
      if(okBtn.clicked()) return 1;
      if(cancelBtn.clicked()) return 0;
      return -1;
    }

    void close() {
      for(int i=popups.size()-1; i>=0; i--) {
        if(popups.get(i) == this) popups.remove(i);
      }
      unlock();
    }

    void draw() {
      pushStyle();
      rectMode(CORNER);
      stroke(255);
      strokeWeight(5);
      fill(0);
      rect(x, y, w, h, r);
      strokeWeight(1);
      fill(255, 80);
      noStroke();
      rect(x+0.02*w, y+0.02*h, w-0.04*w, txtSize*2, r);
      fill(255);
      stroke(255);
      textAlign(CENTER, CENTER);
      textSize(txtSize*1.2);
      text(title, x+w/2, y+txtSize);
      textAlign(CENTER, CENTER);
      textSize(txtSize);
      text(txt, x+w/2, y+0.4*h);
      popStyle();
      okBtn.draw();
      cancelBtn.draw();
    }
  }
}



void dbg( Object s ) {
  if(debug) {
    println(s);
  }
}
Gui.Button levelUpResetLevelBtn;
Gui.Button levelUpBackMenuBtn;
Gui.Button levelUpExitBtn;
Gui.Button oneLevelResetLevelBtn;
Gui.Button oneLevelBackMenuBtn;
Gui.Button oneLevelExitBtn;
Gui.Button mainExitBtn;
Gui.Button mainModeLevelUp;
Gui.Button mainModeOneLevel;
Gui.Button mainClearHighs;
Gui.Popup  mainMenuPopup;


Gui.Button[] levelChoseButtonArray;

void initGuis() {
  
  mainMenuGui      = new Gui();
  mainModeLevelUp  = mainMenuGui.addButton(15*ex, 20*ey, 70*ex, 7*ex, 2*ex);
  mainModeLevelUp  .txt = "Maraton (level by level)";
  mainModeOneLevel = mainMenuGui.addButton(15*ex, 30*ey, 70*ex, 7*ex, 2*ex);
  mainModeOneLevel .txt = "Sprint (one level)";
  mainClearHighs   = mainMenuGui.addButton(30*ex, 82*ey, 40*ex, 5*ex, 2*ex);
  mainClearHighs   .txt = "Clear highscores";
  mainExitBtn      = mainMenuGui.addButton(30*ex, 90*ey, 40*ex, 5*ex, 2*ex);
  mainExitBtn      .txt = "EXIT";
  
  playLevelUpGui        = new Gui();
  levelUpResetLevelBtn  = playLevelUpGui.addButton(2*ex, 14*ex, 30*ex, 5*ex, 2*ex);
  levelUpResetLevelBtn  .txt = "Reset level ("+score.reverses+")";
  levelUpBackMenuBtn    = playLevelUpGui.addButton(2*ex, 90*ey, 40*ex, 6*ex, 2*ex);
  levelUpBackMenuBtn    .txt = "MAIN MENU";
  levelUpExitBtn        = playLevelUpGui.addButton(58*ex, 90*ey, 40*ex, 6*ex, 2*ex);
  levelUpExitBtn        .txt = "EXIT GAME";
  
  playOneLevelGui        = new Gui();
  oneLevelResetLevelBtn  = playOneLevelGui.addButton(2*ex, 14*ex, 30*ex, 5*ex, 2*ex);
  oneLevelResetLevelBtn  .txt = "Reset level";
  oneLevelBackMenuBtn    = playOneLevelGui.addButton(2*ex, 90*ey, 40*ex, 6*ex, 2*ex);
  oneLevelBackMenuBtn    .txt = "MAIN MENU";
  oneLevelExitBtn        = playOneLevelGui.addButton(58*ex, 90*ey, 40*ex, 6*ex, 2*ex);
  oneLevelExitBtn        .txt = "EXIT GAME";
  
  levelChoseGui    = new Gui();
  levelChoseButtonArray = new Gui.Button[36];
  for(int y=0; y<6; y++) {
    for(int x=0; x<6; x++) {
      levelChoseButtonArray[x+6*y]         = levelChoseGui.addButton(8*ex+x*15*ex, y*15*ex+10*ex, 10*ex, 10*ex, 2*ex);
      levelChoseButtonArray[x+6*y].txt     = ""+(x+6*y);
      levelChoseButtonArray[x+6*y].txtSize = 4*ex;
    }
  }
  
}
int levelChoseStartTime = -1;

void levelChose() {

  pushStyle();
  noStroke();
  fill(0,50);
  rectMode(CORNER);
  rect(0,0,width,height);
  popStyle();

  if(levelChoseStartTime==-1) {
    levelChoseStartTime = millis();
  }
  if (levelChoseStartTime+300<millis()) {
    for (int i=0; i<levelChoseButtonArray.length; i++) {
      if ( levelChoseButtonArray[i].clicked() ) {
        dbg("Chosen level: "+i);
        level.levelNumber = i;
        int bulbsNum = 4+int(level.levelNumber/2);
        level.makeLevel(level.levelNumber, bulbsNum);
        levelChoseStartTime = -1;
        mode.playType  = ONE_LEVEL;
        mode.supermode = PLAY;
      }
    }
    levelChoseGui.draw();
  }
}

int mainMenuStartTime = -1;

void menu() {
  pushStyle();
  background(0);

  textAlign(CENTER, CENTER);
  textSize(5*ex);
  fill(150);
  text("Chose the play type:", width/2, 10*ey);

  if (mainMenuStartTime==-1) {
    mainMenuStartTime = millis();
  }


  

  if (mainMenuStartTime+300<millis()) {

    mainMenuGui.draw();
    
    if ( mainModeLevelUp.clicked() ) {
      mainMenuStartTime = -1;
      mode.playType  = LEVEL_UP;
      int levelN = 0;
      int bulbsNum = 4+int(levelN/2);
      level.makeLevel(levelN, bulbsNum);
      mode.supermode = PLAY;
    }

    if ( mainModeOneLevel.clicked() ) {
      mainMenuStartTime = -1;
      mode.playType  = ONE_LEVEL;
      mode.supermode = LEVEL_CHOSE;
    }

    if ( mainClearHighs.clicked() ) {
      mainMenuPopup = mainMenuGui.addPopup( 10*ex, 25*ex, 80*ex, 60*ex, 2*ex );
      mainMenuPopup.title = "CONFIRM";
      mainMenuPopup.txt   = "Are you sure\nthat you want to completely remove\nall the highscores?";
    }

    if (mainMenuPopup != null) {
      int ans = mainMenuPopup.getAnswer();
      switch(ans) {
      case 1:
        dbg("will remove highs now...");
        mainMenuPopup.close();
        score.clear();
        break;
      case 0:
        mainMenuPopup.close();
        dbg("will NOT remove highs now");
        break;
      }
    }

    if ( mainExitBtn.clicked() ) {
      exit();
    }
  }

  popStyle();
}

void play() {

  boolean levelEnd = level.checkLevelEnd();

  switch(mode.playType) {
    // ========= playType: LEVEL_UP ==========
  case LEVEL_UP:
    if (levelEnd) {
      dbg("MAKE LEVEL");
      level.levelNumber++;
      if(level.levelNumber > score.highLevel) {
        score.highLevel = level.levelNumber;
        storage.put("highLevel", str(level.levelNumber));
      }
      int bulbsNum = 4+int(level.levelNumber/2);
      level.makeLevel(level.levelNumber, bulbsNum);
    } 
    else {
      level/*******/.work();
      level/*******/.draw();
      score/*******/.draw();
      playLevelUpGui.draw();
      if(levelUpBackMenuBtn.clicked()) {
        
        mode.supermode = MENU;
      }
      if(levelUpExitBtn.clicked()) {
        exit();
      }
      if (levelUpResetLevelBtn.clicked()) {
        if (score.reverses > 0) {
          int bulbsNum = 4+int(level.levelNumber/2);
          level.makeLevel(level.levelNumber, bulbsNum);
          score.reverses--;
          if (score.reverses > 0) {
            levelUpResetLevelBtn.txt = "Reset level ("+score.reverses+")";
          } 
          else {
            levelUpResetLevelBtn.txt = "Back level";
          }
        } 
        else if ( level.levelNumber>0 ) {
          level.levelNumber--;
          int bulbsNum = 4+int(level.levelNumber/2);
          level.makeLevel(level.levelNumber, bulbsNum);
        }
      }
    }
    break;

    // ========= playType: ONE_LEVEL ==========
  case ONE_LEVEL:
    if (levelEnd) {
      dbg("MAKE LEVEL");
      if(level.levelNumber > score.highLevel) {
        score.highLevel = level.levelNumber;
        storage.put("highLevel", str(level.levelNumber));
      }
      mode.supermode = LEVEL_CHOSE;
    } 
    else {
      level/********/.work();
      level/********/.draw();
      score/********/.draw();
      playOneLevelGui.draw();
      if(oneLevelBackMenuBtn.clicked()) {
        mode.supermode = MENU;
      }
      if(oneLevelExitBtn.clicked()) {
        exit();
      }
      if (oneLevelResetLevelBtn.clicked()) {
        int bulbsNum = 4+int(level.levelNumber/2);
        level.makeLevel(level.levelNumber, bulbsNum);
      }
      break;
    }
  }
}

void welcome() {
  mode.supermode = MENU;
}

