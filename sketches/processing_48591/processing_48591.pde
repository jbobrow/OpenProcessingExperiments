
// Game of life 0.0.2
// by AFVG
GameOfLife gol;

void setup(){
  size(800, 600);
  smooth();
  gol = new GameOfLife(80, 60, 1);
}

void draw(){
  background(0);
  gol.run();
}

class Cell {
  int x;
  int y;
  int alive;
  int[] neighbours;
  int gameWidth, gameHeight;
  int mypos;
  int myrow;
  
  Cell(int x_a, int y_a, int alive_a, int gameWidth_a, int gameHeight_a){
    x = x_a;
    y = y_a;
    alive = alive_a;
    neighbours = new int[8];
    gameWidth = gameWidth_a;
    gameHeight = gameHeight_a;
  }
  
  void invertCell(){
    if (alive == 1){
      alive = 0;
    }
    else {
      alive = 1;
    }
  }
  
  void getMyNeighbours(){
    // Matrix estructure
    // 1(x0, y0), 2(x1, y0), 3(x2, y0)
    // 4(x0, y1), 5(x1, y1), 6(x2, y1)
    // 7(x0, y2), 8(x1, y2), 9(x2, y2)
    
    myrow = y * gameWidth;
    mypos = myrow + x;
    
    neighbours[0] = mypos - gameWidth - 1;
    neighbours[1] = mypos - gameWidth;
    neighbours[2] = mypos - gameWidth + 1;
    neighbours[3] = mypos - 1;
    neighbours[4] = mypos + 1;
    neighbours[5] = mypos + gameWidth - 1;
    neighbours[6] = mypos + gameWidth;
    neighbours[7] = mypos + gameWidth + 1;
    
    // check for borders (left)
    if (x == 0){
      neighbours[0] = -1;
      neighbours[3] = -1;
      neighbours[5] = -1;
    }
    
    // check for borders (top)
    if (y == 0) {
      neighbours[0] = -1;
      neighbours[1] = -1;
      neighbours[2] = -1;
    }
    
    // check for borders (right)
    if (neighbours[4] % gameWidth == 0) {
      neighbours[2] = -1;
      neighbours[4] = -1;
      neighbours[7] = -1;
    }
    
    // check for borders (bottom)
    if (y == gameHeight - 1) {
      neighbours[5] = -1;
      neighbours[6] = -1;
      neighbours[7] = -1;
    }
  }
  
  
      
}

// class game of life
class GameOfLife {
  ArrayList curgame;
  ArrayList nextgame;
  int gameWidth, gameHeight;
  // game mode
  // 0 -> play  
  // 1 -> step
  int mode;
  
  GameOfLife(int gameWidth_a, int gameHeight_a, int mode_a){
    curgame = new ArrayList();
    nextgame = new ArrayList();
    gameWidth = gameWidth_a;
    gameHeight = gameHeight_a;
    mode = mode_a;
    seed_random();
  }
  
  void seed_random() {
    for (int i = 0; i < gameHeight; i++) {
      for (int j = 0; j < gameWidth; j++) {
        int alive = int(random(2));
        curgame.add(new Cell(j, i, alive, gameWidth, gameHeight));
        nextgame.add(new Cell(j, i, alive, gameWidth, gameHeight));
      }
    }
    for (int i = 0; i < curgame.size(); i++) {
      Cell curcell = (Cell) curgame.get(i);
      Cell nextcell = (Cell) nextgame.get(i);
      curcell.getMyNeighbours();
      nextcell.getMyNeighbours();
    }
  }
  
  int countNeighbours(Cell curcell){
    int counter = 0;
    if (mode == 1) {
      println("x = " + curcell.x + "  y = " + curcell.y);
      println("mypos = " + curcell.mypos + "  myrow = " + curcell.myrow);
    }
    for (int i = 0; i < 8; i++) {
      if (mode == 1) { 
        println("curcell.neigbours[" + str(i) + "] = " + str(curcell.neighbours[i]));
      }
      if (curcell.neighbours[i] != -1) {
        Cell aroundcell = (Cell) curgame.get(curcell.neighbours[i]);
        counter +=  aroundcell.alive;
        if (mode == 1) {
          println("aroundcell.alive = " + aroundcell.alive);
        }
      }
    }
    if (mode == 1) { 
      println("counter = " + str(counter));
      println("====================");
    }
    return counter;
  }
  
  void drawGame(){
    float lenght_x =  width / gameWidth;
    float lenght_y =  height / gameHeight;
    for (int i = 0; i < curgame.size(); i++) {
      color cellcolor = color(0); // black -> not alive
      Cell curcell = (Cell) curgame.get(i);
      if (curcell.alive == 1){ cellcolor = color(255); }// white -> alive}
      fill(cellcolor);
      rect(curcell.x * lenght_x, curcell.y * lenght_y, lenght_x, lenght_y);
    }
  }
  
  void next(){
    if (mode == 1) { println("GameOfLife.next()!!!"); }
    for (int i = 0; i < curgame.size(); i++) {
      Cell curcell = (Cell) curgame.get(i);
      Cell nextcell = (Cell) nextgame.get(i);
      int alives = countNeighbours(curcell);
      if (curcell.alive == 1) {
        if (alives < 2 || alives > 3) { nextcell.invertCell(); }
      }
      else if(curcell.alive == 0) {
        if (alives == 3) { nextcell.invertCell(); }
      }
      else { println("next() wtf?"); }
    }
    for (int i = 0; i < curgame.size(); i++) {
      Cell curcell = (Cell) curgame.get(i);
      Cell nextcell = (Cell) nextgame.get(i);
      curcell.alive = nextcell.alive;
    }        
  }
  
  void run() {
    drawGame();
    if (mode == 0) { next(); }
  }
             
}

void keyReleased() {
  if (key == 's') {
    gol.mode = 1;
    gol.next();
  }
  else if (key == 'p') {
   gol.mode = 0;
  }
  else if (key == 'n') {
    gol = new GameOfLife(80, 60, 1);
  }
  
}
  

