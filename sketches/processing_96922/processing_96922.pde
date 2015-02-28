
import java.util.PriorityQueue;

boolean createBoard, editingWidth, findingPath, setEnd, setBegin, diag, normCol;
int wide, high, editingType;
float editingStrength;
Arena board;
Tile lastTile, hoverTile;
final int sub = -1, rep = 0, add = 1, MIN_DIM = 4, MAX_DIM = 99;
ArrayList<Path> paths;
PriorityQueue<Path> toSearch;
Path displayedPath;

void setup() {
  size(550, 610);
  createBoard = true;
  editingWidth = true;
  findingPath = false;
  wide = 0;
  high = 0;
  editingStrength = 1;
  editingType = add;
  lastTile = null;
  displayedPath = null;
  diag = false;
  normCol = false;
}

void draw() {
  if (createBoard) {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(72);
    fill((editingWidth? 0xFFFF0000: 255));
    text("Width: " + wide, width/2, height/3);
    fill((!editingWidth? 0xFFFF0000: 255));
    text("Height: " + high, width/2, 2*height/3);
  } 
  else {
    background(0xFF008800);
    int maxDis = max(wide, high);
    noStroke();
    for (int r = 0; r < high;r++) {
      for (int c = 0; c < wide; c++) {
        if (board.isEnd(c, r)) fill(0xFFFF0000);
        else if (board.isStart(c, r)) fill(0xFF00FF00);
        else {
          if (normCol)
            fill(255*(1-board.getNormalizedDepth(c, r)));
          else
            fill(255*(1-board.getDepth(c, r)/PVector.dist(board.getStartVector(), board.getEndVector())));
        }

        rect(c*width/maxDis, 30+r*(height-60)/maxDis, 1+width/maxDis, 1+(height-60)/maxDis);
      }
    }
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(0, 30, wide*width/maxDis, high*(height-60)/maxDis);

    fill(0);
    textAlign(LEFT, TOP);
    text("Diagonal Mode: " + (diag? "ON": "OFF"), 0, 0);
    text("Color Normalized: " + (normCol? "ON": "OFF"), 2*width/3, 0);

    textSize(16);
    textAlign(LEFT, BOTTOM);
    fill(0);
    String et = "";
    if (findingPath) et = "SEARCHING";
    else if (setBegin) et = "BEGINING";
    else if (setEnd) et = "END";
    else if (editingType == add) et = "ADDITION";
    else if (editingType == sub) et = "SUBTRACTION";
    else if (editingType == rep) et = "REPLACE";
    text("Edit type: " + et, 0, height);
    text("Edit strength: " + nfc(editingStrength, 1), width/3, height);
    boolean badHover = hoverTile==null || board.isEnd(hoverTile.getX(), hoverTile.getY()) || board.isStart(hoverTile.getX(), hoverTile.getY());
    text("Tile depth: " + (badHover?"NaN": nfc(hoverTile.getDepth(), 1)), 2*width/3, height);

    if (findingPath && paths != null) {//draw positions
      ellipseMode(CORNER);
      int max = max(high, wide);

      for (Path p: toSearch) {
        if (p.getFinal() != board.getStartTile() && p.getFinal() != board.getEndTile()) {
          Tile fin = p.getFinal();
          stroke(0xFF0000FF);
          noFill();
          ellipseMode(CORNER);
          ellipse(fin.getX()*width/max, 30+fin.getY()*(height-60)/max, width/max, (height-60)/max);
        }
      }

      for (Path p: paths) {
        if (p.getFinal() != board.getStartTile() && p.getFinal() != board.getEndTile()) {
          Tile fin = p.getFinal();
          noStroke();
          float toEndRatio = PVector.dist(new PVector(fin.getX(), fin.getY()), board.getEndVector())/PVector.dist(board.getStartVector(), board.getEndVector());
          fill(255*toEndRatio, 255*(1-toEndRatio), 0, 128);
          ellipse(fin.getX()*width/max, 30+fin.getY()*(height-60)/max, width/max, (height-60)/max);
        }
      }
    }

    if (findingPath && displayedPath != null) {//show path
      ArrayList<Tile> path = displayedPath.getPath();
      int preX=-1, preY=-1, max = max(high, wide);
      int size = 2*min(width/max, (height-60)/max)/3;
      if (3*size/2 > 10) size = 10;
      stroke(0xFFFFFF00);
      strokeWeight(size);
      for (Tile t: path) {
        int newX = t.getX()*width/max + width/(2*max);
        int newY = t.getY()*(height-60)/max + 30+(height-60)/(2*max);
        if (preX != -1 && preY != -1)
          line(preX, preY, newX, newY);
        preX = newX;
        preY = newY;
      }
      fill(0);
      textAlign(LEFT, TOP);
      text("Path Distance: " + displayedPath.getDistance(), width/3, 0);
    }
  }
}

void createNewBoard() {
  board = new Arena(wide, high, new PVector(0, high-1), new PVector(wide-1, 0));
}

void editBoard(int x, int y) {
  switch (editingType) {
  case add: 
    board.addDepth(x, y, editingStrength);
    break;
  case sub: 
    board.addDepth(x, y, -editingStrength);
    break;
  case rep: 
    board.setDepth(x, y, editingStrength);
    break;
  }
}

void addPaths() {
  ArrayList<Tile> adj;
  Path searched;
  if (paths.isEmpty()) {
    adj = board.getAdjacent((int)board.getStartVector().x, (int)board.getStartVector().y, diag);
    searched = new Path(board.getStartTile(),board);
  }
  else {
    searched = toSearch.poll();
    if (searched == null)return;
    adj = board.getAdjacent(searched.getFinal().getX(), searched.getFinal().getY(), diag);
  }
  paths.add(searched);
  for (Tile t: adj) {
    if (t != null && t != board.getStartTile() && !t.hasPath()) {//check if relavent path
      Path newPath = new Path(searched, t,board);

      if (t == board.getEndTile() && displayedPath == null) {//check if done
        displayedPath = newPath;
      }

      if (t.shorterPath(newPath))
        t.setShortPath(newPath);
      toSearch.offer(newPath);
    }
  }
}

void resetPaths() {
  displayedPath = null;
  paths = new ArrayList<Path>();
  toSearch = new PriorityQueue<Path>();
  board.resetPaths();
}

void mousePressed() {
  mouseDragged();
}

void mouseClicked() {
  if (!createBoard && mouseButton == RIGHT) {
    boolean badHover = hoverTile==null || board.isEnd(hoverTile.getX(), hoverTile.getY()) || board.isStart(hoverTile.getX(), hoverTile.getY());
    if (!badHover)editingStrength = hoverTile.getDepth();
  }
}

void mouseDragged() {
  if (!createBoard && !findingPath) {
    if (mouseButton == LEFT) {
      int max = max(high, wide);
      Tile t = board.getTile(mouseX*max/width, (mouseY-30)*max/(height-60));
      if (setBegin) {
        int nX = mouseX*max/width, nY = (mouseY-30)*max/(height-60);
        board.setBegin(nX, nY);
      }
      else if (setEnd) {
        int nX = mouseX*max/width, nY = (mouseY-30)*max/(height-60);
        board.setEnd(nX, nY);
      }
      else if (t != lastTile && mouseY > 30 && mouseX > 0) {
        lastTile = t;
        editBoard(mouseX*max/width, (mouseY-30)*max/(height-60));
      }
    }
  }
}

void mouseReleased() {
  lastTile = null;
}

void mouseMoved() {
  if (!createBoard) {
    int max = max(high, wide);
    hoverTile = board.getTile(mouseX*max/width, (mouseY-30)*max/(height-60));
  }
}

void keyReleased() {
  if (key == 'b' || key == 'B')
    setBegin=false;
  else if (key == 'e' || key == 'E')
    setEnd = false;
}

void keyPressed() {
  if (createBoard) {

    if (key >= '0' && key <= '9') {
      if (editingWidth) {
        wide = 10*wide + (key-'0');
        if (wide > MAX_DIM) wide = MAX_DIM;
      } 
      else {
        high = 10*high + (key - '0');
        if (high > MAX_DIM) high = MAX_DIM;
      }
    } 
    else if (keyCode == BACKSPACE) {
      if (editingWidth) {
        wide /=10;
      } 
      else {
        high /=10;
      }
    } 
    else if (key == TAB || key == '-') {
      editingWidth = !editingWidth;
    } 
    else if (key == '\n') {
      if (wide < MIN_DIM)
        editingWidth = true;
      else if (high < MIN_DIM)
        editingWidth = false;
      else {
        createBoard = false;
        createNewBoard();
      }
    }
  } 
  else if (findingPath) {
    if (key == ' ') addPaths();
    if (key == '\n' || key == '\r') {
      if (displayedPath != null) {
        findingPath = false;
        paths = null;
        toSearch = null;
      } 
      else
        while (displayedPath == null) {
          addPaths();
        }
    }
    if (key == BACKSPACE) {
      createBoard = true;
      findingPath = false;
    }
    else if (key == 'n' || key == 'N')
      normCol = !normCol;
  }
  else {
    if (key == 'a' || key == 'A')
      editingType = add;
    else if (key == 's' || key == 'S')
      editingType = sub;
    else if (key == 'r' || key == 'R')
      editingType = rep;
    else if (key == BACKSPACE)
      createBoard = true;
    else if (key == '1' || key == '-') {
      editingStrength -= .1;
      if (editingStrength < 0) editingStrength = 0;
    }
    else if (key == '2' || key == '+')editingStrength += .1;
    else if (key == '\n' || key == '\r') {
      findingPath = true;
      resetPaths();
      addPaths();
    }
    else if (key == 'b' || key == 'B')
      setBegin=true;
    else if (key == 'e' || key == 'E')
      setEnd = true;
    else if (key == 'd' || key == 'D')
      diag = !diag;
    else if (key == 'n' || key == 'N')
      normCol = !normCol;
  }
}

class Arena {
  final int w, h;
  Tile[][] board;
  PVector st, en;
  float maxDepth, distanceTo;

  Arena(int wide, int high, PVector start, PVector end) {
    w = wide;
    h = high;
    createBoard(start, end);
  }

  void createBoard(PVector start, PVector end) {
    st = start;
    en = end;
    distanceTo = -1;
    board = new Tile[w][h];
    maxDepth = 1;
    for (int x = 0; x < w; x++)
      for (int y = 0; y < h; y++) {
        if (st.x == x && st.y == y)
          board[x][y] = new Tile(1, Tile.START, x, y);
        else if (en.x == x && en.y == y)
          board[x][y] = new Tile(1, Tile.END, x, y);
        else board[x][y] = new Tile(1, Tile.NORM, x, y);
      }
  }

  void addDepth(int x, int y, float addition) {
    if (x < 0 || y < 0 || x >= w || y >= h) return;
    board[x][y].addDepth(addition);
    resetMaxDepth();
  }

  void setDepth(int x, int y, float newDepth) {
    if (x < 0 || y < 0 || x >= w || y >= h) return;
    board[x][y].setDepth(newDepth);
    resetMaxDepth();
  }

  float getDistanceToEnd(int x, int y) {
    return sqrt(sq(x-en.x) + sq(y - en.y));
  }

  void resetMaxDepth() {
    maxDepth = 0;
    for (int x = 0; x < w; x++)
      for (int y = 0; y < h; y++)
        if (board[x][y].getDepth() > maxDepth)
          maxDepth = board[x][y].getDepth();
  }

  void resetPaths() {
    for (int c = 0; c < wide; c++)
      for (int r = 0; r < high; r++)
        board[c][r].setShortPath(null);
  }

  void compareDistanceTo(Path p, ArrayList<Path> usable) {
    if (p.getDistance() < distanceTo || distanceTo == -1) {
      distanceTo = p.getDistance();
      usable.remove(p);
    }
  }

  Tile getTile(int x, int y) {
    if (x < 0 || y < 0 || x >= w || y >= h) return null;
    return board[x][y];
  }

  float getDepth(int x, int y) {
    if (x < 0 || y < 0 || x >= w || y >= h) return -1;
    return board[x][y].getDepth();
  }

  float getNormalizedDepth(int x, int y) {
    if (x < 0 || y < 0 || x >= w || y >= h) return -1;
    return board[x][y].getDepth()/maxDepth;
  }

  boolean isStart(int x, int y) {
    return x == st.x && y == st.y;
  }

  boolean isEnd(int x, int y) {
    return x == en.x && y == en.y;
  }

  void setBegin(int x, int y) {
    x = max(0, x);
    y = max(0, y);
    x = min(wide-1, x);
    y = min(high-1, y);
    PVector nV = new PVector(x, y);
    if(nV.equals(en)) return;
    getStartTile().setType(Tile.NORM);
    st = nV;
    getStartTile().setType(Tile.START);
  }

  void setEnd(int x, int y) {
    x = max(0, x);
    y = max(0, y);
    x = min(wide-1, x);
    y = min(high-1, y);
    PVector nV = new PVector(x, y);
    if(nV.equals(st)) return;
    getEndTile().setType(Tile.NORM);
    en = nV;  
    getEndTile().setType(Tile.END);
  }

  ArrayList<Tile> getAdjacent(int x, int y, boolean diag) {
    ArrayList<Tile> adj = new ArrayList<Tile>();
    if (x > 0) adj.add(getTile(x-1, y));
    if (y > 0) adj.add(getTile(x, y-1));
    if (y < h-1) adj.add(getTile(x, y+1));
    if (x < w-1) adj.add(getTile(x+1, y));
    if (diag) {
      if (x > 0) {
        if (y > 0) adj.add(getTile(x-1, y-1));
        if (y < h-1) adj.add(getTile(x-1, y+1));
      }
      if (x < w-1) {
        if (y > 0) adj.add(getTile(x+1, y-1));
        if (y < h-1) adj.add(getTile(x+1, y+1));
      }
    }
    return adj;
  }

  PVector getEndVector() {
    return en;
  }

  PVector getStartVector() {
    return st;
  }

  Tile getEndTile() {
    return getTile((int)en.x, (int)en.y);
  }

  Tile getStartTile() {
    return getTile((int)st.x, (int)st.y);
  }
}

class Path implements Comparable<Path>{
  ArrayList<Tile> tilePath;
  float distance;
  Arena area;
  
  Path(Tile start, Arena board){//creates "start path"
    tilePath = new ArrayList<Tile>();
    tilePath.add(start);
    distance = 0;
    area = board;
  }
  
  Path(ArrayList<Tile> path, Tile addition, Arena board){
    tilePath = new ArrayList<Tile>();
    for(Tile t: path){
      tilePath.add(t);
      distance += t.getDepth();
    }
    if(addition != null){
      tilePath.add(addition);
      distance += addition.getDepth();
    }
    area = board;
  }
  
  Path(Path previous, Tile addition, Arena board){
    tilePath = new ArrayList<Tile>();
    distance = previous.distance;
    for(Tile t: previous.getPath())
      tilePath.add(t);
    if(addition!= null){
      distance += addition.getDepth();
      tilePath.add(addition);
    }
    area = board;
  }
  
  float getDistance(){
    return distance;
  }
  
  Tile getFinal(){
    return tilePath.get(tilePath.size() - 1);
  }
  
  ArrayList<Tile> getPath(){
    return tilePath;
  }
  
  void addTile(Tile addition){
    tilePath.add(addition);
    distance += addition.getDepth();
  }
  
  int compareTo(Path other){
    float thisDis, othDis;
    thisDis = distance + area.getDistanceToEnd(getFinal().getX(),getFinal().getY());
    othDis = other.distance + area.getDistanceToEnd(other.getFinal().getX(),other.getFinal().getY());
    
    return (thisDis > othDis? 1: (thisDis==othDis? 0: -1));
  }
}
class Tile{
  int x,y;
  float depth;
  String type;
  Path shortPath;
  static final String START = "START", END = "END", NORM = "NORM";
  
  Tile(float depth, String type, int x, int y){
    this.depth = depth;
    this.type = type;
    this.x = x;
    this.y = y;
    shortPath = null;
  }
  
  void addDepth(float addition){
    depth += addition;
    if(depth < 0) depth = 0;
  }
  
  void setDepth(float newDepth){
    depth = newDepth;
    if(depth < 0) depth = 0;
  }
  
  float getDepth(){
    if(type != NORM) return 0;
    return depth;
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  boolean hasPath(){
    return shortPath != null;
  }
  
  boolean shorterPath(Path other){
    return !hasPath() || shortPath.getDistance() > other.getDistance();
  }
  
  void setShortPath(Path newPath){
    shortPath = newPath;
  }
  
  String getType(){
    return type;
  }
  
  void setType(String newType){
    type = newType;
  }
}


