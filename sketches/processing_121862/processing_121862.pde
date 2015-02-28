
Block[][] blocks;
Colors colors;
Hero hero; 

int moveTracker;
int conflictTracker;

void setup() {
  size(400, 400);
  frameRate(30);
  noStroke();
  restart();
}

void restart() {
  blocks = new Block[5][5];
  colors = new Colors();
  hero = new Hero(2, 4);
  setupBlocks();
  moveTracker = 0;
  conflictTracker = 0;
}

void setupBlocks() {
  for(int i = 0; i < blocks.length; i++) {
    for(int j = 0; j < blocks[i].length; j++) {
      blocks[i][j] = new Block(i, j);
    }
  }
}

void draw() {
  drawBlocks();
  drawHero();
  drawText();
}

void drawBlocks() {
  for(int i = 0; i < blocks.length; i++) {
    for(int j = 0; j < blocks[i].length; j++) {
      blocks[i][j].drawBlock("Standard");
    }
  }
}

void drawHero() {
  blocks[hero.hor][hero.ver].drawBlock("Hero");
}

void drawText() {
  fill(255);
  textSize(14);
  text(moveTracker + " Hours Elapsed\n" + conflictTracker + " Paradoxes Opened", 20, 20);
}



void keyPressed() {
  if (keyCode == UP) {
    hero.move("Up");
  }
  if (keyCode == DOWN) {
    hero.move("Down");
  }
  if (keyCode == LEFT) {
    hero.move("Left");
  }
  if (keyCode == RIGHT) {
    hero.move("Right");
  }
  if (key == ' ') {
    restart();
  }
}
class Block {
  int hor;
  int ver;
  int size = width/blocks.length;
  int horDistance;
  int verDistance;
  boolean used;
  boolean conflict;
  
  
  Block(int X, int Y) {
    hor = X; 
    ver = Y;
    horDistance = size*hor;
    verDistance = size*ver;
    used = false;
    conflict = false;
  }
  
  
  void drawBlock(String Type) {
    if(Type == "Standard") {
      if(used == false) {
        fill(colors.unused);
      }
      else {
        if(conflict == false) {
          fill(colors.used);
        }
        else {
          fill(colors.conflict);
        }
      }
    }
    else if(Type == "Hero") {
      fill(colors.hero);
    }
    rect(horDistance, verDistance, size, size);
    
  }
  
  void deplete() {
    if(used == false) {
      used = true;
    }
    else if (conflict == false) {
      conflict = true;
      conflictTracker += 1;
    }
  }
}
class Colors {
  color unused = #321043;
  color used = #545196;
  color hero = #FFDE58;
  color conflict = #F0674C;
  
  Colors() {
    
    
  }
}
class Hero {
  int hor;
  int ver;
  
  
  Hero(int X, int Y) {
    hor = X;
    ver = Y;
    
  }
  
  void move(String Direction) {
    moveTracker += 1;
    if(Direction == "Up" && ver > 0) {
      blocks[hor][ver].deplete();
      ver -= 1;
    }
    if(Direction == "Down" && ver < blocks[0].length - 1) {
      blocks[hor][ver].deplete();
      ver += 1;
    }
    if(Direction == "Left" && hor > 0) {
      blocks[hor][ver].deplete();
      hor -= 1;
    }
    if(Direction == "Right" && hor < blocks.length - 1) {
      blocks[hor][ver].deplete();
      hor += 1;
    } 
  }
}


