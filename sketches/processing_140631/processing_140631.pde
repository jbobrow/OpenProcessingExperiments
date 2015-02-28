
final int fX = 96;
final int fY = 64;
final int players = 4;
final int sidel = 6;

// Active key detection
// Allows smoother controls
int keyud = 0;
int keylr = 0;

int keyws = 0;
int keyad = 0;

int[][] field;

ArrayList<Snake> slithers;

boolean[] forceMove, aion;

void setup() {
//  size(sidel*fX, sidel*fY);
  size(576, 384);
  colorMode(HSB);
  frameRate(12);
  noStroke();

  field = new int[fX][fY];
  
  aion = new boolean[players];
  forceMove = new boolean[players];
  for (int i = 0; i < players; i++){
    forceMove[i] = true;
    aion[i] = true;
  }
  
  //aion[0] = false;
  
  slithers = new ArrayList();

  newGame();
}

void draw() {
  for (int i = 0; i < fX; i++)
    for (int j = 0; j < fY; j++)
      if (field[i][j] != 0) {
        fill(field[i][j], 192, 192);
        rect(sidel*i, sidel*j, sidel, sidel);
      } 


  
  for (int i = 1; i < players; i++)
    if(aion[i])
      AI1(slithers.get(i));

  for (int i = 0; i < players; i++)
    if (forceMove[i]) 
      slithers.get(i).tick();
    else
      forceMove[i] = true;
  //ArrayList<Integer[]> tempArray = new ArrayList();
  //println(countVol(1, 1, tempArray).size());
}

void keyPressed() {
  gameKeyPressed();
}

void newGame() {
  background(0);
  for (int i = 0; i < fX; i++)
    for (int j = 0; j < fY; j++)
      field[i][j] = 0;

  slithers.clear();
  /*
  if (players >=1)
    slithers.add(new Snake(3*fX/4, 3*fY/4, -1, 64, 0));
  if (players >=2)
    slithers.add(new Snake(fX/4, fY/4, 1, 128, 1));
  if (players >=3)
    slithers.add(new Snake(3*fX/4, fY/4, 3, 192, 2));
  if (players >=4)
    slithers.add(new Snake(fX/4, 3*fY/4, -3, 1, 3));

  if (players >=5)
    slithers.add(new Snake(fX/2, 3*fY/4, -1, 32, 0));
  if (players >=6)
    slithers.add(new Snake(fX/2, fY/4, 1, 96, 1));
  if (players >=7)
    slithers.add(new Snake(3*fX/4, fY/2, 3, 160, 2));
  if (players >=8)
    slithers.add(new Snake(fX/4, fY/2, -3, 224, 3));
  */  
  for(int i = 0; i < players; i++)
    slithers.add(new Snake(int(random(fX)), int(random(fY)), -1, 32*i+1, int(random(4))));
}

void AI1(Snake s) {
  if (s.alive) {
    int high = 0;
    int adj = 0;
    ArrayList<Integer[]> tArray;
    int tcount = 0;
    tArray = new ArrayList();
    int tarX = s.x; 
    int tarY = s.y;
    ArrayList<Integer> choices = new ArrayList();
    if (s.alive) {
      switch(s.dir) {
      case  1:
        tarX++;
        break;
      case  3:
        tarY++;
        break;
      case -1:
        tarX--;
        break;
      case -3:
        tarY--;
        break;
      }
    }
    if (s.x+1 < fX) 
      if (field[s.x+1][s.y] == 0) {
        tArray.clear();
        tcount = countVol(s.x+1, s.y, tArray).size();
        if (tcount-10 > high) {
          high = tcount;
          adj = countadj(s.x+1, s.y);
          choices.clear();
          choices.add(1);
        }
        else if (tcount >= high) {
          if (countadj(s.x+1, s.y) > adj && adj < 2) {
            adj = 2;
            choices.clear();
            choices.add(1);
          }
          else if (countadj(s.x+1, s.y) >= adj)
            choices.add(1);
        }
      }
    if (s.x-1 >= 0) 
      if (field[s.x-1][s.y] == 0) {
        tArray.clear();
        tcount = countVol(s.x-1, s.y, tArray).size();
        if (tcount-10 > high) {
          high = tcount;
          adj = countadj(s.x+1, s.y);
          choices.clear();
          choices.add(-1);
        }
        else if (tcount >= high) {
          if (countadj(s.x-1, s.y) > adj && adj < 2) {
            adj = 2;
            choices.clear();
            choices.add(-1);
          }
          else if (countadj(s.x-1, s.y) >= adj)
            choices.add(-1);
        }
      }
    if (s.y+1 < fY)
      if (field[s.x][s.y+1] == 0) {
        tArray.clear();
        tcount = countVol(s.x, s.y+1, tArray).size();
        if (tcount-10 > high) {
          high = tcount;
          adj = countadj(s.x+1, s.y);
          choices.clear();
          choices.add(3);
        }
        else if (tcount >= high) {
          if (countadj(s.x, s.y+1) > adj && adj < 2) {
            adj = 2;
            choices.clear();
            choices.add(3);
          }
          else if (countadj(s.x, s.y+1) >= adj)
            choices.add(3);
        }
      }
    if (s.y-1 >= 0) 
      if (field[s.x][s.y-1] == 0) {
        tArray.clear();
        tcount = countVol(s.x, s.y-1, tArray).size();
        if (tcount-10 > high) {
          high = tcount;
          adj = countadj(s.x+1, s.y);
          choices.clear();
          choices.add(-3);
        }
        else if (tcount >= high) {
          if (countadj(s.x, s.y-1) > adj && adj < 2) {
            adj = 2;
            choices.clear();
            choices.add(-3);
          }
          else if (countadj(s.x, s.y-1) >= adj)
            choices.add(-3);
        }
      }
    if (choices.size() > 0) {
      /*boolean contains = false;
       for (int n: choices)
       if (n == s.dir)
       contains = true;
       if (contains == false)
       //s.dir = choices.get(0);*/
      s.dir = choices.get(floor(random(0, choices.size())));
    }
  }
}

int countadj(int x, int y) {
  int ret = 0;
  if (x >= 0 && y >= 0 && x < fX && y < fY) {
    if (x > 0)
      if (field[x-1][y] == 0)
        ret++;
    if (y > 0)
      if (field[x][y-1] == 0)
        ret++;
    if (x < fX-1)
      if (field[x+1][y] == 0)
        ret++;
    if (y < fY-1)
      if (field[x][y+1] == 0)
        ret++;
  }
  if (ret == 3)
    ret--;
  return ret;
}

ArrayList<Integer[]> countVol(int x, int y, ArrayList<Integer[]> visited) {
  boolean visit = false;
  if (visited.size() > 105)
    return visited;
  if (x >= 0 && y >= 0 && x < fX && y < fY) {
    for (Integer[] i: visited)
      if (i[0] == x && i[1] == y)
        visit = true;
    if (visit == false)
      if (field[x][y] == 0) {
        Integer[] temp = new Integer[2];
        temp[0] = x;
        temp[1] = y;
        visited.add(temp); 
        visited = countVol(x+1, y, visited);
        visited = countVol(x-1, y, visited);
        visited = countVol(x, y+1, visited);
        visited = countVol(x, y-1, visited);
        return visited;
      }
  }
  return visited;
}

// Detects active keys
void gameKeyPressed() {
  if (players >=1)
    arrowKeys(slithers.get(0));

  /*if (players >=2)
    wasd(slithers.get(1));

  if (players >=3)
    tfgh(slithers.get(2));

  if (players >=4)
    ijkl(slithers.get(3));*/

  if (key == 'r' || key == 'R') newGame();
}

// Detects when keys go inactive
void gameKeyReleased() {
  if (key == CODED) {
    if (keyCode == UP    && keyud == -1) keyud = 0;
    if (keyCode == LEFT  && keylr == -1) keylr = 0;
    if (keyCode == RIGHT && keylr == 1)  keylr = 0;
    if (keyCode == DOWN  && keyud == 1)  keyud = 0;
  }

  if ((key == 'w' || key == 'W') && keyws == -1) keyws = 0;
  if ((key == 'a' || key == 'A') && keyad == -1) keyad = 0;
  if ((key == 'd' || key == 'D') && keyad == 1)  keyad = 0;
  if ((key == 's' || key == 'S') && keyws == 1)  keyws = 0;
}

void arrowKeys(Snake s) {
  if (key == CODED) {
    if (keyCode == UP    && s.dir != 3 && s.dir != -3) {
      s.dir = -3; 
      s.tick(); 
      forceMove[s.id] = false;
    }
    if (keyCode == LEFT  && s.dir != 1 && s.dir != -1) {
      s.dir = -1; 
      s.tick(); 
      forceMove[s.id] = false;
    }
    if (keyCode == RIGHT && s.dir != -1 && s.dir != 1) {
      s.dir = 1;  
      s.tick(); 
      forceMove[s.id] = false;
    }
    if (keyCode == DOWN  && s.dir != -3 && s.dir != 3) {
      s.dir = 3;  
      s.tick(); 
      forceMove[s.id] = false;
    }
  }
}

void wasd(Snake s) {
  if (key == 'w' || key == 'W' && s.dir != 3 && s.dir != -3) {
    s.dir = -3; 
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'a' || key == 'A' && s.dir != 1 && s.dir != -1) {
    s.dir = -1; 
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'd' || key == 'D' && s.dir != -1 && s.dir != 1) {
    s.dir = 1;  
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 's' || key == 'S' && s.dir != -3 && s.dir != 3) {
    s.dir = 3;  
    s.tick(); 
    forceMove[s.id] = false;
  }
}

void tfgh(Snake s) {
  if (key == 't' || key == 'T' && s.dir != 3 && s.dir != -3) {
    s.dir = -3; 
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'f' || key == 'F' && s.dir != 1 && s.dir != -1) {
    s.dir = -1; 
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'h' || key == 'H' && s.dir != -1 && s.dir != 1) {
    s.dir = 1;  
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'g' || key == 'G' && s.dir != -3 && s.dir != 3) {
    s.dir = 3;  
    s.tick(); 
    forceMove[s.id] = false;
  }
}

void ijkl(Snake s) {
  if (key == 'i' || key == 'I' && s.dir != 3 && s.dir != -3) {
    s.dir = -3; 
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'j' || key == 'J' && s.dir != 1 && s.dir != -1) {
    s.dir = -1; 
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'l' || key == 'L' && s.dir != -1 && s.dir != 1) {
    s.dir = 1;  
    s.tick(); 
    forceMove[s.id] = false;
  }
  if (key == 'k' || key == 'K' && s.dir != -3 && s.dir != 3) {
    s.dir = 3;  
    s.tick(); 
    forceMove[s.id] = false;
  }
}

class Snake {
  int x, y;

  /*
    1 : right
   3 : down
   -1 : left
   -3 : up
   */
  int dir;
  int hue;
  boolean alive;
  int id;

  Snake(int tx, int ty, int td, int thue, int tid) {
    x   = tx;
    y   = ty;
    dir = td;
    hue = thue;
    alive = true;
    id = tid;

    field[x][y] = hue;
  }

  void tick() {
    if (alive) {
      switch(dir) {
      case  1:
        x++;
        break;
      case  3:
        y++;
        break;
      case -1:
        x--;
        break;
      case -3:
        y--;
        break;
      }
      if (x < 0 || y < 0 || x >= fX || y >= fY) 
        alive = false;
      else if (field[x][y] != 0)
        alive = false;
      else
        field[x][y] = hue;
    }
    fill(hue, 192, 192);
    rect(sidel*x, sidel*y, sidel, sidel);
  }

  void kill() {
    alive = false;
  }

  void reset(int tx, int ty, int td) {
    x   = tx;
    y   = ty;
    dir = td;
    alive = true;

    field[x][y] = hue;
  }
}



