
PImage NPC;
PImage NPCLos;
PImage Ground;
PImage Dark;
PImage Title;
PImage LevelOne;
PImage LevelTwo;
PImage LevelThree;
PImage LevelFour;
PImage LevelFive;
PImage Ladder;
PImage playerPic;
PImage los;
Player player1;
Level level; //split into 40x40 bite sized cubes of darkness
int radius; //Player is a 20x20, so 10 px radius
boolean W_ACTIVE;
boolean A_ACTIVE;
boolean S_ACTIVE;
boolean D_ACTIVE;
boolean isTitleScreen; //Level class contains the real Title screen

void setup() {
  size(400, 400);
  background(0);
  smooth();
  frameRate(60);
  W_ACTIVE = false;
  A_ACTIVE = false;
  S_ACTIVE = false;
  D_ACTIVE = false;
  NPC = loadImage("NPC.png");
  NPCLos = loadImage("NPCLoS.png"); //60 px radius circle
  Ground = loadImage("Ground.jpg");
  Dark = loadImage("Dark.png");
  Title = loadImage("Title.png");
  LevelOne = loadImage("LevelOne.png");
  LevelTwo = loadImage("LevelTwo.png");
  LevelThree = loadImage("LevelThree.png");
  LevelFour = loadImage("LevelFour.png");
  LevelFive = loadImage("LevelFive.png");
  Ladder = loadImage("Ladder.png");
  playerPic = loadImage("Player.png");
  los = loadImage("LoS test.png"); //50 degrees
  imageMode(CENTER); //CENTER!!!!!!!!!!!!
  isTitleScreen = false;
  level= new Level(0);
  player1 = new Player();
  radius = 10;
}

void draw() {
  if ( level.bossHP == 0 ) {
    image(Ground, 200, 200);
    image(LevelFive, 200, 200);
    for ( Walls border : level.walls ) {
      border.render();
    }
    player1.render();
    player1.move();
  } 
  else {
    level.render();
    if ( ! isTitleScreen ) {
      levelSwitch();
      player1.render();
      player1.move();
    }
  }
}

//get out of the title screen and place into game
public void mouseClicked() {
  if ( level.level == 0 && (mouseX >= 140 && mouseX < 260) && (mouseY >= 300 && mouseY < 340) ) {
    level = new Level(1);
    player1 = new Player();
    isTitleScreen = false;
    textAlign(LEFT);
    textSize(10);
  }
}


//Movement
public void keyPressed() {
  if ( key == 'w' ) {
    W_ACTIVE = true;
  }
  if ( key == 'a' ) {
    A_ACTIVE = true;
  }
  if ( key == 's' ) {
    S_ACTIVE = true;
  }
  if ( key == 'd' ) {
    D_ACTIVE = true;
  }
}
//Movement
public void keyReleased() {
  if ( key == 'w' ) {
    W_ACTIVE = false;
  }
  if ( key == 'a' ) {
    A_ACTIVE = false;
  }
  if ( key == 's' ) {
    S_ACTIVE = false;
  }
  if ( key == 'd' ) {
    D_ACTIVE = false;
  }
}

//for when Player is detected, resets the level
public void restartLevel() {
  level = new Level(level.level);
  player1 = new Player();
}

//trigger's level switch upon reaching the ladder
public void levelSwitch() {
  if ( level.level == 1 ) {
    if ( (player1.playerLoc.x >= 185 && player1.playerLoc.x < 215) 
      && (player1.playerLoc.y <= 30 && player1.playerLoc.y > 0) ) {
      level = new Level(2);
      player1 = new Player();
    }
  }
  if ( level.level == 2 ) {
    //button1
    if ( ! level.switchActive1 ) {     
      if ( (player1.playerLoc.x >= 30 && player1.playerLoc.x < 50)
        && (player1.playerLoc.y <= 50 && player1.playerLoc.y > 30) ) {
        level.walls.remove(level.walls.size() - 1);
        level.switchActive1 = true;
      }
    }
    if ( (player1.playerLoc.x >= 65 && player1.playerLoc.x < 95)
      && (player1.playerLoc.y <= 335 && player1.playerLoc.y > 305) ) {
      level = new Level(3);
      player1 = new Player();
    }
  }
  if ( level.level == 3 ) {
    if ( (player1.playerLoc.x >= 345 && player1.playerLoc.x < 375)
      && (player1.playerLoc.y <= 65 && player1.playerLoc.y > 25) ) {
      level = new Level(4);
      player1 = new Player();
    }
  }
  if ( level.level == 4 ) {
    //button1
    if ( ! level.switchActive1 ) {     
      if ( (player1.playerLoc.x >= 10 && player1.playerLoc.x < 30)
        && (player1.playerLoc.y <= 30 && player1.playerLoc.y > 10) ) {
        level.walls.remove(level.walls.size() - 1);
        level.switchActive1 = true;
      }
    }
    //button2
    if ( ! level.switchActive2 ) {     
      if ( (player1.playerLoc.x >= 370 && player1.playerLoc.x < 390)
        && (player1.playerLoc.y <= 390 && player1.playerLoc.y > 370) ) {
        level.walls.remove(level.walls.size() - 1);
        level.switchActive2 = true;
      }
    }
    if ( (player1.playerLoc.x >= 25 && player1.playerLoc.x < 65) 
      && (player1.playerLoc.y <= 375 && player1.playerLoc.y > 345) ) {
      level = new Level(5);
      player1 = new Player();
    }
  }
  if ( level.level == 5 ) {
    if ( ! level.switchActive1 ) {     
      if ( (player1.playerLoc.x >= 65 && player1.playerLoc.x < 85)
        && (player1.playerLoc.y <= 85 && player1.playerLoc.y > 65) ) {
        level.bossHP--;
        level.switchActive1 = true;
      }
    }
    if ( ! level.switchActive2 ) {     
      if ( (player1.playerLoc.x >= 315 && player1.playerLoc.x < 335)
        && (player1.playerLoc.y <= 85 && player1.playerLoc.y > 65) ) {
        level.bossHP--;
        level.switchActive2 = true;
      }
    }
    if ( ! level.switchActive3 ) {     
      if ( (player1.playerLoc.x >= 315 && player1.playerLoc.x < 335)
        && (player1.playerLoc.y <= 335 && player1.playerLoc.y > 315) ) {
        level.bossHP--;
        level.switchActive3 = true;
      }
    }
  }
}
/**
 * from Mr. Ferraro
 * http://www.openprocessing.org/visuals/?visualID=28570
 */
public boolean isCollision() {
  for ( Walls seg : level.walls ) {
    PVector A = seg.ptA;
    PVector B = seg.ptB;
    if ( A.dist(player1.playerLoc) <= radius ) return true;
    if ( B.dist(player1.playerLoc) <= radius ) return true;

    PVector distResult = getDistance(A.x, A.y, B.x, B.y, player1.playerLoc.x, player1.playerLoc.y);
    PVector closest = new PVector( distResult.x, distResult.y );
    float dist = distResult.z;
    float lesserX = A.x, greaterX = B.x;
    if ( A.x > B.x ) { 
      float tmp = lesserX; 
      lesserX = greaterX; 
      greaterX = tmp;
    }
    float lesserY = A.y, greaterY = B.y;
    if ( A.y > B.y ) { 
      float tmp = lesserY; 
      lesserY = greaterY; 
      greaterY = tmp;
    }
    if ( closest.x >= lesserX && closest.x <= greaterX
      && closest.y >= lesserY && closest.y <= greaterY ) {
      if ( closest.dist(player1.playerLoc) <= radius ) {
        return true;
      }
    }
  }
  return false;
}

/**
 * from http://processing.org/discourse/yabb2/YaBB.pl?num=1276644884/4
 *
 * Returns a point on the line (x1,y1) -> (x2,y2)
 * that is closest to the point (x,y)
 *
 * The result is a PVector.
 * result.x and result.y are points on the line.
 * The result.z variable contains the distance from (x,y) to the line,
 * just in case you need it :)
 */
PVector getDistance( float x1, float y1, float x2, float y2, float x, float y ) {
  PVector result = new PVector();

  float dx = x2 - x1;
  float dy = y2 - y1;
  float d = sqrt( dx*dx + dy*dy );
  float ca = dx/d; // cosine
  float sa = dy/d; // sine

  float mX = (-x1+x)*ca + (-y1+y)*sa;

  if ( mX <= 0 ) {
    result.x = x1;
    result.y = y1;
  }
  else if ( mX >= d ) {
    result.x = x2;
    result.y = y2;
  }
  else {
    result.x = x1 + mX*ca;
    result.y = y1 + mX*sa;
  }

  dx = x - result.x;
  dy = y - result.y;
  result.z = sqrt( dx*dx + dy*dy );

  return result;
}



class Walls {

  PVector ptA, ptB;

  Walls(int x1, int y1, int x2, int y2) {
    ptA = new PVector(x1, y1);
    ptB = new PVector(x2, y2);
  }

  public void render() {
    stroke(0, 0, 0); // color for debugging
    line(ptA.x, ptA.y, ptB.x, ptB.y);
  }
}




class Level {
  int level = 0;
  int bossHP = 3;
  boolean switchActive1 = false;
  boolean switchActive2 = false;
  boolean switchActive3 = false;
  ArrayList<Walls> walls;
  ArrayList<NPC> NPCs;

  Level(int lvl) {
    level = lvl;
    walls = initWalls();
    NPCs = initNPCs();
  }

  public void render() {

    //title screen
    if ( level == 0 ) {
      image(Title, 200, 200);
      textAlign(CENTER);
      textSize(18);
      if ( mousePressed && (mouseX >= 140 && mouseX < 260) && (mouseY >= 300 && mouseY < 340)  ) {
        fill(150, 0, 0, 150);
        stroke(150, 0, 0, 150);
        rect(140, 300, 120, 40);
        fill(225);
        text("Start", 200, 327);
      } 
      else {
        fill(150, 0, 0, 100);
        stroke(150, 0, 0, 150);
        rect(140, 300, 120, 40);
        fill(255);
        text("Start", 200, 327);
      }
    }

    if ( level == 1 ) {
      image(Ground, 200, 200);
      image(Ladder, 200, 15);
      image(Dark, 200, 200);
      image(LevelOne, 200, 200);
      for ( Walls border : walls ) {
        border.render();
      }
      for ( NPC ppl : NPCs ) {
        ppl.render();
        ppl.walkPath();
      }
    }
    if ( level == 2 ) {
      image(Ground, 200, 200);
      image(Ladder, 80, 320);
      image(Dark, 200, 200);
      image(LevelTwo, 200, 200);
      for ( Walls border : walls ) {
        border.render();
      }
      for ( NPC ppl : NPCs ) {
        ppl.render();
        ppl.walkPath();
      }
      if ( ! switchActive1 ) {
        fill(50);
        stroke(0);
        rect(160, 100, 80, 40);
        rect(30, 30, 20, 20);
      }
    }
    if ( level == 3 ) {
      image(Ground, 200, 200);
      image(Ladder, 360, 40);
      image(Dark, 200, 200);
      image(LevelThree, 200, 200);
      for ( Walls border : walls ) {
        border.render();
      }
      for ( NPC ppl : NPCs ) {
        ppl.render();
        ppl.walkPath();
      }
    }
    if ( level == 4 ) {
      image(Ground, 200, 200);
      image(Ladder, 40, 360);
      image(Dark, 200, 200);
      image(LevelFour, 200, 200);
      for ( Walls border : walls ) {
        border.render();
      }
      for ( NPC ppl : NPCs ) {
        ppl.render();
        ppl.walkPath();
      }
      if ( ! switchActive1 ) {
        fill(50);
        stroke(0);
        rect(10, 10, 20, 20);
      }
      if ( ! switchActive2 ) {
        fill(50);
        stroke(0);
        rect(370, 370, 20, 20);
      }
    }
    if ( level == 5 ) {
      image(Ground, 200, 200);
      image(Dark, 200, 200);
      image(LevelFive, 200, 200);
      for ( Walls border : walls ) {
        border.render();
      }
      for ( NPC ppl : NPCs ) {
        ppl.render();
        ppl.walkPath();
      }
      if ( ! switchActive1 ) {
        fill(50);
        stroke(0);
        rect(65, 65, 20, 20);
      }
      if ( ! switchActive2 ) {
        fill(50);
        stroke(0);
        rect(315, 65, 20, 20);
      }
      if ( ! switchActive3 ) {
        fill(50);
        stroke(0);
        rect(315, 315, 20, 20);
      }
    }
  }

  ArrayList<NPC> initNPCs() {

    ArrayList<NPC> temp = new ArrayList<NPC>();

    if ( level == 1 ) {
      temp.add( new NPC(1, 1) );
      temp.add( new NPC(1, 2) );
    }

    if ( level == 2 ) {
      temp.add( new NPC(2, 1) ); 
      temp.add( new NPC(2, 2) );
      temp.add( new NPC(2, 3) );
      temp.add( new NPC(2, 4) );
    }

    if ( level == 3 ) {
      temp.add( new NPC(3, 1) ); 
      temp.add( new NPC(3, 2) ); 
      temp.add( new NPC(3, 3) );
    }

    if ( level == 4 ) {
      temp.add( new NPC(4, 1) ); 
      temp.add( new NPC(4, 2) ); 
      temp.add( new NPC(4, 3) );
      temp.add( new NPC(4, 4) );
      temp.add( new NPC(4, 5) );
    }

    if ( level == 5 ) {
      temp.add( new NPC(5, 1) );
    }

    return temp;
  }

  ArrayList<Walls> initWalls() {

    ArrayList<Walls> temp = new ArrayList<Walls>();

    if ( level == 1 ) {
      //start upper-right corner on left half, CW
      temp.add( new Walls(160, 0, 240, 0) );
      temp.add( new Walls(240, 0, 240, 80) );
      temp.add( new Walls(240, 80, 320, 80) );
      temp.add( new Walls(320, 80, 320, 160) );
      temp.add( new Walls(320, 160, 240, 160) );
      temp.add( new Walls(240, 160, 240, 240) );
      temp.add( new Walls(240, 240, 320, 240) );
      temp.add( new Walls(320, 240, 320, 320) );
      temp.add( new Walls(320, 320, 240, 320) );
      temp.add( new Walls(240, 320, 240, 400) );
      temp.add( new Walls(240, 400, 160, 400) );
      temp.add( new Walls(160, 400, 160, 320) );
      temp.add( new Walls(160, 320, 80, 320) );
      temp.add( new Walls(80, 320, 80, 240) );
      temp.add( new Walls(80, 240, 160, 240) );
      temp.add( new Walls(160, 240, 160, 160) );
      temp.add( new Walls(160, 160, 80, 160) );
      temp.add( new Walls(80, 160, 80, 80) );
      temp.add( new Walls(80, 80, 160, 80) );
      temp.add( new Walls(160, 80, 160, 0) );
    }
    if ( level == 2 ) {
      //start at upper-left corner, CW
      temp.add( new Walls(0, 0, 400, 0) );
      temp.add( new Walls(400, 0, 400, 80) );
      temp.add( new Walls(400, 80, 240, 80) );
      temp.add( new Walls(240, 80, 240, 160) );
      temp.add( new Walls(240, 160, 360, 160) );
      temp.add( new Walls(360, 160, 360, 360) );
      temp.add( new Walls(360, 360, 40, 360) );
      temp.add( new Walls(40, 360, 40, 160) );
      temp.add( new Walls(40, 160, 160, 160) );
      temp.add( new Walls(160, 160, 160, 80) );
      temp.add( new Walls(160, 80, 0, 80) );
      temp.add( new Walls(0, 80, 0, 0) );

      //door
      temp.add(new Walls(160, 100, 240, 100) );
    }
    if ( level == 3 ) {
      //start at upper-right corner, follow wall side
      temp.add( new Walls(400, 0, 400, 120) );
      temp.add( new Walls(400, 120, 80, 120) );
      temp.add( new Walls(80, 120, 80, 160) );
      temp.add( new Walls(80, 160, 400, 160) );
      temp.add( new Walls(400, 160, 400, 360) );
      temp.add( new Walls(400, 360, 40, 360) );
      temp.add( new Walls(40, 360, 40, 280) );
      temp.add( new Walls(40, 280, 320, 280) );
      temp.add( new Walls(320, 280, 320, 240) );
      temp.add( new Walls(320, 240, 0, 240) );
      temp.add( new Walls(0, 240, 0, 40) );
      temp.add( new Walls(0, 40, 320, 40) );
      temp.add( new Walls(320, 40, 320, 0) );
      temp.add( new Walls(320, 0, 400, 0) );
    }
    if ( level == 4 ) {
      //oh dear, start at upper-right corner 
      temp.add( new Walls(400, 0, 400, 80) );
      temp.add( new Walls(400, 80, 360, 80) );
      temp.add( new Walls(360, 80, 360, 120) );
      temp.add( new Walls(360, 120, 320, 120) );
      temp.add( new Walls(320, 120, 320, 160) );
      temp.add( new Walls(320, 160, 280, 160) );
      temp.add( new Walls(280, 160, 280, 240) );
      temp.add( new Walls(280, 240, 320, 240) );
      temp.add( new Walls(320, 240, 320, 280) );
      temp.add( new Walls(320, 280, 360, 280) );
      temp.add( new Walls(360, 280, 360, 320) );
      temp.add( new Walls(360, 320, 400, 320) );
      temp.add( new Walls(400, 320, 400, 400) );
      temp.add( new Walls(400, 400, 320, 400) );
      temp.add( new Walls(320, 400, 320, 360) );
      temp.add( new Walls(320, 360, 280, 360) );
      temp.add( new Walls(280, 360, 280, 320) );
      temp.add( new Walls(280, 320, 240, 320) );
      temp.add( new Walls(240, 320, 240, 280) );
      temp.add( new Walls(240, 280, 160, 280) );
      temp.add( new Walls(160, 280, 160, 320) );
      temp.add( new Walls(160, 320, 120, 320) );
      temp.add( new Walls(120, 320, 120, 360) );
      temp.add( new Walls(120, 360, 80, 360) );
      temp.add( new Walls(80, 360, 80, 400) );
      temp.add( new Walls(80, 400, 0, 400) );
      temp.add( new Walls(0, 400, 0, 320) );
      temp.add( new Walls(0, 320, 40, 320) );
      temp.add( new Walls(40, 320, 40, 280) );
      temp.add( new Walls(40, 280, 80, 280) );
      temp.add( new Walls(80, 280, 80, 240) );
      temp.add( new Walls(80, 240, 120, 240) );
      temp.add( new Walls(120, 240, 120, 160) );
      temp.add( new Walls(120, 160, 80, 160) );
      temp.add( new Walls(80, 160, 80, 120) );
      temp.add( new Walls(80, 120, 40, 120) );
      temp.add( new Walls(40, 120, 40, 80) );
      temp.add( new Walls(40, 80, 0, 80) );
      temp.add( new Walls(0, 80, 0, 0) );
      temp.add( new Walls(0, 0, 80, 0) );
      temp.add( new Walls(80, 0, 80, 40) );
      temp.add( new Walls(80, 40, 120, 40) );
      temp.add( new Walls(120, 40, 120, 80) );
      temp.add( new Walls(120, 80, 160, 80) );
      temp.add( new Walls(160, 80, 160, 120) );
      temp.add( new Walls(160, 120, 240, 120) );
      temp.add( new Walls(240, 120, 240, 80) );
      temp.add( new Walls(240, 80, 280, 80) );
      temp.add( new Walls(280, 80, 280, 40) );
      temp.add( new Walls(280, 40, 320, 40) );
      temp.add( new Walls(320, 40, 320, 0) );
      temp.add( new Walls(320, 0, 400, 0) );

      //doors
      temp.add( new Walls(80, 280, 120, 320) );
      temp.add( new Walls(40, 320, 80, 360) );
    }

    if ( level == 5 ) {
      //borders
      temp.add( new Walls(50, 50, 350, 50) );
      temp.add( new Walls(350, 50, 350, 350) );
      temp.add( new Walls(350, 350, 50, 350) );
      temp.add( new Walls(50, 350, 50, 50) );
      //upper-left
      temp.add( new Walls(100, 100, 150, 100) );
      temp.add( new Walls(150, 100, 150, 150) );
      temp.add( new Walls(150, 150, 100, 150) );
      temp.add( new Walls(100, 150, 100, 100) );
      //upper-right
      temp.add( new Walls(250, 100, 300, 100) );
      temp.add( new Walls(300, 100, 300, 150) );
      temp.add( new Walls(300, 150, 250, 150) );
      temp.add( new Walls(250, 150, 250, 100) );
      //lower-left
      temp.add( new Walls(100, 250, 150, 250) );
      temp.add( new Walls(150, 250, 150, 300) );
      temp.add( new Walls(150, 300, 100, 300) );
      temp.add( new Walls(100, 300, 100, 250) );
      //lower-right
      temp.add( new Walls(250, 250, 300, 250) );
      temp.add( new Walls(300, 250, 300, 300) );
      temp.add( new Walls(300, 300, 250, 300) );
      temp.add( new Walls(250, 300, 250, 250) );
    }

    return temp;
  }
}


class NPC { 

  PVector NPCLoc = new PVector(200, 200);
  float speed = 0.25;
  float losRadian = 68;
  boolean move = true;
  int level = 0;
  int paths = 0;
  boolean moveRight;
  boolean moveDown;
  boolean moveLeft;
  boolean moveUp;

  NPC(int lvl, int path) {
    level = lvl;
    paths = path;

    if ( lvl == 1 ) {     
      if (  path == 1 ) {
        NPCLoc = new PVector(120, 120);
      }
      if (  path == 2 ) {
        NPCLoc = new PVector(280, 280);
      }
    }

    if ( lvl == 2 ) {  
      speed = 0.35;   
      if ( path == 1 ) {
        NPCLoc = new PVector(80, 200);
      }
      if ( path == 2 ) {
        NPCLoc = new PVector(320, 200);
      }
      if ( path == 3 ) {
        NPCLoc = new PVector(320, 320);
      }
      if ( path == 4 ) {
        NPCLoc = new PVector(80, 320);
      }
    }

    if ( lvl == 3 ) {
      speed = 0.45;
      if ( path == 1 ) {
        NPCLoc =  new PVector(80, 10);
      }
      if ( path == 2 ) {
        NPCLoc =  new PVector(320, 390);
      }
      if ( path == 3 ) {
        NPCLoc =  new PVector(200, 200);
      }
    }

    if ( lvl == 4 ) {
      speed = 0.50;
      if ( path == 1 ) {
        NPCLoc =  new PVector(200, 10);
      }
      if ( path == 2 ) {
        NPCLoc =  new PVector(10, 200);
      }
      if ( path == 3 ) {
        NPCLoc =  new PVector(200, 390);
      }
      if ( path == 4 ) {
        NPCLoc =  new PVector(390, 200);
      }
      if ( path == 5 ) {
        NPCLoc =  new PVector(200, 200);
      }
    }

    if ( lvl == 5 ) {
      speed = 0.015;
      losRadian = 108;
      NPC = loadImage("NPC Boss.png");
      NPCLoc = new PVector(200, 200);
    }
  }

  public void walkPath() {

    //level 1
    if ( level == 1 ) { 
      if ( NPCLoc.x <= 120 ) {
        moveRight = true;
        moveLeft = false;
      }
      if ( NPCLoc.x >= 280 ) {
        moveLeft = true;
        moveRight = false;
      }
    }
    //level 2
    if ( level == 2 ) {
      if ( NPCLoc.x <= 80 && NPCLoc.y <= 200 ) {
        moveRight = true;
        moveUp = false;
        moveLeft = false;
        moveDown = false;
      } 
      if ( NPCLoc.x >= 320 && NPCLoc.y <= 200 ) {
        moveDown = true;
        moveRight = false;
        moveUp = false;
        moveLeft = false;
      }
      if ( NPCLoc.x >= 320 && NPCLoc.y >= 320 ) {
        moveDown = false;
        moveRight = false;
        moveUp = false;
        moveLeft = true;
      }
      if ( NPCLoc.x <= 80 && NPCLoc.y >= 320 ) {
        moveDown = false;
        moveRight = false;
        moveUp = true;
        moveLeft = false;
      }
    }

    //level 3
    if ( level == 3 ) {
      if ( NPCLoc.y == 200 && NPCLoc.x == 200 ) {
        if ( moveUp ) { 
          moveDown = false;
          moveUp = true;
        } 
        else {
          moveDown = true;
          moveUp = false;
        }
      }
      if ( NPCLoc.y <= 10 ) {
        moveDown = true;
        moveUp = false;
      }
      if ( NPCLoc.y >= 390 ) {
        moveDown = false;
        moveUp = true;
      }
    }

    //level 4
    if ( level == 4 ) {

      if ( NPCLoc.x == 200 && NPCLoc.y == 10 ) {
        moveUp = false;
        moveLeft = true;
        moveDown = true;
        moveRight = false;
      }
      if ( NPCLoc.x == 10 && NPCLoc.y == 200 ) {
        moveUp = false;
        moveLeft = false;
        moveDown = true;
        moveRight = true;
      }
      if ( NPCLoc.x == 200 && NPCLoc.y == 390 ) {
        moveUp = true;
        moveLeft = false;
        moveDown = false;
        moveRight = true;
      }
      if ( NPCLoc.x == 390 && NPCLoc.y == 200 ) {
        moveUp = true;
        moveLeft = true;
        moveDown = false;
        moveRight = false;
      }
    }

    //level 5
    if ( level == 5 ) {
      if ( NPCLoc.x > player1.playerLoc.x ) {
        moveLeft = true;
      } 
      else {
        moveLeft = false;
      }
      if ( NPCLoc.x < player1.playerLoc.x ) {
        moveRight = true;
      } 
      else {
        moveRight = false;
      }
      if ( NPCLoc.y > player1.playerLoc.y ) {
        moveUp = true;
      } 
      else {
        moveUp = false;
      }
      if ( NPCLoc.y < player1.playerLoc.y ) {
        moveDown = true;
      } 
      else {
        moveDown = false;
      }
    }

    if ( moveUp ) {
      NPCLoc.y -= speed;
    }
    if ( moveRight ) {
      NPCLoc.x += speed;
    }
    if ( moveLeft ) {
      NPCLoc.x -= speed;
    }
    if ( moveDown ) {
      NPCLoc.y += speed;
    }
  }

  public void render() {     
    if ( level == 5 ) {
      image(NPC, NPCLoc.x, NPCLoc.y);
    } 
    else {
      image(NPCLos, NPCLoc.x, NPCLoc.y);
      image(NPC, NPCLoc.x, NPCLoc.y);
    }
    walkPath();
    if ( player1.playerLoc.dist(NPCLoc) < losRadian ) {
      restartLevel();
    }
  }
}


class Player {

  PVector playerLoc = new PVector(-100, -100);
  float angle;
  float radian;
  float speed = 0.85;
  float losRadian;


  Player() {
    if ( level.level == 1 ) {
      playerLoc = new PVector(200, 385);
    }
    if ( level.level == 2 ) {
      playerLoc = new PVector(200, 15);
    }
    if ( level.level == 3 ) {
      playerLoc = new PVector(80, 320);
    }
    if ( level.level == 4 ) {
      playerLoc = new PVector(360, 40);
    }
    if ( level.level == 5 ) {
      playerLoc = new PVector(75, 325);
    }
    angle = 0;
    radian = 0;
  }

  public void render() {

    angle = getAngle();
    radian = getRadian();
    losRadian = radians(angle-45);
    translate(playerLoc.x, playerLoc.y);
    imageMode(CORNER);
    rotate(losRadian);
    image(los, 0, 0);
    imageMode(CENTER);
    rotate(-losRadian);
    translate(-playerLoc.x, -playerLoc.y);
    image(playerPic, playerLoc.x, playerLoc.y);
  }

  public float getAngle() { //relative from the player to mouse
    float xTrig = mouseX - playerLoc.x; 
    float yTrig = mouseY - playerLoc.y;
    if ( xTrig == 0 && yTrig == 0 ) {
      return 0;
    } 
    else {
      angle = atan(yTrig/xTrig);
      angle = degrees(angle);
      if (xTrig < 0) {
        angle += 180;
      } 
      if (xTrig >= 0 && yTrig < 0) {
        angle += 360;
      }
      return angle;
    }
  }

  public float getRadian() {
    float temp = getAngle();
    return radians(temp);
  }

  public void move() {
    PVector direction = new PVector(0, 0);
    if ( W_ACTIVE ) {
      direction.y -= speed;
    }
    if ( A_ACTIVE ) {
      direction.x -= speed;
    }
    if ( S_ACTIVE ) {
      direction.y += speed;
    }
    if ( D_ACTIVE ) {
      direction.x += speed;
    }
    playerLoc.add(direction);
    if ( isCollision() ) {
      playerLoc.sub(direction);
    }
  }
}


