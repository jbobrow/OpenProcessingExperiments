
class Field {
  int pine_count = 40, end_lock = 0;
  int game_status, mark_count;
   
  int[][] neigh = new int[18][18];
  int[][] visible = new int[18][18];
  int[][] marked = new int[18][18];
  
  PFont font;
  PImage mark, tree;
  
  Field() {
    prepareField();
    font = loadFont("FreeSans-48.vlw");
    mark = loadImage("mark.png");
    tree = loadImage("tree.png");
  }

  void prepareField() {
    //zeroing all previous values
    game_status = 0;
    mark_count = pine_count;
    for (int i=0; i<18; i++) {
      for (int j=0; j<18; j++) {
        neigh[i][j] = 0;
        visible[i][j] = 0;
        marked[i][j] = 0;
      }
    }
    
    //placing pines
    int add_pine = 0, temp_x, temp_y;
    for (int i=0; i< pine_count; i++) {
      while (add_pine != 1) {
        temp_x = int(random(16)) + 1;
        temp_y = int(random(16)) + 1;
        if (neigh[temp_x][temp_y] == 0) {
          neigh[temp_x][temp_y] = -1;
          add_pine = 1;
        }
      }
      add_pine = 0;
    }
    
    //counting neighbour pines
    for (int i=1; i<17; i++) {
      for (int j=1; j<17; j++) {
        if (neigh[i][j] > -1) {
          if (neigh[i-1][j-1] == -1) neigh[i][j]++;
          if (neigh[i-1][j] == -1) neigh[i][j]++;
          if (neigh[i-1][j+1] == -1) neigh[i][j]++;
          if (neigh[i][j-1] == -1) neigh[i][j]++;
          if (neigh[i][j+1] == -1) neigh[i][j]++;
          if (neigh[i+1][j-1] == -1) neigh[i][j]++;
          if (neigh[i+1][j] == -1) neigh[i][j]++;
          if (neigh[i+1][j+1] == -1) neigh[i][j]++;
        }
      }
    }
  }
  
  void mainLoop() {
    drawField();
    if (game_status != 0) {
      visibleAll();
      end_lock = 1;
      endGame();
    }
  }
  
  void drawField() {
    textFont(font,20);
    stroke(189,186,119);
    
    //drawing backgrounds
    for (int i=0; i<17; i++) {
      for (int j=0; j<17; j++) {
        if (visible[i][j] == 0 && marked[i][j] == 0) fill(#45CC33);
        if (visible[i][j] == 1) fill(#DBD997);
        rect((i-1)*30,(j-1)*30,30,30);
        if (marked [i][j] == 1) image(mark,(i-1)*30+1,(j-1)*30+1);
        if (visible[i][j] == 1 && neigh[i][j] == -1) image(tree,(i-1)*30+1,(j-1)*30+1);
      }
    }
    
    //adding numbers
    for (int i=0; i<17; i++) {
      for (int j=0; j<17; j++) {
       if (neigh[i][j] > 0 && visible[i][j] == 1) {
         fill(0,133,2);
         text(neigh[i][j],(i-1)*30+10,(j)*30-5);
       }
      }
    }
  }
  
  void endGame() {
    textFont(font,28);
    noStroke();
    fill(189,186,119);
    rect(61,61,330,30);
    fill(255);
    if (game_status == 1) text("You Won! Click to restart",71,85);
    else text("You Lost! Click to restart",71,85);
  }
    
  
  void processClick(int x, int y, int button) {
    x = round(x/30) + 1;
    y = round(y/30) + 1;
    if(game_status == 0 && button == 1) {
      if (neigh[x][y] == -1) game_status = 2;
      if (neigh[x][y] == 0) showNeighbours(x, y);
      if (neigh[x][y] > 0) makeVisible(x,y);
    }
    if(game_status == 0 && button == 2) markPine(x,y);
    if(game_status != 0 && end_lock == 1) startGame();
  }
  
  void startGame() {
    end_lock = 0;
    prepareField();
  }
  
  void markPine(int x, int y) {
    int lock = 0;
    //mark a pine
    if (marked[x][y] == 0 && visible[x][y] == 0 && mark_count > 0) {
      marked[x][y] = 1;
      mark_count--;
      lock = 1;
    }
    
    //unmark a pine
    if (marked[x][y] == 1 && lock == 0) {
      marked[x][y] = 0;
      mark_count++;
    }
    lock = 0;
    //check if all pines are marked
    for (int i=1; i<17;i++) {
      for (int j=1; j<17;j++) {
        if(neigh[i][j] == -1 && marked[i][j] == 1) lock++;
      }
    }
    if (lock==pine_count) game_status = 1;
  }
    
  void showNeighbours(int x, int y) {
    makeVisible(x,y);
    
    if (x > 0 && x < 17 && y > 0 && y < 17) {
      if (neigh[x-1][y-1] == 0 && visible[x-1][y-1] == 0) showNeighbours(x-1,y-1);
      if (neigh[x-1][y] == 0 && visible[x-1][y] == 0) showNeighbours(x-1,y);
      if (neigh[x-1][y+1] == 0 && visible[x-1][y+1] == 0) showNeighbours(x-1,y+1);
      if (neigh[x][y-1] == 0 && visible[x][y-1] == 0) showNeighbours(x,y-1);
      if (neigh[x][y+1] == 0 && visible[x][y+1] == 0) showNeighbours(x,y+1);
      if (neigh[x+1][y-1] == 0 && visible[x+1][y-1] == 0) showNeighbours(x+1,y-1);
      if (neigh[x+1][y] == 0 && visible[x+1][y] == 0) showNeighbours(x+1,y);
      if (neigh[x+1][y+1] == 0 && visible[x+1][y+1] == 0) showNeighbours(x+1,y+1);
      
      if (neigh[x-1][y-1] > 0 && visible[x-1][y-1] == 0) makeVisible(x-1,y-1);
      if (neigh[x-1][y] > 0 && visible[x-1][y] == 0) makeVisible(x-1,y);
      if (neigh[x-1][y+1] > 0 && visible[x-1][y+1] == 0) makeVisible(x-1,y+1);
      if (neigh[x][y-1] > 0 && visible[x][y-1] == 0) makeVisible(x,y-1);
      if (neigh[x][y+1] > 0 && visible[x][y+1] == 0) makeVisible(x,y+1);
      if (neigh[x+1][y-1] > 0 && visible[x+1][y-1] == 0) makeVisible(x+1,y-1);
      if (neigh[x+1][y] > 0  && visible[x+1][y] == 0) makeVisible(x+1,y);
      if (neigh[x+1][y+1] > 0 && visible[x+1][y+1] == 0) makeVisible(x+1,y+1);
    }
  }
  
  void visibleAll() {
    for (int i=1; i<17; i++) {
      for (int j=1; j<17; j++) {
        visible[i][j] = 1;
        marked[i][j] = 0;
      }
    }
  }
  
  void makeVisible(int x, int y) {
    visible[x][y] = 1;
    if (marked[x][y] == 1) {
      marked[x][y] = 0;
      mark_count++;
    }
  }
}

