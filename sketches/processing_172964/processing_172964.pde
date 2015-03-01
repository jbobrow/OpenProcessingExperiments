
// It also interfaces directly with Processing much more than anything else
// Broad setup that needs to be done before even setup();
//import ddf.minim.*;
AppManager mAppMan;
public customAudioPlayer mMinim;

void setup() {
  size(1280, 720);
  background(#000000);
  
  mMinim = new customAudioPlayer();
  mAppMan = new AppManager();
  mAppMan.managerSetup();
}

void draw() {
  mAppMan.programLoop();
}

void keyPressed() {
  // Go back to main menu
  if (key == 'e') {
    mAppMan.mGameMan.changeState(GS_MAIN_MENU);
  }
}

void mousePressed() {
  if(mouseButton == LEFT)
    mAppMan.onClick();
  else if (mouseButton == RIGHT)
    mAppMan.onRClick();
}

class AppManager {
  public SpriteManager mSpriteMan;
  public RoomManager mRoomMan;
  public CreatureManager mCreatureMan;
  public GameManager mGameMan;
  
  AppManager() {
  }
  
  public void managerSetup() {
    mSpriteMan = new SpriteManager();
    mRoomMan = new RoomManager();
    mCreatureMan = new CreatureManager();
    mGameMan = new GameManager();
  }
  
  public void startGame() {
    mGameMan.startNewLevel();
  }
  
  public void programLoop() {
    mGameMan.gameLoop();
    mSpriteMan.graphicsLoop();
  }
  
  public void onClick() {
    mGameMan.handleClicks();
  }
  
  public void onRClick(){
    mGameMan.handleRClicks();
  }
}
// Handles the adventuring phase
class AdventureManager extends SubManager{
  // This is probably a sign that there needs to be an AudioManager class all by itself, but this isn't terribly inefficient, and that would take a lot of time.
  customAudioSnippet aCombatHitPlayer;
  customAudioSnippet aCombatHitEnemy;
  customAudioSnippet aCombatMiss;
  customAudioSnippet aCombatDeath;
  
  private int iTimer = 0; // counted in frames
  private Adventurer mParty;
  private AdventuringMenu mMenu;
  
  private boolean bPlayerTurn; 
  //private float fTimeSinceLastTurn;
  
  AdventureManager() {
    mParty = new Adventurer(mAppMan.mRoomMan.getRoomAtCoord(new PVector(ENTRANCE_X, ENTRANCE_Y)));
    mMenu = new AdventuringMenu(mParty);
    
    mAppMan.mCreatureMan.mAdventureMan = this;
    
    // Sound snippet setup
    aCombatHitPlayer = new customAudioSnippet("player_hit.wav");
    aCombatHitEnemy = new customAudioSnippet("enemy_hit.wav");
    aCombatMiss = new customAudioSnippet("slash.wav");
    aCombatDeath = new customAudioSnippet("death.wav");
  }
  
  public void destructor() {
    mMenu.destructor();
    
    mAppMan.mCreatureMan.mAdventureMan = null;
  }
  
  public void gameLoop() {
    iTimer += 1;  // If we aren't playing some animation
    
    if(!mParty.bInCombat) {      
      if(iTimer > TURN_TIME) {
        // Take a new turn
        mParty.takeTurn();
        iTimer = 0;
      }
    } else {
      // Go through combat rounds!
      if(iTimer > (TURN_TIME * 2) / 3){
        // Move the appropriate character
        
        // A lot of these lines are putting together the effect box which comes out from the attack.
        // Look in calculateAttack for more details on how the attack itself is calculated.
        color resultingColor;
        AttackData results = null;
        PVector effectPos = new PVector();
        effectPos.y = mMenu.vPosition.y + (UI_ADVENTURE_MARGIN * 6);
        
        if(bPlayerTurn) {
          effectPos.x = mMenu.vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH;
          results = calculateAttack(mParty, mMenu.mMonster);
          bPlayerTurn = false;
          
          // Need to put the correct sound effect within what turn we are, because otherwise we won't know which character was 
          //    hit and the appropriate effect to play
          if(results.bHit) {
            aCombatHitEnemy.rewind();
            aCombatHitEnemy.play();
          }
        } else {
          effectPos.x = mMenu.vPosition.x + UI_ADVENTURE_MARGIN;
          results = calculateAttack(mMenu.mMonster, mParty);
          bPlayerTurn = true;
          
          // Same comment as above
          if(results.bHit) {
            aCombatHitPlayer.rewind();
            aCombatHitPlayer.play();
          }
        }
        
        // Only go through this block of code if neither of the contestants are dead
        if(mParty.iHP > 0 && mMenu.mMonster != null) {
          if(results.bHit) resultingColor = UI_ADVENTURE_EFFECT_HIT_COLOUR;
          else {
            // Sound effects can go in here for missing, since the miss sound effect is the same regardless of the attacker
            aCombatMiss.rewind();
            aCombatMiss.play();
            resultingColor = UI_ADVENTURE_EFFECT_MISS_COLOUR;
          }
          
          // Finished with setting up the effect, we can now render it
          mAppMan.mSpriteMan.addDObject(new DisplayEffect(effectPos, UI_ADVENTURE_EFFECT_WIDTH, UI_ADVENTURE_EFFECT_HEIGHT, 
                                        results.sText + "\n" + results.iDamage, UI_ADVENTURE_EFFECT_DURATION, resultingColor));
          
          iTimer = 0;
        }
      }
    }
  }
  
  public boolean handleClicks() {
    return false;
  }
  
  public boolean handleRClicks() {
    return false;
  }
  
  public void enterCombat(int monsterType) {
    mParty.bInCombat = true;
    bPlayerTurn = true;
    
    // Draw up the monsters stats
    Monster newMonster = null;
    switch(monsterType) {
      case CR_RAT:
        newMonster = new Rat();
        break;
      case CR_SKELETON:
        newMonster = new Skeleton();
        break;
      case CR_GOBLIN:
        newMonster = new Goblin();
        break;
      case CR_ORC:
        newMonster = new Orc();
        break;
      case CR_BOSSRAT:
        newMonster = new BossRat();
        break;
      case CR_GUARDIAN:
        newMonster = new Guardian();
        break;
    }
    
    mMenu.setMonster(newMonster);
    mAppMan.mCreatureMan.addMonster(newMonster);
    
    mMenu.fPartyHitChance = generateChanceToHit(mParty.iAttack, newMonster.iDefense);
    mMenu.fMonsterHitChance = generateChanceToHit(newMonster.iAttack, mParty.iDefense);
  }

  // Returns whether the attack hit, the text we give on the effect comes from it, and the damage the attack dealt (0 on a miss)  
  private AttackData calculateAttack(Creature attacker, Creature defender) {
    AttackData results = new AttackData();
    
    float threshold = generateChanceToHit(attacker.iAttack, defender.iDefense);
    
    float randomRoll = random(1);
    
    if(randomRoll < threshold) {
      // Hit! Do damage
      results.iDamage = defender.takeDamage(attacker.iDamage);  // This returns the damage ACTUALLY dealt
      results.bHit = true;
    }
    
    results.generateEffectText();  // The damage won't matter if we miss anyways
    return results;
  }
  
  // The formula here is actually pretty complicated, but essentially
  //  The chance to hit increases by a factor of X for each multiple of the defense value the attack value has
  //  X is halved for each multiple
  //  And this goes in the opposite direction if you think of it as chances to miss
  //  So when A = D, chance = 50. When A = 2D, chance = 75. When 2A = D, chance = 25. When A = 3D, chance = 87.5. Etc.
  float generateChanceToHit(float A, float D){
    float largerMultiple;
    float smallerMultiple;
    if(A > D) {
      largerMultiple = A;
      smallerMultiple = D;
    } else {
      largerMultiple = D;
      smallerMultiple = A;
    }
    
    float multiple = (largerMultiple / smallerMultiple) - 1;
    float chanceModifier = 0;
    
    for (int i = 2; multiple > 0; i++) {
      if(! (multiple - 1 > 0) ) {
        chanceModifier += multiple * pow(0.5, i);
      } else {
        chanceModifier += pow(0.5, i);
      }
      
      multiple--;
    }
    
    if (A < D)
      chanceModifier *= -1;
      
    return chanceModifier + 0.5;
  }
  
  // Stores all the data from an attack 
  class AttackData {
    String sText;
    boolean bHit = false;
    int iDamage = 0;
    
    public void generateEffectText() {
      int randomNumber;
      
      if(!bHit) {
        randomNumber = int(random(10));
        switch(randomNumber) {
          case 0: sText = "whIff"; break;
          case 1: sText = "*duck*"; break;
          case 2: sText = "WHOosh"; break;
          case 3: sText = "BLOCK"; break;
          case 4: sText = "DODGE"; break;
          case 5: sText = "PARRY"; break;
          case 6: sText = "*avoid*"; break;
          case 7: sText = "BACKFLIP"; break;
          case 8: sText = "TING"; break;
          case 9: sText = "*sidestep*"; break;
        }
      } else {
        randomNumber = int(random(5)) + iDamage;
        switch(randomNumber){
          case 0: sText = "nick"; break;
          case 1: sText = "*oof*"; break;
          case 2: sText = "*wince*"; break;
          case 3: sText = "OOF"; break;
          case 4: sText = "STAB"; break;
          case 5: sText = "slllASH"; break;
          case 6: sText = "WHAAM"; break;
          case 7: sText = "ZAM"; break;
          case 8: sText = "CRACKk"; break;
          default: sText = "KAPOW!";
        }
      }
    }
  }
  
  // Called from the creature manager
  public void monsterDeath(Monster mon) {
    // Exit combat if we are in it
    if(mParty.bInCombat == true) {
      mParty.bInCombat = false;
      mMenu.mMonster = null;
      iTimer = 0;
      
      // Change the room to blank, unless we have other monsters coming in 
      mParty.mCurrentRoom.changeType(CR_EMPTY);
      
      // Reward the player for their success
      mParty.awardXP(mon.iXPreward);
      
      aCombatDeath.rewind();
      aCombatDeath.play();
      
      mAppMan.mSpriteMan.addDObject(new DisplayEffect(new PVector(mMenu.vPosition.x + UI_ADVENTURE_MARGIN, 
                                    mMenu.vPosition.y + (UI_ADVENTURE_MARGIN * 6)), (UI_ADVENTURE_STATPAGE_WIDTH * 2) - (UI_ADVENTURE_MARGIN * 2), 
                                    UI_ADVENTURE_EFFECT_HEIGHT, mon.iXPreward + " XP gained!", UI_ADVENTURE_EFFECT_DURATION * 3, color(240, 240, 60)), "menuElements");
                                    
      // If we killed a boss, then finish the game
      if(mon.sName == "Colossal Rat" || mon.sName == "Stone Guardian") {
        // Set up the player's info that we are carrying forward
        String level = "Level: " + mParty.iLevel;
        String xp = "Finishing XP: " + mParty.iXP + "/" + mParty.iXPtoNextLevel;
        String roomsPlaced = "Rooms Placed: " + mAppMan.mRoomMan.getNumberOfRooms();
        MenuPlayerInfo playerInfo = new MenuPlayerInfo(level, xp, roomsPlaced);        
        mAppMan.mGameMan.endGame(true, playerInfo);
      }
    }
  }
}

// Data that the Menu Panel which shows up at the end of the game needs
// This class is actually pretty bare-bones, and could be expaned upon when more stats are available
class MenuPlayerInfo {
  private String sLevel;
  private String sXP;
  private String sRoomsPlaced;
  
  MenuPlayerInfo(String level, String xp, String roomsPlaced) {
    sLevel = level;
    sXP = xp;
    sRoomsPlaced = roomsPlaced;
  }
  
  public String concatenateValues() {
    return sLevel + "\n" + sXP + "\n" + sRoomsPlaced;
  }
}

// Display details. Mostly pretty self-explanatory.
class AdventuringMenu extends DrawingObject {
  public Adventurer mParty;
  public Monster mMonster;
  public float fPartyHitChance;
  public float fMonsterHitChance;
  
  XPbar mXPbar;
  
  AdventuringMenu(Adventurer party) {
    super("menus");
    
    mParty = party;
    vPosition.x = ((width - (ROOM_SIZE * GRID_X)) / 2) - (UI_ADVENTURE_WIDTH / 2) + (ROOM_SIZE * GRID_X);
    vPosition.y = CARD_MARGIN; // Would add XP height here, but its more efficient to wait a bit.
    
    mXPbar = new XPbar(new PVector(vPosition.x, vPosition.y), mParty);
    
    vPosition.y += UI_ADVENTURE_XP_HEIGHT;
  }
  
  public void destructor() {
    mParty.delete();
    mXPbar.delete();
    delete();
  }
  
  public void setMonster(Monster mon) {
    mMonster = mon;
  }
  
  public void drawSelf() {
    fill(UI_COLOR);
    rect(vPosition.x, vPosition.y, UI_ADVENTURE_WIDTH, UI_ADVENTURE_HEIGHT);
    
    fill(FONT_COLOR);
    textAlign(LEFT);
    textSize(FONT_BIG_SIZE);
    
    text(mParty.sName, vPosition.x + UI_ADVENTURE_MARGIN, vPosition.y + UI_ADVENTURE_MARGIN, UI_ADVENTURE_STATPAGE_WIDTH);
    text("HP: " + mParty.iHP + "/" + mParty.iMaxHP, vPosition.x + UI_ADVENTURE_MARGIN, vPosition.y + (UI_ADVENTURE_MARGIN * 2), UI_ADVENTURE_STATPAGE_WIDTH);
    
    if(mParty.iAttack == mParty.iMaxAttack)
      text("Attack: " + mParty.iAttack, vPosition.x + UI_ADVENTURE_MARGIN, vPosition.y + (UI_ADVENTURE_MARGIN * 3), UI_ADVENTURE_STATPAGE_WIDTH);
    else
      text("Attack: " + mParty.iAttack + "/" + mParty.iMaxAttack, vPosition.x + UI_ADVENTURE_MARGIN, vPosition.y + (UI_ADVENTURE_MARGIN * 3), UI_ADVENTURE_STATPAGE_WIDTH);
    
    if(mParty.iDefense == mParty.iMaxDefense)
      text("Defense: " + mParty.iDefense, vPosition.x + UI_ADVENTURE_MARGIN, vPosition.y + (UI_ADVENTURE_MARGIN * 4), UI_ADVENTURE_STATPAGE_WIDTH);
    else
      text("Defense: " + mParty.iDefense + "/" + mParty.iMaxAttack, vPosition.x + UI_ADVENTURE_MARGIN, vPosition.y + (UI_ADVENTURE_MARGIN * 4), UI_ADVENTURE_STATPAGE_WIDTH);
     
    // Draw monster
    if(mMonster != null) {
      text(mMonster.sName, vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH, vPosition.y + UI_ADVENTURE_MARGIN, UI_ADVENTURE_STATPAGE_WIDTH);
      text("HP: " + mMonster.iHP + "/" + mMonster.iMaxHP, vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH, vPosition.y + (UI_ADVENTURE_MARGIN * 2), UI_ADVENTURE_STATPAGE_WIDTH);
      
      if(mMonster.iAttack == mMonster.iMaxAttack)
        text("Attack: " + mMonster.iAttack, vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH, vPosition.y + (UI_ADVENTURE_MARGIN * 3), UI_ADVENTURE_STATPAGE_WIDTH);
      else
        text("Attack: " + mMonster.iAttack + "/" + mMonster.iMaxAttack, vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH, vPosition.y + (UI_ADVENTURE_MARGIN * 3), UI_ADVENTURE_STATPAGE_WIDTH);
      
      if(mMonster.iDefense == mMonster.iMaxDefense)
        text("Defense: " + mMonster.iDefense, vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH, vPosition.y + (UI_ADVENTURE_MARGIN * 4), UI_ADVENTURE_STATPAGE_WIDTH);
      else
        text("Defense: " + mMonster.iDefense + "/" + mMonster.iMaxAttack, vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH, vPosition.y + (UI_ADVENTURE_MARGIN * 4), UI_ADVENTURE_STATPAGE_WIDTH);
      
      // Draw Hit probabilities
      text(fPartyHitChance * 100 + "%", vPosition.x + UI_ADVENTURE_MARGIN, vPosition.y + (UI_ADVENTURE_MARGIN * 5), UI_ADVENTURE_STATPAGE_WIDTH);
      text(fMonsterHitChance * 100 + "%", vPosition.x + UI_ADVENTURE_MARGIN + UI_ADVENTURE_STATPAGE_WIDTH, vPosition.y + (UI_ADVENTURE_MARGIN * 5), UI_ADVENTURE_STATPAGE_WIDTH);
    }
  }
}

class XPbar extends DrawingObject {  
  Adventurer mParty;
  
  XPbar(PVector pos, Adventurer party) {
    super("menuElements");
    vPosition = pos;
    mParty = party;
  }
  
  public void drawSelf() {
    fill(UI_XP_COLOUR_EMPTY);
    rect(vPosition.x, vPosition.y, UI_ADVENTURE_WIDTH, UI_ADVENTURE_XP_HEIGHT);
    
    fill(UI_XP_COLOUR_FILLED);
    noStroke();
    float percentageFilled = float(mParty.iXP) / float(mParty.iXPtoNextLevel);
    
    // If this overflows, add an if statement which is if percentageFilled is above 1, set it to 1
    rect(vPosition.x + UI_XP_FILLED_PADDING, vPosition.y + 1, percentageFilled * (UI_ADVENTURE_WIDTH - (2 * UI_XP_FILLED_PADDING)), UI_ADVENTURE_XP_HEIGHT);  // Widths get messed up because we don't have any stroke, which is pretty stupid but w/e
    
    // I'm resetting the stroke here because so far, all shapes need a border - but this can be easily changed by copying this to the beginning of every drawSelf function
    stroke(0, 0, 0);
  }
}

class DisplayEffect extends DrawingObject {
  static final int FONT_SIZE = 20;
  
  int iDurationRemaining;  // DisplayEffects dissapate over a period of time, so we need to know how long it's been, and when we can delete ourselves.
  int iWidth;
  int iHeight;
  String sText;
  color cColour;
  
  DisplayEffect(PVector pos, int w, int h, String text, int time, color col){
    super("menuElements");
    vPosition = pos;
    iWidth = w;
    iHeight = h;
    sText = text;
    iDurationRemaining = time;
    cColour = col;
  }
  
  public void drawSelf(){
    iDurationRemaining--;
    if(iDurationRemaining <= 0) {
      // Delete ourselves
      mAppMan.mSpriteMan.removeDObject(this);      
      return;
    }
    
    fill(cColour);
    rect(vPosition.x, vPosition.y, iWidth, iHeight);
    
    fill(FONT_COLOR);
    textAlign(CENTER);
    textSize(FONT_SIZE);
    text(sText, vPosition.x + (iWidth / 2), vPosition.y + (iHeight / 2));
  }
}
// Rooms are a class of card which are very common
// Other cards include items, room modifications, different types of doors, etc.
class Card extends ClickableObject {
  protected int iID;
  public String sTitleText;
  protected String sDescriptionText;
  
  // Stats: A -1 denotes this card does not utilise stats, and we don't need to specify them
  protected int iHP = -1;
  protected int iAtk = -1;
  protected int iDef = -1;
  protected int iDmg = -1;
  protected int iXPreward = -1;
  protected int iDifficulty = -1;
  
  protected color cFillColor = color(255, 255, 255);
  protected boolean bSelected = false;
  protected RoomData mData;
  
  // These variables are only used so we don't have to calculate it every frame
  protected PVector vSampleRoomPos = new PVector();
  
  Card() {
    super("default");
    mData = new RoomData(getType());
    iWidth = CARD_WIDTH;
    iHeight = CARD_HEIGHT;
  }
  
  public void setPos(PVector newPos) {
    vPosition = newPos;
    
    vSampleRoomPos.x = vPosition.x + CARD_WIDTH - ROOM_SIZE - CARD_MARGIN;
    vSampleRoomPos.y = vPosition.y + CARD_HEIGHT - ROOM_SIZE - CARD_MARGIN;
  }
  
  public boolean checkIfClicked() {
    if( (mouseX > vPosition.x && mouseX < (vPosition.x + CARD_WIDTH)) &&
        (mouseY > vPosition.y && mouseY < (vPosition.y + CARD_HEIGHT)) ) {
      //
      return true;
    }
    return false;
  }// This returns whether or not we were already selected or not
  public boolean select() {
    // Gray us out
    if(!bSelected) {
      cFillColor = color(124, 124, 124);
      bSelected = true; 
      return true;
    }
    
    return false;
  }
  
  // Similar to select()
  public boolean deSelect() {
    if (bSelected){
      // White us out
      cFillColor = color(255, 255, 255);
      bSelected = false;
      return true;
    }
    
    return false;
  }
  
  public void drawSelf() {
    // Draw a rectangle which is the back of the card
    fill(cFillColor);
    rect(vPosition.x, vPosition.y, CARD_WIDTH, CARD_HEIGHT);
    
    // TEXT
    fill(FONT_COLOR);
    textAlign(LEFT);
    
    // Title
    textSize(CARD_TITLE_SIZE);
    text(sTitleText, vPosition.x + CARD_MARGIN, vPosition.y + CARD_MARGIN, CARD_WIDTH - (2 * CARD_MARGIN), CARD_HEIGHT - (2 * CARD_MARGIN));
    
    // Description
    textSize(DESCRIPTION_SIZE);
    text(sDescriptionText, vPosition.x + CARD_MARGIN, vPosition.y + DESCRIPTION_POSITION.y + CARD_MARGIN, CARD_WIDTH - (2 * CARD_MARGIN), DESCRIPTION_HEIGHT);
    
    //---STATS---
    if(iHP != -1) {  // Only print if we are dealing with a card which has stats
      String difficultyText;
      switch(iDifficulty) {
        case 0:
          difficultyText = "Easy";
          break;
        case 1:
          difficultyText = "Challenging";
          break;
        case 2:
          difficultyText = "BOSS";
          break;
        default:
          difficultyText = "ERROR";
      }
      text("Difficulty: " + difficultyText, vPosition.x + CARD_MARGIN, vPosition.y + CARD_HEIGHT - (CARD_MARGIN * 12), CARD_WIDTH - (2 * CARD_MARGIN), DESCRIPTION_HEIGHT);
      
      text("HP: " + iHP, vPosition.x + CARD_MARGIN, vPosition.y + CARD_HEIGHT - (CARD_MARGIN * 10), CARD_WIDTH - (2 * CARD_MARGIN), DESCRIPTION_HEIGHT);
      text("Attack: " + iAtk, vPosition.x + CARD_MARGIN, vPosition.y + CARD_HEIGHT - (CARD_MARGIN * 8), CARD_WIDTH - (2 * CARD_MARGIN), DESCRIPTION_HEIGHT);
      text("Defense: " + iDef, vPosition.x + CARD_MARGIN, vPosition.y + CARD_HEIGHT - (CARD_MARGIN * 6), CARD_WIDTH - (2 * CARD_MARGIN), DESCRIPTION_HEIGHT);
      text("Damage: " + iDmg, vPosition.x + CARD_MARGIN, vPosition.y + CARD_HEIGHT - (CARD_MARGIN * 4), CARD_WIDTH - (2 * CARD_MARGIN), DESCRIPTION_HEIGHT);
      text("XP awarded: " + iXPreward, vPosition.x + CARD_MARGIN, vPosition.y + CARD_HEIGHT - (CARD_MARGIN * 2), CARD_WIDTH - (2 * CARD_MARGIN), DESCRIPTION_HEIGHT);
    }
    
    // Draw the sample room
    fill(COLOR_GHOST_ROOM);
    rect(vSampleRoomPos.x, vSampleRoomPos.y, ROOM_SIZE, ROOM_SIZE);
    
    mAppMan.mRoomMan.drawAccordingToRoom(mData.mExits, vSampleRoomPos);
  }
  
  public int getType() {  
    return -1;
  }
}

// This is sort of like a manager, but it doesn't actually track the cards generated - only the stats from them.
class CardGenerator {
  // This assignment is only so long so it'll work automagically with constants. Essentially reads as:
  //   Start at a negative value, so that our first few sets as determined by MINIMUM_SETS_UNTIL_STAIRS won't have any chance of spawning stairs.
  // I could probably condense some of this equation into a variable to make things run faster, if that's what it needs.
  public float fStairsProbability = 0 - (( 100 / (((SETS_IN_PHASE - 4) * SELECTION_SIZE) - (MINIMUM_SETS_UNTIL_STAIRS * SELECTION_SIZE)) ) * (MINIMUM_SETS_UNTIL_STAIRS * SELECTION_SIZE));  // Chance of stairs spawning
  
  Card generateRandomCard(int difficultyLevel) {
    // Generate rarity
    // 60% = 59- = Common
    // 30% = 60-89 = Uncommon
    // 10% = 90+ = Rare
    
    float rarity = random(100);
    
    // If the stairs haven't spawned already, get the appropriate pseudoRandom chance of that happening
    if(fStairsProbability != -10000 && rarity < fStairsProbability) {
      // Select one of the two possible bosses
      int selection = int(random(2));
      return createCard(CR_BOSSRAT + selection, difficultyLevel);
    } else {
      fStairsProbability += 100 / (((SETS_IN_PHASE - 4) * SELECTION_SIZE) - (MINIMUM_SETS_UNTIL_STAIRS * SELECTION_SIZE));
    }
    
    // I could keep the previous value set to rarity, but this would been that the more common cards become less common and replaced by stairs.
    //    While I wouldn't mind having a mechanic like this, it's probably better to do it on my own terms.
    rarity = random(100);
    
    if(rarity < 80) {         // Common
      return generateRandomCardByRarity(difficultyLevel, 0);
    } else {                  // Uncommon
      return generateRandomCardByRarity(difficultyLevel, 1);
    }
  }
  
  Card generateRandomCardByRarity(int difficultyLevel, int rarityLevel) {
    // An expandable solution
    // ArrayList doesn't work here, and it probably is less efficient than using a basic array anyways
    //int[] vPossibleList;
    int selection;
    int cardID;
    
    switch(rarityLevel) {
      case 0:
        selection = int(random(vCommons.length));
        return createCard(vCommons[selection], difficultyLevel);
      case 1:
        selection = int(random(vUncommons.length));
        return createCard(vUncommons[selection], difficultyLevel);
      default: 
      case 2:
        selection = int(random(vRares.length));
        return createCard(vRares[selection], difficultyLevel);
    }
  }
  
  private Card createCard(int id, int difficultyLevel) {
    if(id >= C_SIZE){
      return null;
    }
    if(id < 0){  
      return null;
    }
    
    switch(id){
      case CR_RAT:
        return new Card_Rat();
      case CR_SKELETON:
        return new Card_Skeleton();
      case CR_GOBLIN:
        return new Card_Goblin();
      case CR_ORC:
        return new Card_Orc();
      case CR_BOSSRAT:
        return new Card_BossRat();
      case CR_GUARDIAN:
        return new Card_Guardian();
      case CR_EMPTY:
        return new Card_EmptyRoom();
      case CR_HEALING:
        return new Card_Healing();
    }
    
    return null; // Shouldn't ever get here, but the compiler will complain if I don't put this here
  }
}
class Card_BossRat extends Card {
  
  Card_BossRat() {
    super();
    sTitleText = "Colossal Rat";
    sDescriptionText = "I don't think an exterminator is gonna cut it";
    
    iHP = MS_BOSSRAT_HP;
    iAtk = MS_BOSSRAT_ATK;
    iDef = MS_BOSSRAT_DEF;
    iDmg = MS_BOSSRAT_DMG;
    iXPreward = MS_BOSSRAT_XP;
    iDifficulty = MS_BOSSRAT_DIFF;
  }
  
  public int getType() {
    return CR_BOSSRAT;
  }
}
class Card_EmptyRoom extends Card {
  
  Card_EmptyRoom() {
    super();
    sTitleText = "Empty Room";
    sDescriptionText = "There is nothing special about this room.";
  }
  
  public int getType() {
    return CR_EMPTY;
  }
}
class Card_Goblin extends Card {
  
  Card_Goblin() {
    super();
    sTitleText = "Festering Goblin";
    sDescriptionText = "Feebly cowers behind a tiny defense value";
    
    iHP = MS_GOBLIN_HP;
    iAtk = MS_GOBLIN_ATK;
    iDef = MS_GOBLIN_DEF;
    iDmg = MS_GOBLIN_DMG;
    iXPreward = MS_GOBLIN_XP;
    iDifficulty = MS_GOBLIN_DIFF;
  }
  
  public int getType() {
    return CR_GOBLIN;
  }
}
class Card_Guardian extends Card {
  
  Card_Guardian() {
    super();
    sTitleText = "Stone Guardian";
    sDescriptionText = "Actually looks like it belongs here";
    
    iHP = MS_GUARDIAN_HP;
    iAtk = MS_GUARDIAN_ATK;
    iDef = MS_GUARDIAN_DEF;
    iDmg = MS_GUARDIAN_DMG;
    iXPreward = MS_GUARDIAN_XP;
    iDifficulty = MS_GUARDIAN_DIFF;
  }
  
  public int getType() {
    return CR_GUARDIAN;
  }
}
class Card_Healing extends Card {
  
  Card_Healing() {
    super();
    sTitleText = "Healing Spring";
    sDescriptionText = "Restores all HP the first time an injured player enters.";
  }
  
  public int getType() {
    return CR_HEALING;
  }
}
class Card_Orc extends Card {
  
  Card_Orc() {
    super();
    sTitleText = "Orc";
    sDescriptionText = "Need something bigger than a newspaper for this one";
    
    iHP = MS_ORC_HP;
    iAtk = MS_ORC_ATK;
    iDef = MS_ORC_DEF;
    iDmg = MS_ORC_DMG;
    iXPreward = MS_ORC_XP;
    iDifficulty = MS_ORC_DIFF;
  }
  
  public int getType() {
    return CR_ORC;
  }
}
class Card_Rat extends Card {
  
  Card_Rat() {
    super();
    sTitleText = "Giant Rat";
    sDescriptionText = "When experimental brews of beer go horribly wrong";
    
    iHP = MS_RAT_HP;
    iAtk = MS_RAT_ATK;
    iDef = MS_RAT_DEF;
    iDmg = MS_RAT_DMG;
    iXPreward = MS_RAT_XP;
    iDifficulty = MS_RAT_DIFF;
  }
  
  public int getType() {
    return CR_RAT;
  }
}
class Card_Skeleton extends Card {
  
  Card_Skeleton() {
    super();
    sTitleText = "Skeleton";
    sDescriptionText = "A spooky scary monster";
    
    iHP = MS_SKELETON_HP;
    iAtk = MS_SKELETON_ATK;
    iDef = MS_SKELETON_DEF;
    iDmg = MS_SKELETON_DMG;
    iXPreward = MS_SKELETON_XP;
    iDifficulty = MS_SKELETON_DIFF;
  }
  
  public int getType() {
    return CR_SKELETON;
  }
}
// All global constants, seperated by their primary file

// ---MULTIPLE FILES---
final int UI_COLOR = color(200, 200, 200);
final int UI_HIGHLIGHT = color(240, 240, 240);

final int TITLE_SIZE = 36;  // Not actually used in game, but used for menus
final int FONT_BIG_SIZE = 26;  // Used primarily in the adventuring phase to display stats, also used for big text within menus
final int FONT_DESCRIPTION_SIZE = 16;  // Used for detailed sized words

// ---GAME MANAGER---
final int UI_MENUPANEL_PADDING = 30;

// ---ROOM MANAGER---
final int GRID_X = 10;
final int GRID_Y = 10;
final int ROOM_SIZE = 60;
final int ENTRANCE_SIZE = 10;
final int FONT_SYMBOL_SIZE = 24;       // Only for rooms

final color COLOR_NULL_ROOM = color(155, 155, 155);
final color COLOR_DEFAULT_ROOM = color(255, 255, 255);
final color COLOR_FOW_NULL = color(10, 10, 10);
final color COLOR_FOW_DEFAULT = color(109, 109, 109);
final color COLOR_GHOST_ROOM = color(90, 90, 90);
final color COLOR_CONFIRMED_PLACEMENT = color(50, 200, 50);
final color COLOR_DISABLED_ROOM = color(240, 50, 50);
final color COLOR_ENTRANCE_DEFAULT = color(230, 155, 155);

final int ENTRANCE_X = 5;
final int ENTRANCE_Y = 5;

// ---ADVENTURE MANAGER---
final int PLAYER_SIZE = 40;
final int CREATURE_SPEED = 2;
final color PLAYER_COLOR = color(130, 255, 130);
final int TURN_TIME = 70;

final int UI_ADVENTURE_WIDTH = 600;
final int UI_ADVENTURE_HEIGHT = 510;
final int UI_ADVENTURE_MARGIN = 50;
final int UI_ADVENTURE_XP_HEIGHT = UI_ADVENTURE_MARGIN; 
final int UI_ADVENTURE_STATPAGE_WIDTH = (UI_ADVENTURE_WIDTH - UI_ADVENTURE_MARGIN) / 2;
final int UI_ADVENTURE_STATPAGE_HEIGHT = ((UI_ADVENTURE_HEIGHT - UI_ADVENTURE_MARGIN) / 2) - (UI_ADVENTURE_MARGIN * 2);
final int UI_ADVENTURE_EFFECT_WIDTH = 175;
final int UI_ADVENTURE_EFFECT_HEIGHT = 100;
final int UI_ADVENTURE_EFFECT_HIT_COLOUR = color(170, 80, 80);
final int UI_ADVENTURE_EFFECT_MISS_COLOUR = color(240, 240, 240);
final int UI_ADVENTURE_EFFECT_DURATION = 70;

final color UI_XP_COLOUR_EMPTY = color(120, 120, 120);
final color UI_XP_COLOUR_FILLED = color(220, 220, 120);
final int UI_XP_FILLED_PADDING = 5;

// ---CARD---
final int CARD_WIDTH = 200;
final int CARD_HEIGHT = 300;
final int CARD_MARGIN = 10;
final PVector TITLE_POSITION = new PVector(20, 10);
final int CARD_TITLE_SIZE = 16;
final PVector DESCRIPTION_POSITION = new PVector(20, 25);
final int DESCRIPTION_HEIGHT = 120;
final int DESCRIPTION_SIZE = 12;
final PVector PORTRAIT_POSITION = new PVector(5, 40);
final color FONT_COLOR = color(0, 0, 0);

// ---DungeonBuilder---
// These constants are a bit more scattered than I would have liked them to be, because some are calculated other constants, etc.
final int SELECTION_SIZE = 3;
final int SELECTION_Y = 100;
final int SELECTION_SPACING = CARD_WIDTH / 10;

final int MINIMUM_SETS_UNTIL_STAIRS = 6;

final int UI_DB_INFO_X = (CARD_WIDTH / 10) + (ROOM_SIZE * GRID_X);
final int UI_DB_INFO_Y = 20;
final int UI_DB_INFO_WIDTH = (SELECTION_SIZE * CARD_WIDTH) + ( ( SELECTION_SIZE - 1) * SELECTION_SPACING);
final int UI_DB_INFO_HEIGHT = int((SELECTION_Y - UI_DB_INFO_Y) * 0.95);

// This stuff will almost certainly need to be renamed or removed eventually
final int BUTTON_WIDTH = 110;
final int BUTTON_HEIGHT = 110;
final int BUTTON_X = 1120;
final int BUTTON_Y = 560;

final int SETS_IN_PHASE = 16;

// ---MENU MANAGER---
final int MENU_BUTTON_START_HEIGHT = 30;

// ---SPRITE MANAGER---
final color BG_COLOR = color(0, 0, 0);
final color BUTTON_COLOR = color(240, 240, 240);
final int BUTTON_LABEL_SIZE = 18;
// Will become more relevant as creatures roam around before the adventuring phase starts
class CreatureManager {
  ArrayList<Creature> vCreatures;
  ArrayList<Monster> vMonsters;
  
  AdventureManager mAdventureMan;
  
  CreatureManager() {
    vCreatures = new ArrayList<Creature>();
    vMonsters = new ArrayList<Monster>();
  }
  
  Creature getCreatureInRoom(Room targetRoom) {
    for(int i = 0; i < vCreatures.size(); i++)
      if(vCreatures.get(i).mCurrentRoom == targetRoom)
        return vCreatures.get(i);
    return null;
  }
  
  void addMonster(Monster mon) {
    vMonsters.add(mon);
  }
  
  void killMonster(Monster mon) {
    mAdventureMan.monsterDeath(mon);
    
    vMonsters.remove(vMonsters.indexOf(mon));
    mon = null;
  }
  
  void removeMonster(Monster mon) {
    vMonsters.remove(mon);
  }
  
  void addCreature(Creature creat) {
    vCreatures.add(creat);
  }
  
  void removeCreature(Creature creat) {
    vCreatures.remove(creat);
  }
}

class Creature extends DrawingObject {
  // Stats
  public String sName;
  public int iMaxHP;
  public int iMaxAttack;
  public int iMaxDefense;
  public int iHP;
  public int iAttack;
  public int iDefense;
  public int iDamage;
  
  protected color cColor;
  protected PVector vDestinationPosition;  // Where the sprite is travelling to
  Room mCurrentRoom;
  
  Creature() {
    super("creatures");
    vDestinationPosition = vPosition;
  }
  
  // Typically used after max stats have been initialized. This would go in the constructor if super() didn't have to be the very first thing in a constructor.
  protected void refreshStats() {
    iHP = iMaxHP;
    iAttack = iMaxAttack;
    iDefense = iMaxDefense;
  }
  
  protected void onDeath() {
    // Override me!
  }
  
  public int takeDamage(int amount) { // Returns true damage (damage less armor or any other resistances
    iHP -= amount;
    
    if(iHP <= 0) {
      onDeath();
    }
    
    return amount;  // Not too useful at the current build
  }
  
  // I wrote this function in regards to creatures roaming around by themselves, but that isn't necessary in this current build - but there's not sense throwing away good code.
  public void drawSelf() {
    // If our vPosition is not appropriate to what our mCurrentRoom's position is, then we need to have a talk
    if(vPosition != vDestinationPosition) {
      if(vPosition.x < vDestinationPosition.x) {
        vPosition.x += CREATURE_SPEED;
        if (vPosition.x > vDestinationPosition.x)
          vPosition.x = vDestinationPosition.x;
      } else if(vPosition.x > vDestinationPosition.x) {
        vPosition.x -= CREATURE_SPEED;
        if (vPosition.x < vDestinationPosition.x)
          vPosition.x = vDestinationPosition.x;
      }
      
      if(vPosition.y < vDestinationPosition.y) {
        vPosition.y += CREATURE_SPEED;
        if (vPosition.y > vDestinationPosition.y)
          vPosition.y = vDestinationPosition.y;
      } else if(vPosition.y > vDestinationPosition.y) {
        vPosition.y -= CREATURE_SPEED;
        if (vPosition.y < vDestinationPosition.y)
          vPosition.y = vDestinationPosition.y;
      }
    }
    
    fill(cColor);
    rect(vPosition.x, vPosition.y, PLAYER_SIZE, PLAYER_SIZE);
  }
}

class Monster extends Creature {
  // Monster-specific stats
  public int iXPreward;
  
  Monster() {
    super();
  }
  
  protected void onDeath() {
    mAppMan.mCreatureMan.killMonster(this);
  }
  
  public void drawSelf() {
    // Maybe in a future build, monsters will be drawn - probably only when they walk around between rooms in the dungeon building phase
  }
}

class Rat extends Monster {
  Rat() {
    super();
    
    sName = "Giant Rat";
    iMaxHP = MS_RAT_HP;
    iMaxAttack = MS_RAT_ATK;
    iMaxDefense = MS_RAT_DEF;
    iDamage = MS_RAT_DMG;
    iXPreward = MS_RAT_XP; 
    
    refreshStats();
  }
}

class Skeleton extends Monster {
  Skeleton() {
    super();
    
    sName = "Skeleton";
    iMaxHP = MS_SKELETON_HP;
    iMaxAttack = MS_SKELETON_ATK;
    iMaxDefense = MS_SKELETON_DEF;
    iDamage = MS_SKELETON_DMG;
    iXPreward = MS_SKELETON_XP; 
    
    refreshStats();
  }
}

class Goblin extends Monster {
  Goblin() {
    super();
    
    sName = "Goblin";
    iMaxHP = MS_GOBLIN_HP;
    iMaxAttack = MS_GOBLIN_ATK;
    iMaxDefense = MS_GOBLIN_DEF;
    iDamage = MS_GOBLIN_DMG;
    iXPreward = MS_GOBLIN_XP; 
    
    refreshStats();
  }
}

class Orc extends Monster {
  Orc() {
    super();
    
    sName = "Orc";
    iMaxHP = MS_ORC_HP;
    iMaxAttack = MS_ORC_ATK;
    iMaxDefense = MS_ORC_DEF;
    iDamage = MS_ORC_DMG;
    iXPreward = MS_ORC_XP; 
    
    refreshStats();
  }
}

class BossRat extends Monster {
  BossRat() {
    super();
    
    sName = "Colossal Rat";
    iMaxHP = MS_BOSSRAT_HP;
    iMaxAttack = MS_BOSSRAT_ATK;
    iMaxDefense = MS_BOSSRAT_DEF;
    iDamage = MS_BOSSRAT_DMG;
    iXPreward = MS_BOSSRAT_XP;
    
    refreshStats();
  }
}

class Guardian extends Monster {
  Guardian() {
    super();
    
    sName = "Stone Guardian";
    iMaxHP = MS_GUARDIAN_HP;
    iMaxAttack = MS_GUARDIAN_ATK;
    iMaxDefense = MS_GUARDIAN_DEF;
    iDamage = MS_GUARDIAN_DMG;
    iXPreward = MS_GUARDIAN_XP;
    
    refreshStats();
  }
}

class Adventurer extends Creature {
  static final int PLAYER_LEVEL1_REQ_XP = 100;
  static final int PLAYER_REQ_XP_INC = 50;
  
  // Adventurer-specific stats
  private int iXP;
  private int iXPtoNextLevel = PLAYER_LEVEL1_REQ_XP;
  private int iLevel = 1;
  
  private ArrayList<Room> vVisitedRooms;
  private ArrayList<Room> vPath;
  private boolean bInCombat = false;
  
  // Sound effects
  customAudioSnippet aHeal;
  customAudioSnippet aMove;
  customAudioSnippet aLevelUp;
  
  Adventurer(Room startingLocation) {
    super();
    
    // Sound effects
    aHeal = new customAudioSnippet("heal.wav");
    aMove = new customAudioSnippet("move.wav");
    aLevelUp = new customAudioSnippet("levelup.wav");
    
    // Stat modifications
    sName = "Gilligan";
    iMaxHP = PLAYER_STAT_HP;
    iMaxAttack = PLAYER_STAT_ATTACK;
    iMaxDefense = PLAYER_STAT_DEFENSE;
    iDamage = PLAYER_STAT_DAMAGE;
    
    refreshStats();
    
    cColor = PLAYER_COLOR;
    
    vVisitedRooms = new ArrayList<Room>();
    vDestinationPosition = new PVector();
    vPath = new ArrayList<Room>();
    
    teleportTo(startingLocation);
  }
  
  public void onDeath(){
    // End the game
    // Compile all the string info we need
    String level = "Level: " + iLevel;
    String xp = "Finishing XP: " + iXP + "/" + iXPtoNextLevel;
    String roomsPlaced = "Rooms Placed: " + mAppMan.mRoomMan.getNumberOfRooms();
    MenuPlayerInfo playerInfo = new MenuPlayerInfo(level, xp, roomsPlaced); 
    mAppMan.mGameMan.endGame(false, playerInfo);
  }
  
  public void takeTurn() {
    // If we are in a room, check to see if any of its entrances have been put into our databse of listed already entered entrances
    //   Entrances will have to be made into a class which stores its ID because of that
    // If any exits aren't in vChecked Exits
    //    Walk through them
    // Else
    //    Find the nearest exit that we haven't travelled to
    //    Set our current path to get there
    if(vPath.size() == 0)
      setPath();
      
    // Progress on our path
    if(vPath.size() != 0) {
      aMove.rewind();
      aMove.play();
      
      changeRoom(vPath.get(0));
      vPath.remove(0);
    }
    else{
      // Exit the game?
    }
  }
  
  // See if this room is already entered into our vCheckedRooms array
  private boolean getVisited(Room checkingRoom) {
    for (int i = 0; i < vVisitedRooms.size(); i++)
      if(checkingRoom == vVisitedRooms.get(i) )
        return true;
    return false;
  }
  
  public void awardXP(int amount) {
    iXP += amount;
    
    while (iXP >= iXPtoNextLevel) {
      // Most of this could be moved into a function so that we can manually level the player up, but it is so completely
      // and wholely unnecessary for this prototype I left it out.
      aLevelUp.rewind();
      aLevelUp.play();
      
      iXP -= iXPtoNextLevel;
      iXPtoNextLevel += PLAYER_REQ_XP_INC;
      
      // Display a message which the player must click to advance
      iLevel++;
      // Stat increase
      int hpInc = int(random(5)) + 5;
      int atkInc = int(random(3)) + 2;
      int defInc = int(random(3)) + 2;
      int dmgInc = int(random(1));
      
      modifyStatMax(S_HP, hpInc);
      modifyStatMax(S_ATK, atkInc);
      modifyStatMax(S_DEF, defInc);
      modifyStatMax(S_DMG, dmgInc);
    }
  }
  
  public void modifyStatMax(int statID, int amount) {
    switch(statID) {
      case S_HP:
        iMaxHP += amount;
        break;
      case S_ATK:
        iMaxAttack += amount;
        break;
      case S_DEF:
        iMaxDefense += amount;
        break;
      case S_DMG:
        //iMaxDamage += amount;
        iDamage += amount;
        break;
    }
    
    modifyStat(statID, amount);
  }
  
  // Can increase or decrease. A 0 means restore to full, so don't ever pass that in by accident.
  public void modifyStat(int statID, int amount) {
    if(amount == 0) {
      aHeal.rewind();
      aHeal.play();
    }
      
    switch(statID) {
      case S_HP:
        if(amount != 0) {
          iHP += amount;
          if(iHP > iMaxHP) iHP = iMaxHP;
          else if(iHP < 0) iHP = 1;  // this means you cannot die using this function. I figure it might work for poisons
        } else 
          iHP = iMaxHP;
        break;
      case S_ATK:
        if(amount != 0) {
          iAttack += amount;
          if(iAttack > iMaxAttack) iAttack = iMaxAttack;
          else if(iAttack < 0) iAttack = 1;
        } else 
          iAttack = iMaxAttack;
        break;
      case S_DEF:
        if(amount != 0) {
          iDefense += amount;
          if(iDefense > iMaxDefense) iDefense = iMaxDefense;
          else if(iDefense < 0) iDefense = 1;
        } else 
          iDefense = iMaxDefense;
        break;
        // Damage does not currently have a maximum, and so I'm holding off on giving it it's own slice of the Switch pie until it does
    }
  }
  
  public void setPath() {
    // Check if we haven't been to any of the adjacent rooms
    ArrayList<Room> adjacentRooms = mCurrentRoom.getTraversableRooms();
    ArrayList<Room> unvisitedRooms = new ArrayList<Room>();
    for( int i = 0; i < adjacentRooms.size(); i++) {
      if(! getVisited(adjacentRooms.get(i)) ){
        // Set our path to go into the unexplored room
        unvisitedRooms.add(adjacentRooms.get(i));
      }
    }
    
    if(unvisitedRooms.size() != 0) {
      int choice = int(random(unvisitedRooms.size()));
      vPath.add(unvisitedRooms.get(choice));
      return;
    }
    
    // We have been to every room we are currently adjacent to. We'll need to forge a path to the nearest room.
    ArrayList<Room> tempArray = pathToNearestUnchecked();
    if(tempArray != null){
      for(int i = tempArray.size() - 1; i >= 0; i--)
        vPath.add(tempArray.get(i));
    }
    // Otherwise, we are at the end of our rope
  }
  
  ArrayList<Room> pathToNearestUnchecked() {
    // -----PHASE ONE-----
    // Create pathfinding map
    
    ArrayList<Room> vRoomQueue = new ArrayList<Room>();                  // The nodes waiting to be assessed (MainNode)
    ArrayList<struct_room> vCheckedRooms = new ArrayList<struct_room>();  // The nodes already checked and assigned a value (Struct_PathfindingNode). This CAN exist in both arrays at once.
    
    vRoomQueue.add(mCurrentRoom);
    
    // Assign the start node values in vCheckedRooms (predecessor not required)
    vCheckedRooms.add( new struct_room(vRoomQueue.get(0), null, 0) );
    
    // Main Loop
    // Get the first node in vRoomQueue
    //    Check adjacent Nodes
      //    If they already exist in vCheckedRooms, then check that checkedNode's f_score. 
      //      If it is higher than it would be for us (i.e. the current f_score + 1)
      //        Remove that checkedNode. Add it to vRoomQueue. Assign it in vCheckedRooms.
      //    else Add it to vRoomQueue. Assign it in vCheckedRooms.
    //  Remove the checkingNode from vRoomQueue. 
    ArrayList<Room> vAdjacentNodes;
    Room mAdjacentRoom;
    // These nodes are so we don't have to repeat the fairly length process of checking the arrays for structs with the correct name. structNodeThis = vRoomQueue[0], structNodeOther = adjacentNode
    struct_room mStructNodeThis;
    struct_room mStructNodeOther;
    
    int iterations = 0;
    
    while(vRoomQueue.size() > 0){
      // For each adjacent node to the first node in vRoomQueue
      vAdjacentNodes = vRoomQueue.get(0).getTraversableRooms();
        
      // Go through each of the rooms adjacent to this one
      while(vAdjacentNodes.size() > 0) {
        mAdjacentRoom = vAdjacentNodes.get(0);
          
        // Saving these so we don't need to call the function a bunch of times
        //structNodeOther = vCheckedRooms.Find(function(x) x => x.parentNode == adjacentNode);    
        mStructNodeOther = getStructByRoom(vCheckedRooms, mAdjacentRoom);
        mStructNodeThis = getStructByRoom(vCheckedRooms, vRoomQueue.get(0));
        
        if(mStructNodeOther != null){                        // If this adjacentNode has already been entered as a struct            
          if(mStructNodeOther.f_score > mStructNodeThis.f_score + 1){            // And the f_score we'd assign to it is lower than what it already has
            vCheckedRooms.remove(mStructNodeOther);                  // Remove it from the list and proceed normally with assigning its values
            struct_room newStruct = new struct_room(mAdjacentRoom, mStructNodeThis, mStructNodeThis.f_score + 1);
            
            vCheckedRooms.add(newStruct);  // Standard procedure
            vRoomQueue.add(newStruct.mParentRoom);
          }
                                              // Otherwise, back away slowly.
        }
        else{                                    // If adjacentNode hasn't seen vCheckedRooms before
          struct_room newStruct = new struct_room(mAdjacentRoom, mStructNodeThis, mStructNodeThis.f_score + 1);
          vRoomQueue.add(newStruct.mParentRoom);
          vCheckedRooms.add(newStruct);
        }
        
        // If this adjacent room is the room we are looking for, then we can return our accurate list of checked rooms
        if(!getVisited(mAdjacentRoom)){  // Replace this line to change the qualifiers for what we are searching for
          ArrayList<Room> returnValue = new ArrayList<Room>();
          struct_room currentStruct = vCheckedRooms.get(vCheckedRooms.size() - 1);
          
          while(currentStruct.f_score > 0) {
            returnValue.add(currentStruct.mParentRoom);
            currentStruct = currentStruct.mPredecessor;
          }
          
          return returnValue;
        }
        
        // We have checked everything we can with this node in the vRoomQueue. Therefore, remove it from the vRoomQueue.
        vAdjacentNodes.remove(0);
      }
      
      vAdjacentNodes = null;
      vRoomQueue.remove(0);
    }
    
    // We didn't find anything we haven't visited. This is where we fly our victory screen/go to the stairs
    return null;
  }
  
  private void changeRoom(Room newRoom) {
    switch(newRoom.mData.eType) {
      case CR_NULL:
        return;
      case CR_RAT:
      case CR_SKELETON:
      case CR_GOBLIN:
      case CR_ORC:
      case CR_BOSSRAT:
      case CR_GUARDIAN:
        mAppMan.mGameMan.mStateManager.enterCombat(newRoom.mData.eType);
        bInCombat = true;
        break;
      case CR_HEALING:
        modifyStat(S_HP, 0);
        newRoom.changeType(CR_EMPTY);
        break;
      default:
        // Stairs and blank go here
    }
    
    mCurrentRoom = newRoom;
    vDestinationPosition.x = (mCurrentRoom.vPosition.x * ROOM_SIZE) + (ROOM_SIZE / 2) - (PLAYER_SIZE / 2);
    vDestinationPosition.y = (mCurrentRoom.vPosition.y * ROOM_SIZE) + (ROOM_SIZE / 2) - (PLAYER_SIZE / 2);
    
    if(!getVisited(newRoom)){
      vVisitedRooms.add(newRoom);
      newRoom.light();
    }
  }
  
  // Forcibly teleport the player to a room. There will be no traversal animation.
  private void teleportTo(Room newRoom) {
    changeRoom(newRoom);
    vPosition.x = vDestinationPosition.x;
    vPosition.y = vDestinationPosition.y;
  }
}

// For pathfinding only
class struct_room {
  public Room mParentRoom;
  public struct_room mPredecessor;
  public int f_score;
  
  struct_room(Room parent, struct_room predecessor, int f) {
    mParentRoom = parent;
    mPredecessor = predecessor;
    f_score = f;
  }
}

// Checks to see if this room has already been entered as a struct into the checked list for pathfinding.
// Returns null if it has not been entered.
struct_room getStructByRoom(ArrayList<struct_room> checkedList, Room inputRoom) {
  for(int i = 0; i < checkedList.size(); i++) {
    if(checkedList.get(i).mParentRoom == inputRoom)
      return checkedList.get(i);
  }
  
  return null;
}
// Info panel
// Stores relevant data and methods from GameManager
class DungeonBuilder extends SubManager{
  private CardGenerator mCardGen;
  
  private Card[] vCards;
  private int iSelectedCard = -1;  // the index in vCards of the selected card
  private GhostRoom mPlacementRoom;
  private InfoPanel mInfoHeader;
  
  // Sound
  private customAudioSnippet aRoomPlaced;
  private customAudioSnippet aStartGame;
  
  DungeonBuilder() {
    vCards = new Card[SELECTION_SIZE];
    mCardGen = new CardGenerator();
    
    // The exit button, anall that nonsense
    aStartGame = new customAudioSnippet("start_game.wav");
    aStartGame.play(); 
    aRoomPlaced = new customAudioSnippet("room_placement.wav");
    
    mInfoHeader = new InfoPanel();
  }
  
  public void destructor() {
    // Dim all the rooms. If we are exit  ing from the dungeon builder to the menu, then we won't need this step?
    mAppMan.mRoomMan.dimRooms();
    mAppMan.mRoomMan.finalizeRooms();
    
    deleteSelection();
    mPlacementRoom = null;
    mInfoHeader.delete();
    mInfoHeader = null;
  }
  
  // Returns true if we clicked something relevant  
  public boolean handleClicks() {
    
    // Check to see if the mouse is over a card
    for (int i = 0; i < SELECTION_SIZE; i++) {
      if(checkIfMousedOver(i) ) {
        // If we have already selected this card, de-select it
        if(vCards[i].select()) {
          if(iSelectedCard != -1){
            mPlacementRoom.delete();
            mPlacementRoom = null;
            vCards[iSelectedCard].deSelect();
          }
          
          iSelectedCard = i;
          mPlacementRoom = new GhostRoom(vCards[i].mData);
        }
        else{
          mPlacementRoom.delete();
          mPlacementRoom = null;
          vCards[i].deSelect();
          iSelectedCard = -1;
        }
        return true;
      }
    }
    // If we have already selected a card, and we are moused over a room, then activate it
    if(iSelectedCard > -1) {
      Room gridPlacement = mAppMan.mRoomMan.getRoomAtMouse();

      if(gridPlacement != null && mPlacementRoom.bDisabled == false) {
        // Deselect the room
        // Set the gridPlacement room to have the data of the ghostroom
        iSelectedCard = -1;
        
        // Sound Effects
        aRoomPlaced.rewind();
        aRoomPlaced.play();
        
        // If we are placing a boss, let the card generator know not to spawn another one - since we only want one
        if(mPlacementRoom.mData.eType == CR_BOSSRAT || mPlacementRoom.mData.eType == CR_GUARDIAN )
          mCardGen.fStairsProbability = -10000;  // This will actually cause problems if fStairsProbability starts lower than this, but that would be bizzare
        
        // Put the room in the room manager
        gridPlacement.setRoom(mPlacementRoom.mData);
        mPlacementRoom.delete();
        mPlacementRoom = null;
        
        // Generate a new selection to finish it off
        generateSelection();
        return true;
      }
    }
    return false;
  }
  
  public boolean handleRClicks() {
    // Rotate the room we are holding if we have one selected
    if (mPlacementRoom != null) {
      mPlacementRoom.mData.rotateEntrances();
      
      return true;
    }
    return false;
  }
  
  // cardID = the index of the prospective card
  private boolean checkIfMousedOver(int cardID){
    if(mouseX > vCards[cardID].vPosition.x &&
       mouseX < vCards[cardID].vPosition.x + CARD_WIDTH &&
       mouseY > vCards[cardID].vPosition.y &&
       mouseY < vCards[cardID].vPosition.y + CARD_HEIGHT)
         return true;
    return false;
  }
  
  private void deleteSelection() {
    if(vCards[0] != null)
      for(int i = 0; i < SELECTION_SIZE; i++)
        vCards[i].delete();
  }
  
  public void generateSelection() {
    deleteSelection();
    
    mInfoHeader.iSetsUsed++;
    if(mInfoHeader.iSetsUsed >= SETS_IN_PHASE) {
      mAppMan.mGameMan.changeState(GS_ADVENTURING);
      return;
    }
    
    RoomData[] vRoomChoices = new RoomData[SELECTION_SIZE];
    int iRandomNumber;
    int cardPositionX = ROOM_SIZE * GRID_X - CARD_WIDTH;
      
    for(int i = 0; i < SELECTION_SIZE; i++) {
      // Random ID selector (have this change according to balance? Look up how Hearthstone does it)
      // If we have such things as card rarity, we can have a selection be exclusively filled up with a certain rarity. This might be going outside the scope of what is possible for the prototype.
      iRandomNumber = int(random(C_SIZE));
      
      cardPositionX += CARD_WIDTH + (CARD_WIDTH / 10);
      vCards[i] = mCardGen.generateRandomCard(0);      // Change 0 to whatever difficulty level it is
      vCards[i].setPos(new PVector(cardPositionX, SELECTION_Y));
    }
    
    // Before we're done here, we need to check to see if none of these rooms can be placed
    //  If so, end the game unless a boss hasn't been put down
    //  In which case, give a relevant game over message
    ArrayList<Room> roomsWithOpenExits = mAppMan.mRoomMan.getSpacesWithExits();
    
    if(roomsWithOpenExits.size() != 0) {
      for(int card = 0; card < SELECTION_SIZE; card++) {       // We need to go through this check for each card
        for(int i = 0; i < roomsWithOpenExits.size(); i++) {
          // Rotate it so that it fits
          for(int rotation = 0; rotation < 4; rotation++) {
            if(mAppMan.mRoomMan.checkEntrancesCompatible(roomsWithOpenExits.get(i).vPosition, vCards[card].mData.mExits) )
              return;
            // Not compatible - try rotating
            vCards[card].mData.rotateEntrances();
          }
        }
      }
    }
    
    // If we got to this point, its because we weren't safely returned, which means check for GG
    if(mAppMan.mRoomMan.getBossRoom() == null) {
      mAppMan.mGameMan.endGame(false, null);
      return;
    }
    
    mAppMan.mGameMan.changeState(GS_ADVENTURING);
  }
}

class InfoPanel extends DrawingObject {
  private int iSetsUsed = -1;           // How many sets have been given to the player.
  
  InfoPanel() {
    super("menus");
    
    vPosition.x = UI_DB_INFO_X;
    vPosition.y = UI_DB_INFO_Y;
  }
  
  public void drawSelf() {
    // Background
    fill(UI_COLOR);
    rect(vPosition.x, vPosition.y, UI_DB_INFO_WIDTH, UI_DB_INFO_HEIGHT);
    
    // Text
    fill(FONT_COLOR);
    textSize(FONT_BIG_SIZE);
    textAlign(CENTER);
    
    text("Build the dungeon for the adventurer", vPosition.x, vPosition.y + 5, UI_DB_INFO_WIDTH, UI_DB_INFO_HEIGHT);
    
    textSize(FONT_DESCRIPTION_SIZE);
    text("Rooms left to place: " + iSetsUsed + "/" + SETS_IN_PHASE, vPosition.x, vPosition.y + 35, UI_DB_INFO_WIDTH, UI_DB_INFO_HEIGHT); 
  }
}
class GameManager {
  private int eState;
  private SubManager mStateManager;
  private MenuPanel mMenu;
  private boolean bPaused = false;
  
  GameManager() {
    changeState(GS_MAIN_MENU);
  }
  
  public void startNewLevel() {
    changeState(GS_DB);
    //changeState(GS_ADVENTURING);
  }
  
  private void gameLoop(){
    if(!bPaused && mStateManager != null)
      mStateManager.gameLoop();
  }
  
  private void changeState(int newState){
    if(newState < 0 || newState > GS_SIZE) {
      return;
    }
    
    eState = newState;
    
    // Exit gracefully from our current state
    if(mStateManager != null)
      mStateManager.destructor();
    
    switch(newState) {
      case GS_MAIN_MENU:
        mStateManager = new MenuManager();
        mAppMan.mRoomMan.removeRooms();
        break;
      case GS_DB: 
        mAppMan.mRoomMan.setupRooms();
        mStateManager = new DungeonBuilder();
        mStateManager.generateSelection();
        break;
      case GS_ADVENTURING:
        mStateManager = new AdventureManager();
        break;
    }
  }
  
  public void endGame(boolean victory, MenuPlayerInfo player) {
    // In the final game, its likely to be a crawl-until-you-drop strategy, which makes 'victory' pointless
    bPaused = true;
    
    String headerText;
    String subText;
    String detailText;
  
    // If the player info is null, that means the game ended in the dungeon building phase - 
    //    which means the player locked themselves out of being able to spawn a boss room
    if(player != null) { 
      if(victory) {
        headerText = "Victory!";
        subText = "Pizza party time!";
      } else {
        headerText = "Defeat...";
        subText = "Why do adventurers always screw you over?";
      }
      detailText = player.concatenateValues();
    } else {
      headerText = "Premature Defeat";
      subText = "You made it impossible to spawn a boss room by locking all your possible entrances. That takes -skill-.";
      detailText = "\n\nThere's no stats to put up here. No adventurer would go into a dungeon which doesn't have a boss.";
    }
    
    mMenu = new MenuPanel(headerText, subText, detailText);
  }
  
  public void hoverLoop() {
    // When the mouse hovers over an element for a certain amount of time, a description pops up.
    // Run when mouseMoved()?
  }
  
  public void handleClicks() {
    // Depending on what state we are in, ask the relevant parties whether we are clicking on them
    // Handle clicks does all the stuff we want it to as well, but we have it here because if the menu 
    //  is created due to use clicking, then we have the potential of clicking it immediately
    if(mStateManager.handleClicks() == false && mMenu != null && mMenu.checkIfClicked()) {
      mMenu.delete();
      mMenu = null;
      bPaused = false;
      changeState(GS_DB);
    }
  }
  
  public void handleRClicks() {
    mStateManager.handleRClicks();
  }
}

class MenuPanel extends ClickableObject {  
  String sHeaderText;
  String sSubText;
  String sOtherInfo;
  
  MenuPanel(String header, String sub, String other) {
    super("notifications");
    
    sHeaderText = header;
    sSubText = sub;
    sOtherInfo = other;
    
    // Center alignment
    iWidth = int(width * 0.6);
    iHeight = int(height * 0.4);
    vPosition.x = (width / 2) - (iWidth / 2);
    vPosition.y = (height / 2) - (iHeight / 2);
  }
  
  public void drawSelf() {
    fill(UI_COLOR);
    rect(vPosition.x, vPosition.y, iWidth, iHeight);
    
    // Text
    fill(FONT_COLOR);
    textAlign(CENTER);
    
    textSize(TITLE_SIZE);
    text(sHeaderText, vPosition.x + (UI_MENUPANEL_PADDING / 2), vPosition.y + 10, iWidth - UI_MENUPANEL_PADDING, iHeight - 10);
    
    textSize(FONT_BIG_SIZE);
    text(sSubText, vPosition.x + (UI_MENUPANEL_PADDING / 2), vPosition.y + 70, iWidth - UI_MENUPANEL_PADDING, iHeight - 50);
    
    textSize(FONT_DESCRIPTION_SIZE);
    text(sOtherInfo, vPosition.x + (UI_MENUPANEL_PADDING / 2), vPosition.y + 120, iWidth - UI_MENUPANEL_PADDING, iHeight - 100); 
  }
}
// Open up on a title screen
// Have a button to exit the game
// Have a button to play the game
// Store high scores? Hopefully!

class MenuManager extends SubManager {
  MenuDisplay mDisplay;
  
  MenuManager() {
    mDisplay = new MenuDisplay();
  }
  
  public boolean handleClicks() {
    mDisplay.checkClickables();
    return false;
  }
  
  public void destructor() {
    mDisplay.destructor();
  }
}

class MenuDisplay extends DrawingObject {
  // Sadly have to put these constants here because they rely on width and height
  private int iWidth = int(width * 0.8);
  private int iHeight = int(height * 0.9);
  
  Button mStartButton;
  
  MenuDisplay() {
    super("menus");
    
    vPosition.x = 0 + ( (width - iWidth) / 2 );
    vPosition.y = 0 + ( (height - iHeight) / 2);
    
    mStartButton = new Button(new PVector((width / 2) - ((iWidth * 0.9) / 2), vPosition.y + 250), int(iWidth * 0.9), MENU_BUTTON_START_HEIGHT, "Start New Game");
    iHeight = int(mStartButton.vPosition.y) + mStartButton.iHeight + 10;
  }
  
  public void destructor() {
    mStartButton.delete();
    
    delete();
  }
  
  public void drawSelf() {
    // Draw the background
    fill(UI_COLOR);
    stroke(BUTTON_COLOR);
    rect(vPosition.x, vPosition.y, iWidth, iHeight);
    
    stroke(0, 0, 0);
    fill(UI_HIGHLIGHT);
    rect(vPosition.x, vPosition.y, iWidth, TITLE_SIZE * 1.6);
    
    // Text
    fill(FONT_COLOR);
    textAlign(CENTER);
    // Header
    textSize(TITLE_SIZE);
    text("Random Number God", vPosition.x, vPosition.y + 10, iWidth, iHeight);
    textSize(FONT_BIG_SIZE);
    text("Create a dungeon to guide your adventurer to the boss to win\nLevel them up as much as possible for a higher end score!", vPosition.x, vPosition.y + 60, iWidth, iHeight);
    textSize(FONT_DESCRIPTION_SIZE);
    text("A white box game prototype by Dylan Ford\n@WraithDrof", vPosition.x, vPosition.y + 150, iWidth, iHeight);
  }
  
  public boolean checkClickables() {
    if(mStartButton.checkIfClicked()) {
      // Proceed to dungeon building phase
      mAppMan.mGameMan.changeState(GS_DB);
    }
    
    return false;
  }
}
// Entirely devoted to retrieving the stats of creatures

// Adventurer - Player character
final int PLAYER_STAT_HP = 20;
final int PLAYER_STAT_ATTACK = 5;
final int PLAYER_STAT_DEFENSE = 5;
final int PLAYER_STAT_DAMAGE = 4;

// Giant Rat - Low level, aggressive but easy to kill
final int MS_RAT_DIFF = 0;
final int MS_RAT_HP = 4;
final int MS_RAT_ATK = 7;
final int MS_RAT_DEF = 2;
final int MS_RAT_DMG = 3;
final int MS_RAT_XP = 20;

// Skeleton - Low level all-rounder
final int MS_SKELETON_DIFF = 0;
final int MS_SKELETON_HP = 10;
final int MS_SKELETON_ATK = 3;
final int MS_SKELETON_DEF = 3;
final int MS_SKELETON_DMG = 2;
final int MS_SKELETON_XP = 50;

// Goblin - Low level defensive
final int MS_GOBLIN_DIFF = 0;
final int MS_GOBLIN_HP = 10;
final int MS_GOBLIN_ATK = 2;
final int MS_GOBLIN_DEF = 4;
final int MS_GOBLIN_DMG = 2;
final int MS_GOBLIN_XP = 40;

// Orc - Mid level all-rounder
final int MS_ORC_DIFF = 1;
final int MS_ORC_HP = 18;
final int MS_ORC_ATK = 5;
final int MS_ORC_DEF = 5;
final int MS_ORC_DMG = 4;
final int MS_ORC_XP = 110;

// Colossal Rat - Aggressive Boss
final int MS_BOSSRAT_DIFF = 2;
final int MS_BOSSRAT_HP = 25;
final int MS_BOSSRAT_ATK = 10;
final int MS_BOSSRAT_DEF = 8;
final int MS_BOSSRAT_DMG = 5;
final int MS_BOSSRAT_XP = 220;

// Stone Guardian - Defensive Boss
final int MS_GUARDIAN_DIFF = 2;
final int MS_GUARDIAN_HP = 34;
final int MS_GUARDIAN_ATK = 8;
final int MS_GUARDIAN_DEF = 10;
final int MS_GUARDIAN_DMG = 4;
final int MS_GUARDIAN_XP = 220;
// Game States
static final int GS_MAIN_MENU = 0;
static final int GS_DB = 1;
static final int GS_ADVENTURING = 2;
static final int GS_GAME_MENU = 3;
static final int GS_SIZE = 4;

// Card Types - CR = Room Card
static final int CR_NULL = -1;
static final int CR_EMPTY = 0;
static final int CR_HEALING = 1;
static final int CR_STAIRS = 2;
static final int CR_RAT = 3;
static final int CR_SKELETON = 4;
static final int CR_GOBLIN = 5;
static final int CR_ORC = 6;
static final int CR_BOSSRAT = 7;
static final int CR_GUARDIAN = 8;

static final int C_SIZE = 9;  // Must always be last, and larger than the above values

// This is non-spawnable, and does not have a card class to go along with it.
static final int CR_ENTRANCE = 10;

// Card groupings
static final int[] vMonsters = { CR_RAT, CR_SKELETON, CR_GOBLIN, CR_ORC, CR_BOSSRAT, CR_GUARDIAN };
static final int[] vCommons = { CR_EMPTY, CR_RAT, CR_SKELETON, CR_GOBLIN, CR_ORC };
static final int[] vUncommons = { CR_HEALING };
static final int[] vRares = { CR_BOSSRAT, CR_GUARDIAN };

// Player stats
static final int S_HP = 0;
static final int S_ATK = 1;
static final int S_DEF = 2;
static final int S_DMG = 3;
class RoomManager {
  private Room[][] vRooms;
  
  RoomManager() {
    
  }
  
  // Needs to be called once we enter the game, i.e. exiting the menu
  public void setupRooms() {
    vRooms = new Room[GRID_X][GRID_Y];
    
    for(int x=0; x < GRID_X; x++) {
      for (int y=0; y < GRID_Y; y++) {
        vRooms[x][y] = new Room(new PVector(float(x), float(y)));
      }
    }
    
    // Create the entrance
    RoomData entranceData = new RoomData(CR_ENTRANCE);
    for(int i = 0; i < 4; i++){
      entranceData.mExits[i] = true;      
    }
    
    vRooms[ENTRANCE_X][ENTRANCE_Y].setRoom(entranceData);
    vRooms[ENTRANCE_X][ENTRANCE_Y].cFillColor = color(200, 250, 200); 
  }
  
  // Acts as a destructor
  public void removeRooms() {
    if(vRooms != null) {
      for(int x=0; x < GRID_X; x++) {
        for (int y=0; y < GRID_Y; y++) {
          vRooms[x][y].delete();
          vRooms[x][y] = null;
        }
      }
    }
  }
  
  public int getNumberOfRooms() {
    int returnValue = 0;
    for(int x=0; x < GRID_X; x++) {
      for (int y=0; y < GRID_Y; y++) {
         if(vRooms[x][y].mData != null)
           returnValue++;
        }
    } 
    
    return returnValue;
  }
  
  public ArrayList<Room> getSpacesWithExits() {
    ArrayList<Room> returnValue = new ArrayList<Room>();
    ExitDetectData readingValue;
    
    // For each room that isn't null, check each of their entrances to see if they are occupied. If they aren't, then add that space to the return value.
    for(int x=0; x < GRID_X; x++) {                        // Both of these lines
      for (int y=0; y < GRID_Y; y++) {                     //                     are just scrolling through each grid space
        if(vRooms[x][y].mData != null) {                   // The source room must exist
          for( int i = 0; i < 4; i++) {                    // Check each exit
            if(vRooms[x][y].mData.mExits[i] == true) {
              readingValue = getRoomAndExitByI(i, new PVector(float(x), float(y)));
              if(readingValue.checkingRoom.mData == null)
                returnValue.add(readingValue.checkingRoom);
            }
          }
        }
      }
    }
    
    return returnValue;
  }
  
  public Room getBossRoom() {
    for(int x=0; x < GRID_X; x++) {
      for (int y=0; y < GRID_Y; y++) {
        if(vRooms[x][y].mData != null && (vRooms[x][y].mData.eType == CR_BOSSRAT || vRooms[x][y].mData.eType == CR_GUARDIAN) )
          return vRooms[x][y];
      }
    }
    
    return null;
  }
  
  public void finalizeRooms() {
    for(int x=0; x < GRID_X; x++) {
      for (int y=0; y < GRID_Y; y++) {
        vRooms[x][y].finalizeType();
      }
    }
  }
  
  public boolean getPositionOverBoard(PVector position) {
    if(position.x > 0 && position.x < ROOM_SIZE * GRID_X &&
       position.y > 0 && position.y < ROOM_SIZE * GRID_Y)
         return true;
    return false;
  }
  
  public Room getRoomAtCoord(PVector coords) {
    if(coords.x >= GRID_X || coords.y >= GRID_Y || coords.x < 0 || coords.y < 0)
      return null;
    return vRooms[int(coords.x)][int(coords.y)];
  }
  
  public Room getRoomAtMouse() {
    return getRoomAtPosition(new PVector(mouseX, mouseY));
  }
  
  public Room getRoomAtPosition(PVector position) {
    if(!getPositionOverBoard(position))
      return null;
      
      // it isn't the mouse which is flipping this switch 
    int x = floor(position.x / ROOM_SIZE);
    int y = floor(position.y / ROOM_SIZE);
    
    return vRooms[x][y];
  }
  
  public boolean checkEntrancesCompatible(PVector placementCoordinates, boolean[] placementExits) {
    ExitDetectData neighbour;
    
    // Boolean that detects whether we've successfully found ANYthing
    boolean bAdjacentToSomething = false;
    
    for(int i = 0; i < 4; i++) {
      neighbour = getRoomAndExitByI(i, placementCoordinates);
      
      if(neighbour.checkingRoom == null && placementExits[i] == true)  // WE don't want entrances going out into the void
        return false;
      else if (neighbour.checkingRoom != null && neighbour.checkingRoom.mData != null) {
        if (checkIfSharedEntrance(neighbour, placementExits[i]))
          bAdjacentToSomething = true;
        else if( (neighbour.checkingRoom.mData.mExits[neighbour.checkingExit] == true && placementExits[i] == false) ||
                 (neighbour.checkingRoom.mData.mExits[neighbour.checkingExit] == false && placementExits[i] == true) )
          return false;
          
      }
    }
    
    // If this variable wasn't changed from its original state, which means we weren't adjacent to any instantiated rooms, then this will return false anyways.
    return bAdjacentToSomething;
  }
  
  public boolean checkIfSharedEntrance(ExitDetectData neighbour, boolean sourceExit) {
    if(neighbour.checkingRoom != null && neighbour.checkingRoom.mData != null) {
      if(sourceExit && neighbour.checkingRoom.mData.mExits[neighbour.checkingExit])
        return true; 
    }
    
    return false;//this may need to be changed to making a new arraylist based off returnValue, since it's a local variable
  }
  
  private ExitDetectData getRoomAndExitByI(int i, PVector coords) {
    ExitDetectData returnData = new ExitDetectData();
    PVector checkingPos = new PVector();
    
    if(i % 2 == 0) {
      checkingPos.x = coords.x;
      
      if(i == 0){
        checkingPos.y = coords.y - 1;
        returnData.checkingExit = 2;
      }
      else{
        checkingPos.y = coords.y + 1;
        returnData.checkingExit = 0;
      }
    }
    else {
      checkingPos.y = coords.y;
      
      if(i == 3){
        checkingPos.x = coords.x - 1;
        returnData.checkingExit = 1;
      }
      else{
        checkingPos.x = coords.x + 1;
        returnData.checkingExit = 3;
      }
    }
    
    returnData.checkingRoom = getRoomAtCoord(checkingPos);
     
    return returnData;
  }
  
  // ShouldCalled when the DungeonBuilder is finished building a dungeon
  public void dimRooms() {
    for(int x=0; x < GRID_X; x++) {
      for (int y=0; y < GRID_Y; y++) {
        vRooms[x][y].dim();
      }
    }
  }
  
  public void drawAccordingToRoom(boolean[] exits, PVector origin) {
    // Draw the entrances at their correct location
    fill(COLOR_ENTRANCE_DEFAULT);
    PVector spawningPosition = new PVector();
    for(int i = 0; i < 4; i++) {
      if(exits[i] == true) {
        if(i % 2 == 0) {
          spawningPosition.x = origin.x + (ROOM_SIZE/2) - (ENTRANCE_SIZE / 2);
          if(i == 0)
            spawningPosition.y = origin.y - (ENTRANCE_SIZE / 2);
          else
            spawningPosition.y = origin.y - (ENTRANCE_SIZE / 2) + ROOM_SIZE;
        }
        else{
          spawningPosition.y = origin.y + (ROOM_SIZE/2) - (ENTRANCE_SIZE / 2);
          if(i == 3)
            spawningPosition.x = origin.x - (ENTRANCE_SIZE / 2);
          else
            spawningPosition.x = origin.x - (ENTRANCE_SIZE / 2) + ROOM_SIZE;
        }
        
        rect(spawningPosition.x, spawningPosition.y, ENTRANCE_SIZE, ENTRANCE_SIZE);
      }
    }
  }
}

class Room extends DrawingObject{
  public PVector vPosition;
  protected PVector vDrawingPos;
  public RoomData mData;
  public color cFillColor = COLOR_NULL_ROOM; // Not going to stay in use when images replace sprites
  protected String sSymbol = "~";
  
  Room(PVector coords) {
    super("rooms");
    vPosition = coords;
    
    vDrawingPos = new PVector(vPosition.x, vPosition.y); 
    vDrawingPos.mult(ROOM_SIZE);
  }
  
  // Load a room with a set of parameters
  public void setRoom (RoomData newRoom) {
    //iType = id;    
    mData = newRoom;
    
    updateSymbol();
  }
  
  public void changeType(int newType) {
    mData.eType = newType;
    updateSymbol();
  }
  
  public void finalizeType() {
    // Check each exit to see if there exists a room there, if not, then remove that exit
    // Also, remove our symbol if we are null
    ExitDetectData neighbour;
    
    if(mData != null) {
      for(int i = 0; i < 4; i++) {
        if(mData.mExits[i]) {
          neighbour = mAppMan.mRoomMan.getRoomAndExitByI(i, vPosition);
          
          if(neighbour.checkingRoom == null || neighbour.checkingRoom.mData == null || !mAppMan.mRoomMan.checkIfSharedEntrance(neighbour, mData.mExits[i])){
            mData.mExits[i] = false;
          }
        }
      }
    } else {
      sSymbol = "";
    }
    
  }
  
  public ArrayList<Room> getTraversableRooms() {
    ArrayList<Room> returnValue = new ArrayList<Room>();
    
    ExitDetectData neighbour;
    
    for(int i = 0; i < 4; i++) {
      neighbour = mAppMan.mRoomMan.getRoomAndExitByI(i, vPosition);
      
      if(neighbour.checkingRoom != null && neighbour.checkingRoom.mData != null && mAppMan.mRoomMan.checkIfSharedEntrance(neighbour, mData.mExits[i])){ 
        returnValue.add(neighbour.checkingRoom);
      }
    }
    
    return returnValue;
  }
  
  protected void updateSymbol() {
    switch(mData.eType) {
     case CR_RAT:
       sSymbol = "R";
       break;
     case CR_SKELETON:
       sSymbol = "S";
       break;
     case CR_GOBLIN:
       sSymbol = "G";
       break;
     case CR_ORC:
       sSymbol = "O";
       break;
     case CR_BOSSRAT:
       sSymbol = "CR";
       break;
     case CR_GUARDIAN:
       sSymbol = "SG";
       break;
     case CR_EMPTY:
       sSymbol = ".";
       break;
    case CR_HEALING:
      sSymbol = "H";
      break;
    case CR_STAIRS:
      sSymbol = ">";
      break;
    case CR_ENTRANCE:
      sSymbol = "E";
      break;
    default:
      return;
   }
   
   cFillColor = COLOR_DEFAULT_ROOM;
  }
  
  // Change this to a child class which specifically is already placed rooms?
  public void dim() {
    if(cFillColor != COLOR_ENTRANCE_DEFAULT) {
      if(cFillColor == COLOR_DEFAULT_ROOM)  
        cFillColor = COLOR_FOW_DEFAULT;
      else if (cFillColor == COLOR_NULL_ROOM)
       cFillColor = COLOR_FOW_NULL; 
    }
  }
  
  public void light() {
    cFillColor = COLOR_DEFAULT_ROOM;  // Unless there are other colors of rooms
  }
  
  public void drawSelf () {
    drawSelfSquare();
  }
  
  // This is really part of the draw function, but GhostRoom uses it as well, so it shouldn't be overwritten
  protected void drawSelfSquare () {
    // Draw square
    fill(cFillColor);
    if(cFillColor == COLOR_FOW_NULL)
      stroke(cFillColor);
    else
      stroke(0, 0, 0);
    rect(vDrawingPos.x, vDrawingPos.y, ROOM_SIZE, ROOM_SIZE);
    stroke(0, 0, 0, 150);
    
    // Draw Symbol
    fill(FONT_COLOR);
    textAlign(CENTER);
    textSize(FONT_SYMBOL_SIZE);
    text(sSymbol, vDrawingPos.x + (ROOM_SIZE / 2), vDrawingPos.y + (ROOM_SIZE / 2) + (FONT_SYMBOL_SIZE / 3));
    
    // Draw exits
    if(mData != null) {
      mAppMan.mRoomMan.drawAccordingToRoom(mData.mExits, vDrawingPos);
    }
    
    stroke(0, 0, 0);
  }
}

// Used when in the process of placing a room
class GhostRoom extends Room {  
  public boolean bDisabled = false;
  
  GhostRoom(RoomData data) {
    super(new PVector(mouseX - (ROOM_SIZE / 2), mouseY - (ROOM_SIZE / 2)));
        
    cFillColor = COLOR_GHOST_ROOM;
    mData = data;
    
    updateSymbol();    
  }
  
  private void disable() {
    cFillColor = COLOR_DISABLED_ROOM;
    bDisabled = true;
  }
  
  private void enable() {
    cFillColor = COLOR_CONFIRMED_PLACEMENT;
    bDisabled = false;
  }
  
  public void drawSelf() {
    if(mAppMan.mGameMan.bPaused != true) {    // It looks pretty annoying if the ghost room is moving around while the game is paused
      if(mAppMan.mRoomMan.getPositionOverBoard(new PVector(mouseX, mouseY))) {
        // Snap to the next lowest grid point
        vDrawingPos.x = mouseX - (mouseX % ROOM_SIZE);
        vDrawingPos.y = mouseY - (mouseY % ROOM_SIZE);
      }
      else {
        vDrawingPos.x = mouseX - (ROOM_SIZE / 2);
        vDrawingPos.y = mouseY - (ROOM_SIZE / 2);
      }
      
      Room hoverRoom = mAppMan.mRoomMan.getRoomAtMouse();
      if(hoverRoom != null) {
        vPosition = hoverRoom.vPosition;
        
        if(hoverRoom.mData != null) // If the room is not null, it means we have already placed something on it
          disable();
        // Check to see if the entrances line up with adjacent entrances
        // One by one, check each of our entrances to see if they also exist in the adjacent room
        // for each entrance
        //    get the appropriate direction according to i
        //    If that room has an appropriate entrenace
        else if (!mAppMan.mRoomMan.checkEntrancesCompatible(vPosition, mData.mExits))
          disable();
        else // Only if we don't have something to disable us
          enable();
      }
      else
          cFillColor = COLOR_GHOST_ROOM;
      
      drawSelfSquare();
      
      if(mAppMan.mRoomMan.getPositionOverBoard(new PVector(mouseX, mouseY))) {
        // Draw instructions
        fill(255, 255, 255, 100);
        rect(vDrawingPos.x + ROOM_SIZE - 5, vDrawingPos.y + ROOM_SIZE - 5, 144, 46);
        textSize(12);
        textAlign(LEFT);
        fill(0, 0, 0);
        text("Left click to place\nRight click to rotate", vDrawingPos.x + ROOM_SIZE + 10, vDrawingPos.y + ROOM_SIZE + 14);
      }
    }
  }
}

// This allows us to return a bunch of data in one function
  class ExitDetectData {
    public Room checkingRoom;
    public int checkingExit;
  }

// The difference between this and Room is that this doesn't have to be a placed room
//  When we are selecting a room to place down, all we need is the data for that room
//  These are always created in the selection stage
class RoomData {
  private int eType;
  //private char sSymbol;  // Might be temp
  public boolean[] mExits;  // Only gets defined after we have been placed down. Here, a 0 
                          //  implies that an exit should exist at this direction, but hasn't been defined yet.
                          // The index determines the direction. 0 = Opposite side to entrance. 
                          //  1 = Right side from entrance. 2 = Entrance, 3 = Left side from entrance
 
 // Cardinal directions here always assume south is the entrance
 RoomData(int id) {
   eType = id;
   
   mExits = new boolean[4];
   
   float randomNumber;
   float threshold = 0.4;
   for(int i = 0; i < 4; i++) {
     randomNumber = random(1);
     if(randomNumber <= threshold)
       mExits[i] = true;
     else
       mExits[i] = false;
   }
   
   mExits[2] = true;
 }
 
 // Move entrances one over
 public void rotateEntrances() {
    boolean tempVariable = mExits[3];
    for(int i = 3; i > 0; i--) {
      mExits[i] = mExits[i - 1];
    }
    mExits[0] = tempVariable;
  }
}
class SpriteManager {
  private ArrayList<Sprite> vSprites;
  private ArrayList<DrawingObject> vDObjects;
  private ArrayList<DObjectLayer> vLayers;
  
  SpriteManager() {
    vSprites = new ArrayList<Sprite>();
    vDObjects = new ArrayList<DrawingObject>();
    vLayers = new ArrayList<DObjectLayer>();
    
    // Set up layers, in the order we want to draw them (so later layers are drawn on top of earlier layers)
    addDObjectLayer("default");
    addDObjectLayer("rooms");
    //addDObjectLayer("ghostRooms");
    addDObjectLayer("creatures");
    addDObjectLayer("menus");
    addDObjectLayer("menuElements");
    addDObjectLayer("notifications");
  }
  
  public void graphicsLoop() {
    background(BG_COLOR);
    
    /*for(int i = 0; i < vSprites.size(); i++) {
      vSprites.get(i).drawSelf();
    }*/
    
    for(int i = 0; i < vLayers.size(); i++) {
      vLayers.get(i).graphicsLoop();
    }
  }
  
  public void addSprite(Sprite s) {
    vSprites.add(s);
  }
  
  private void addDObjectLayer(String layerName) {
    if(getDObjectLayer(layerName) == null)
      vLayers.add(new DObjectLayer(layerName));
  }
  
  private DObjectLayer getDObjectLayer(String layerName) {
    for(int i = 0; i < vLayers.size(); i++) {
      if (vLayers.get(i).sName == layerName){
        return vLayers.get(i);
      }
    }
    // This will give us a bunch of messages whenever we first make a layer, because it wants this function to return null 
    return null;
  }
  
  // Default function because processing is a baby and won't just allow default arguments
  public void addDObject(DrawingObject o) {
    addDObject(o, "default");
  }
  
  public void addDObject(DrawingObject o, String layerName) {
    getDObjectLayer(layerName).addDObject(o);
  }
  
  public void removeDObject(DrawingObject o) {
    for(int i = 0; i < vLayers.size(); i++) {
      if(vLayers.get(i).removeDObject(o) == true)
        return;
    }
    
  }
}

class DObjectLayer {
  String sName;
  ArrayList<DrawingObject> vDObjects;
  
  DObjectLayer(String name) {
    vDObjects = new ArrayList<DrawingObject>();
    sName = name;
  }
  
  void addDObject(DrawingObject o) {
    vDObjects.add(o);
  }
  
  // Returns true if successful
  public boolean removeDObject(DrawingObject o ) {
    for(int i = 0; i < vDObjects.size(); i++) {
      if (vDObjects.get(i) == o){
        vDObjects.remove(o);
        return true;
      }
    }
    return false;
  }
  
  public void graphicsLoop() {
    for(int i = 0; i < vDObjects.size(); i++) {
      vDObjects.get(i).drawSelf();
    }
  }
}

class Sprite {
  /*private int iNumberLoops = -1;  // -1 = infinite
  ArrayList<PImage> vFrames;*/
  
  private int iWidth;
  private int iHeight;
  private PVector vPosition;
  
  private color cFillColor;
  
  Sprite(PVector position, int rectWidth, int rectHeight, color c) {
    vPosition = position;
    iWidth = rectWidth;
    iHeight = rectHeight;
    cFillColor = c;
  }
  
  public void drawSelf() {
    // TEMP: Draw a square of the appropriate width and height
    fill(cFillColor);
    rect(vPosition.x, vPosition.y, iWidth, iHeight);
  }
  
  public void changeColor(color newColor) {
    cFillColor = newColor;
  }
}

class DrawingObject {
  public int iID;
  public PVector vPosition;
  
  DrawingObject(String layer) {
    mAppMan.mSpriteMan.addDObject(this, layer);
    vPosition = new PVector();
  }
  
  public void drawSelf(){
  }
  
  public void delete() {
    mAppMan.mSpriteMan.removeDObject(this);
  }
}

class ClickableObject extends DrawingObject {
  public int iWidth;
  public int iHeight;
  
  ClickableObject(String layer) {
    super(layer);
  }
  
  public boolean checkIfClicked() {
    if( (mouseX > vPosition.x && mouseX < (vPosition.x + iWidth)) &&
        (mouseY > vPosition.y && mouseY < (vPosition.y + iHeight)) ) {
      //
      return true;
    }
    return false;
  }
}

// Special drawing class - all buttons are drawn the same way
class Button extends ClickableObject {
  private String sLabel;
  
  Button (PVector pos, int w, int h, String label) {
    super("menuElements");
    vPosition = pos;
    iWidth = w;
    iHeight = h;
    sLabel = label;
  }
  
  public void drawSelf() {
    // Background
    fill(BUTTON_COLOR);
    rect(vPosition.x, vPosition.y, iWidth, iHeight);
    
    fill(FONT_COLOR);
    textAlign(CENTER);
    textSize(BUTTON_LABEL_SIZE);
    text(sLabel, vPosition.x, vPosition.y + (iHeight / 10), iWidth, iHeight);
  }
}
class SubManager {
  public void gameLoop() {
    // We don't actually need to throw an error here because not all SubManager classes use gameLoop. Probably should stop calling this a pure virtual class if this remains the case
  }
  
  public boolean handleClicks() {
    return false;
  }
  
  public boolean handleRClicks() {
    return false;
  }
  
  public void destructor() {
  }
  
  //-------------------------------------------------------------------------------------
  // Probably would be better to not have these override, but it is a temporary measure
  //-------------------------------------------------------------------------------------
  public void generateSelection() {
  }
  
  public void enterCombat(int monsterType) {
  }
}


