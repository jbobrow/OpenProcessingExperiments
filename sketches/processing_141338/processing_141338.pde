
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// 257/757  Spring 2014
// HW #9
// 3/18/14

// Image Credit:
// background image obtained from http://www.anvilclock.com/restorationandrepair.htm
// pedestal table image obtained from http://www.archiexpo.com/prod/royal-botania/contemporary-garden-pedestal-tables-9708-1219297.html
// All drawings copyright Shannon Impellicceiri 2014

// ---------------------------------------------------------------
// ************ DECLARE CLASSES ************
// ---------------------------------------------------------------

class Monster{
  // class for the monster to be created
    
  // declare properties
  public BodyPart Head = new BodyPart(height*.25, height*.02, height*.25);
  public BodyPart Body = new BodyPart(height*.55, height*-.06, height*.3);
  public BodyPartPair Arms = new BodyPartPair(height*.4, height*0.11, height*.2, height*.18);
  public BodyPartPair Legs = new BodyPartPair(height*.7, 0, height*.2, height*.15);
  public String [ ] names = {  "Fredrick the Feared",
                        "Dudley the Deadly",
                        "Terrence the Terror",
                        "Norman the Nightmare",
                        "Saul the Slasher",
                        "Justin the Jackhammer",
                        "Marve the Menace",
                        "Mack the Merciless",
                        "Frank the Ferocious",
                        "Brutus the Bone-Crusher",
                        "Bruce the Barbarian"};

  // constructor
  public Monster(){
    // nothing needed here
  }
  
  //---------------------------------------------
  public boolean CheckMonsterComplete() { 
    // method for checking whether all of the monster's body parts have been selected
    boolean monsterComplete;
    
    // check for monster completion
    if(myMonster.Head.option == 0){
      // incomplete
      monsterComplete = false;
    }else if(myMonster.Body.option == 0){
      // incomplete
      monsterComplete = false;
    }else if(myMonster.Arms.option == 0){
      // incomplete
      monsterComplete = false;
    }else if(myMonster.Legs.option == 0){
      // incomplete
      monsterComplete = false;
    }else{
      // monster must be complete
      monsterComplete = true;
    } 
    
    return(monsterComplete);
  }
  //---------------------------------------------
  public void danceMonster(){
    // method for making the monster dance
    
    // declare local variables
    float halfBeat = 22; // number of frames in half of a beat of the dance (2 beats per cycle)
    float danceFrame = frameCount%(halfBeat*4); // frame number for each dance cycle (2 beats)
    float headRotOffset = 30;
    float headYOffset = height*.04;
    float bodyRotOffset = 20;
    float xOffset = height*.05;
    float bodyYOffset = height*.05;
    float armsRotOffset = 45;
    float armsYOffset = height*.1;
    float legsRotOffset = 45;
    
    // frame 0: center
    // frame 30: left beat
    // frame 60: center
    // frame 90: right beat
    // frame 120 = frame 0
    
    // DANCE HEAD: head will rock side to side on each beat
    // DANCE BODY: body will bob left, center/up, right while rotating to either side
    // DANCE ARMS: arms
    // DANCE LEGS: legs

    if(danceFrame == 0 || danceFrame == halfBeat*2){
      // center
      Head.rotation = 0;
      Head.xOffset = 0;
      Body.rotation = 0;
      Body.xOffset = 0;
      Body.yOffset = 0;
      Arms.rotL = 0;
      Arms.rotR = 0;
      Arms.xOffset = 0;
      Arms.yOffset = 0;

    }else if(danceFrame< halfBeat){
      // frames 1-29 moving left
      // head
      Head.rotation = -(danceFrame%halfBeat)/halfBeat*headRotOffset;
      Head.xOffset = -(danceFrame%halfBeat)/halfBeat*xOffset;
      Head.yOffset = (danceFrame%halfBeat)/halfBeat*headYOffset;
      // body
      Body.rotation = (danceFrame%halfBeat)/halfBeat*bodyRotOffset;
      Body.xOffset = -(danceFrame%halfBeat)/halfBeat*xOffset;
      Body.yOffset = (danceFrame%halfBeat)/halfBeat*bodyYOffset;
      // arms
      Arms.rotL = -(danceFrame%halfBeat)/halfBeat*armsRotOffset;
      Arms.rotR = -(danceFrame%halfBeat)/halfBeat*armsRotOffset;
      Arms.xOffset = -(danceFrame%halfBeat)/halfBeat*xOffset;
      Arms.yOffset = -(danceFrame%halfBeat)/halfBeat*armsYOffset;
      // legs
      Legs.rotL = (danceFrame%halfBeat)/halfBeat*legsRotOffset/2;
      Legs.rotR = -(danceFrame%halfBeat)/halfBeat*legsRotOffset;
      Legs.xOffset = -(danceFrame%halfBeat)/halfBeat*xOffset/2;
      Legs.yExtraR = -(danceFrame%halfBeat)/halfBeat*armsYOffset;
    }else if(danceFrame< halfBeat*2){
      // frames 30-59 moving right to center
      // head
      Head.rotation = -(halfBeat-(danceFrame%halfBeat))/halfBeat*headRotOffset;
      Head.xOffset = -(halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset;
      Head.yOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*headYOffset;
      // body
      Body.rotation = (halfBeat-(danceFrame%halfBeat))/halfBeat*bodyRotOffset;
      Body.xOffset = -(halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset;
      Body.yOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*bodyYOffset;
      // arms
      Arms.rotL = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsRotOffset;
      Arms.rotR = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsRotOffset;
      Arms.xOffset = -(halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset;
      Arms.yOffset = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsYOffset;
      // legs
      Legs.rotL = (halfBeat-(danceFrame%halfBeat))/halfBeat*legsRotOffset/2;
      Legs.rotR = -(halfBeat-(danceFrame%halfBeat))/halfBeat*legsRotOffset;
      Legs.xOffset = -(halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset/2;
      Legs.yExtraR = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsYOffset;
    }else if(danceFrame< halfBeat*3){
      // frames 61-89
      // head
      Head.rotation = (danceFrame%halfBeat)/halfBeat*headRotOffset;
      Head.xOffset = (danceFrame%halfBeat)/halfBeat*xOffset;
      Head.yOffset = (danceFrame%halfBeat)/halfBeat*headYOffset;
      // body
      Body.rotation = -(danceFrame%halfBeat)/halfBeat*bodyRotOffset;
      Body.xOffset = (danceFrame%halfBeat)/halfBeat*xOffset;
      Body.yOffset = (danceFrame%halfBeat)/halfBeat*bodyYOffset;
      // arms
      Arms.rotL = -(danceFrame%halfBeat)/halfBeat*armsRotOffset;
      Arms.rotR = -(danceFrame%halfBeat)/halfBeat*armsRotOffset;
      Arms.xOffset = (danceFrame%halfBeat)/halfBeat*xOffset;
      Arms.yOffset = -(danceFrame%halfBeat)/halfBeat*armsYOffset;
      // legs
      Legs.rotL = -(danceFrame%halfBeat)/halfBeat*legsRotOffset;
      Legs.rotR = (danceFrame%halfBeat)/halfBeat*legsRotOffset/2;
      Legs.xOffset = (danceFrame%halfBeat)/halfBeat*xOffset/2;
      Legs.yExtraL = -(danceFrame%halfBeat)/halfBeat*armsYOffset;
    }else if(danceFrame< halfBeat*4){
      // frames 90-119
      // head
      Head.rotation = (halfBeat-(danceFrame%halfBeat))/halfBeat*headRotOffset;
      Head.xOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset;
      Head.yOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*headYOffset;
      // body
      Body.rotation = -(halfBeat-(danceFrame%halfBeat))/halfBeat*bodyRotOffset;
      Body.xOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset;
      Body.yOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*bodyYOffset;
      // arms
      Arms.rotL = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsRotOffset;
      Arms.rotR = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsRotOffset;
      Arms.xOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset;
      Arms.yOffset = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsYOffset;
      // legs
      Legs.rotL = -(halfBeat-(danceFrame%halfBeat))/halfBeat*legsRotOffset;
      Legs.rotR = (halfBeat-(danceFrame%halfBeat))/halfBeat*legsRotOffset/2;
      Legs.xOffset = (halfBeat-(danceFrame%halfBeat))/halfBeat*xOffset/2;
      Legs.yExtraL = -(halfBeat-(danceFrame%halfBeat))/halfBeat*armsYOffset;
    }
  }
}

// *********************************************************
class BodyPart{
  // class for each of the monster's body parts
  
  // declare properties
  public int option; // 0 = unspecified
              // 1 = frankenstein monster
              // 2 = sasquatch / furry monster
              // 3 = reptilian monster
  protected float xpos; // x position
  protected float ypos; // y position
  protected float xOffset; // offset of body part from xpos
  protected float yExtra; // extra offset of body part from ypos
  protected float yOffset; // offset of body part from ypos
  protected float rotation; // rotation of body part from vertical in degrees
  protected float size; // size unit
  protected float arrowX = width/3; // distance from center line to center of arrow
  protected float arrowUnit = 12.5; // drawing unit for an arrow
  protected float arrowWd = arrowUnit*4; // width of arrow
  protected float arrowHt = arrowUnit*6; // height of arrow
  public PImage [ ] partImage = new PImage[4]; // images of the bodypart options
  
  //---------------------------------------------
  // constructor
  public BodyPart(float tempYpos, float tempYExtra, float tempSize){
    // set initial values for the properties
    option = 0;
    xpos = width/2;
    ypos = tempYpos;
    rotation = 0;
    xOffset = 0;
    yExtra = tempYExtra;
    size = tempSize;
  }
  
  //---------------------------------------------
  public void NextOption() {
    // method for going to the next option (up)
    option++;
    
    // check for out of bounds
    if(option>3){
      option = 1;
    }
  }
  
  //---------------------------------------------
  public void PrevOption() {
    // method for going to the next option (down)
    option--;
    
    // check for out of bounds
    if(option<1){
      option = 3;
    }
  }
  
  //---------------------------------------------
  public void DrawBodyPart() { 
    // method for drawing a given body part in the correct position and size
    pushMatrix();
      translate(xpos+xOffset,ypos+yExtra+yOffset);
      rotate(radians(rotation));
      image(partImage[option],0,0,size,size);
    popMatrix();
  }
  
  //---------------------------------------------
  public void DrawArrows() {
    // method for drawing pairs of arrows around each body part    
    
    // declare local color variables
    color boxReg = color(100,100,100,150); // grey box
    color boxHover = color(50,50,255,150); // blue box
    color boxClick = color(100,100,50,150); // yellow box
    color strokeReg = color(255); // white arrow
    color strokeHover = color(255); // yellow 
    color strokeClick = color(255,255,0);
    
    // LEFT ARROW
    // set colors based on hover, click, or neither
    if(checkClick(width/2-arrowX, ypos, arrowWd, arrowHt)){
        // arrow is being clicked
        fill(boxClick);
        stroke(strokeClick);
      }else if(checkHover(width/2-arrowX, ypos, arrowWd, arrowHt)){
        // arrow is being hovered over
        fill(boxHover);
        stroke(strokeHover);
      }else{
        // unselected
        fill(boxReg);
        stroke(strokeReg);
      }
    // draw left arrow
    rect(width/2-arrowX,ypos,arrowWd,arrowHt);
    line(width/2-arrowX-arrowUnit,ypos,width/2-arrowX+arrowUnit,ypos-arrowUnit); // top of arrow
    line(width/2-arrowX-arrowUnit,ypos,width/2-arrowX+arrowUnit,ypos+arrowUnit); // bottom of arrow
    
    // RIGHT ARROW
    // set colors based on hover, click, or neither
    if(checkClick(width/2+arrowX, ypos, arrowWd, arrowHt)){
        // arrow is being clicked
        fill(boxClick);
        stroke(strokeClick);
      }else if(checkHover(width/2+arrowX, ypos, arrowWd, arrowHt)){
        // arrow is being hovered over
        fill(boxHover);
        stroke(strokeHover);
      }else{
        // unselected
        fill(boxReg);
        stroke(strokeReg);
      }
    // draw right arrow
    rect(width/2+arrowX,ypos,arrowWd,arrowHt);
    line(width/2+arrowX+arrowUnit,ypos,width/2+arrowX-arrowUnit,ypos-arrowUnit); // top of arrow
    line(width/2+arrowX+arrowUnit,ypos,width/2+arrowX-arrowUnit,ypos+arrowUnit); // bottom of arrow
  }
  
  //---------------------------------------------
  public boolean CheckArrow(int leftRight) {
    // method for checking whether an arrow is clicked (triggered on mousepress function)
    
    // 1 = check left arrow
    // 2 = check right arrow
    
    // declare variables
    boolean arrowClick = false;
    
    if(leftRight == 1){
      // check left arrow
      arrowClick = checkHover(width/2-arrowX, ypos, arrowWd, arrowHt);
    }else if(leftRight == 2){
      // check right arrow
      arrowClick = checkHover(width/2+arrowX, ypos, arrowWd, arrowHt);
    }
    
    return(arrowClick);
  }
  
}
         
// *********************************************************
class BodyPartPair extends BodyPart {
  // sub-type of class BodyPart for arms and legs
  float xExtra;
  float rotL; // rotation of left leg
  float rotR; // rotation of right leg
  float yExtraL; // extra y offset of left leg
  float yExtraR; // extra y offset of right leg
  
  // constuctor
  public BodyPartPair(float tempYpos, float tempYExtra, float tempSize, float tempXExtra){
    super(tempYpos, tempYExtra, tempSize); // calls BodyPart constructor
    xExtra = tempXExtra;
    rotL = rotation;
    rotR = rotation;
    yExtraL = 0;
    yExtraR = 0;
  }
  
  //---------------------------------------------
  public void DrawBodyPartPair() { 
    // method for drawing both arms or legs in the correct position and size
    
    // left arm/leg
    pushMatrix();
      translate(xpos-xExtra+xOffset,ypos+yExtra+yOffset+yExtraL);
      scale(-1,1); // flip over y axis
      rotate(radians(rotL));
      image(partImage[option],0,0,size,size);
    popMatrix();
    
    // right arm/leg
    pushMatrix();
      translate(xpos+xExtra+xOffset,ypos+yExtra+yOffset+yExtraR);
      rotate(radians(rotR));
      image(partImage[option],0,0,size,size);
    popMatrix();
  }
}

// ---------------------------------------------------------------
// ************ DECLARE GLOBAL VARIABLES AND OBJECTS ************
// ---------------------------------------------------------------
int gameState; // 1 = intro
               // 2 = monster creation
String currentMonsterName; // name on name plate
Monster myMonster; // create an instance of the class monster
PImage workbench;

// ---------------------------------------------------------------
// ************ FUNCTIONS ************
// ---------------------------------------------------------------

void setup(){
  size(800, 600);
  myMonster = new Monster(); // create an instance of the class monster
  
  // formatting
  noStroke();
  textAlign(CENTER,CENTER);
  imageMode(CENTER);
  
  // initialize variables
  gameState = 0;
  currentMonsterName = "Create Your Monster";
  
  // load images
  workbench = loadImage("shopview.jpg");
  for(int i = 0; i<4; i++){
    myMonster.Head.partImage[i] = loadImage("head" + i + ".png");
    myMonster.Body.partImage[i] = loadImage("body" + i + ".png");
    myMonster.Arms.partImage[i] = loadImage("arm" + i + ".png");
    myMonster.Legs.partImage[i] = loadImage("leg" + i + ".png");
  }
}

// *********************************************************
void draw(){
  // determine game state
  switch(gameState){
    case 0:
      // intro
      playIntro();
      break;
    case 1:
      // monster creation
      playMonsterCreation();
      break;
  }
}

// *********************************************************
void playIntro(){
  // declare local variables
  float borderWidth = width/7; // width of border surrounding message box
  
  // place screen over background image
  showBackground();
  fill(0,0,0,100);
  rect(0,0,width,height);
  
  // show message over background image
  fill(0,0,0,100);
  rect(borderWidth,borderWidth,width-(2*borderWidth),height-(2*borderWidth));
  fill(255);
  textSize(24);
  text("Welcome to", width/2, height*.3);
  textSize(48);
  text("The Creature Shop!", width/2,height*.4);
  textSize(24);
  text("Customize the monster of your dreams!",width/2,height*.5);
  text("Press [space bar] to continue...",width/2,height*.7);
  
  // check for enter to proceed in keyPressed function
}
// *********************************************************
void playMonsterCreation(){
  // declare local variables
  
  // show background image
  showBackground();
  
  // draw name and text
  fill(0);
  textSize(30);
  text(currentMonsterName,width/2,50);
  textSize(20);
  text("Press [space bar] to start over", width/2, height-50);
  
  // if monster is complete, make him dance
  if(myMonster.CheckMonsterComplete()){
    // dance!
    myMonster.danceMonster();
  }
  
  // draw the monster
  drawMonster();
}
// *********************************************************
void drawMonster(){
  // game state = 1
  
  // formatting
  strokeWeight(3);
  rectMode(CENTER);
  
  // draw each body part with a pair of arrows
  // draw arms
  myMonster.Arms.DrawBodyPartPair();
  myMonster.Arms.DrawArrows();
  // draw legs
  myMonster.Legs.DrawBodyPartPair();
  myMonster.Legs.DrawArrows();
  // draw body
  myMonster.Body.DrawBodyPart();
  myMonster.Body.DrawArrows();
  // draw head
  myMonster.Head.DrawBodyPart();
  myMonster.Head.DrawArrows();
  
  // reset formatting
  strokeWeight(1);
  noStroke();
}

// *********************************************************
boolean checkHover(float x, float y, float wd, float ht){
  boolean hovered = false;
  
  // declare and define hover area parameters
  float minx = x-wd/2;
  float maxx = x+wd/2;
  float miny = y-ht/2;
  float maxy = y+ht/2;
  
  // check for mouse in hover area
  if(mouseX<maxx && mouseX>minx){
    // x parameter is in range
    if(mouseY<maxy && mouseY>miny){
      // y parameter is also in range
      hovered = true;
    }
  }
  
  return(hovered);
}
// *********************************************************
boolean checkClick(float x, float y, float wd, float ht){
  boolean clicked = false;
  
  // declare and define click area parameters
  float minx = x-wd/2;
  float maxx = x+wd/2;
  float miny = y-ht/2;
  float maxy = y+ht/2;
  
  // check for mouse in click area
  if(mouseX<maxx && mouseX>minx){
    // x parameter is in range
    if(mouseY<maxy && mouseY>miny){
      // y parameter is also in range
      if(mousePressed == true){
        clicked = true;
      }
    }
  }
  
  return(clicked);
}

// *********************************************************
void generateNewName(){
  // declare and initialize local variables
  String originalName = currentMonsterName;
  
  // try a new name
  while(currentMonsterName.equals(originalName)){
    // keep trying for a new name until something different comes up
    // (prevent same name twice in a row)
    currentMonsterName = myMonster.names[int(random(0,myMonster.names.length))];
  }
}
// *********************************************************
void showBackground(){
  image(workbench,width/2,height/2,width,height);
  fill(255,255,255,150);
  rectMode(CORNER);
  rect(0,0,width,height);
}
// *********************************************************
void keyPressed(){
  // check for key presses
  if(key == ' '){
    // check for game state
    if(gameState == 0){
      // space bar = trigger next game state - monster creation
      gameState = 1;
    }else{
      // space bar = start monster over
      setup();
      gameState = 1;
    }
  }
}
// *********************************************************
void mousePressed(){
  boolean arrowClick = true;

  if(gameState == 1){
    // Check for any of the arrows being clicked
    
    // check left arrows
    if(myMonster.Head.CheckArrow(1)){
      myMonster.Head.PrevOption();
    }else if(myMonster.Body.CheckArrow(1)){
      myMonster.Body.PrevOption();
    }else if(myMonster.Arms.CheckArrow(1)){
      myMonster.Arms.PrevOption();
    }else if(myMonster.Legs.CheckArrow(1)){
      myMonster.Legs.PrevOption();    
    
    // check right arrows
    }else if(myMonster.Head.CheckArrow(2)){
      myMonster.Head.NextOption();
    }else if(myMonster.Body.CheckArrow(2)){
      myMonster.Body.NextOption();
    }else if(myMonster.Arms.CheckArrow(2)){
      myMonster.Arms.NextOption();
    }else if(myMonster.Legs.CheckArrow(2)){
      myMonster.Legs.NextOption();
    }else{
      arrowClick = false;
    }

    // Trigger new name if an arrow has been clicked
    // AND if monster is complete
    if(arrowClick && myMonster.CheckMonsterComplete()){
      generateNewName();
    }
  }
}


