
class Tile {
  int row, col;
  int type; //0=space, 1=wall

  Tile (int r, int c, int t) {
    row = r;
    col = c;
    type = t;
  }
}

Tile[][] maze;
int rows;
int cols;

int[][] mapData;
ArrayList path;

int state;

boolean found;

int sR, sC, fR, fC;

void setup() {
  size (600, 600);
  background (255);

  rows = 30;
  cols = 30;
  maze = new Tile[rows][cols];

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      maze[i][j] = new Tile(i, j, 0);
    }
  }

  state = 0;

  sR = -1;
  sC = -1;
  fR = -1;
  fC = -1;

  found = true;

  noStroke();
}

void draw() {
  background (255);

  if (!found && sR != -1 && sC != -1 && fR != 1 && fC != -1) {
    found = true;
    mapData = findPath();
    
    path = getPath(mapData);    
    
  }

  noStroke ();

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      switch (maze[i][j].type) {
      case 0:
        if (mapData != null) {
          if (mapData[i][j]==-1) {
            fill (255);
          }
          else {
            colorMode (HSB);
            fill (160, map(mapData[i][j], 0, maxValIn2D(mapData), 0, 255), 255);
            colorMode (RGB);
          }
        }
        else {
          fill (255); 
        }
        break;
      case 1:
        fill (0);
        break;
      case 2:
        fill (0, 255, 0);
        break;
      case 3:
        fill (255, 0, 0);
        break;
      case 4:
        fill (64, 64, 255);
        break;
      }     
      
      if (path != null) {
        for (Object o : path) {
          PVector p = (PVector)o;
          
          if (p.x == i && p.y == j && !(p.x == fR && p.y == fC)) {
             fill (255, 255, 0);
          }
          
        }
      }
      
      rect ((width/cols) * j, (height/rows) * i, width/cols, height/rows);
    }
  }

  switch (state) {
  case 0:
    stroke (128);
    break;
  case 1:
    stroke (0, 255, 0);
    break;
  case 2:
    stroke (255, 0, 0);
    break;
  }
  noFill ();

  int row = (int) map (mouseY, 0, height, 0, rows);
  int col = (int) map (mouseX, 0, width, 0, cols);

  rect ((width/cols) * col, (height/rows) * row, width/cols, height/rows);
}

int[][] findPath () {
  int[][] done = asArray();  

  done[fR][fC] = 0;

  int counter = 0;

  while (true) {

    boolean foundOne = false;
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (done[i][j] == counter) {
          foundOne = true;

          if (isValid(done, i-1, j, counter+1)) done[i-1][j] = counter + 1;
          if (isValid(done, i+1, j, counter+1)) done[i+1][j] = counter + 1;   
          if (isValid(done, i, j-1, counter+1)) done[i][j-1] = counter + 1;   
          if (isValid(done, i, j+1, counter+1)) done[i][j+1] = counter + 1;
        }
      }
    }

    counter ++;

    if (!foundOne) break;
  }

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      print ( done[i][j] + "\t" );
    }
    println ();
  }

  return done;
}

ArrayList getPath(int[][] flood) {
  if (flood[sR][sC] == -1) return null;
  
  ArrayList path = new ArrayList();
  
  int cR = sR, cC = sC;
  
  while (true) {
  
    if (cR == fR && cC == fC) {
      return path; 
    }
    
    if (isValid(flood, cR-1, cC)) {
      if (flood[cR-1][cC] < flood[cR][cC]) {
        cR = cR-1;
        cC = cC;
        
        PVector spot = new PVector (cR, cC);
        path.add (spot);
        
        continue;      
      }
    }
    if (isValid(flood, cR+1, cC)) {
      if (flood[cR+1][cC] < flood[cR][cC]) {
        cR = cR+1;
        cC = cC;
        
        PVector spot = new PVector (cR, cC);
        path.add (spot);
        
        continue;      
      }
    }
    if (isValid(flood, cR, cC-1)) {
      if (flood[cR][cC-1] < flood[cR][cC]) {
        cR = cR;
        cC = cC-1;
        
        PVector spot = new PVector (cR, cC);
        path.add (spot);
        
        continue;      
      }
    }  
    if (isValid(flood, cR, cC+1)) {
      if (flood[cR][cC+1] < flood[cR][cC]) {
        cR = cR;
        cC = cC+1;
        
        PVector spot = new PVector (cR, cC);
        path.add (spot);
        
        continue;      
      }
    }
  
  }
    
}

boolean isValid (int[][] arr, int r, int c, int count) {
  if (r < 0 || r >= rows) return false;
  if (c < 0 || c >= cols) return false;

  if (arr[r][c] == -2) return false;
  if (arr[r][c] <= count && arr[r][c] != -1) return false; 

  return true;
}

boolean isValid (int[][] arr, int r, int c) {
  if (r < 0 || r >= rows) return false;
  if (c < 0 || c >= cols) return false;

  if (arr[r][c] == -2) return false;

  return true;
}

void mousePressed () {
  int row = (int) map (mouseY, 0, height, 0, rows);
  int col = (int) map (mouseX, 0, width, 0, cols);

  if (maze[row][col].type != 0) { 
    if (maze[row][col].type == 2) {
      sR = -1;
      sC = -1;
    } 
    if (maze[row][col].type == 3) {
      fR = -1;
      fC = -1;
    } 
    maze[row][col].type = 0;
  }
  else if (state == 0) maze[row][col].type = 1;
  else if (state == 1) {
    if (sR != -1 && sC != -1) {
      maze[sR][sC].type = 0;
    }
    sR = row;
    sC = col;
    maze[sR][sC].type = 2;
    
  }
  else if (state == 2) {
    if (fR != 1 && fC != -1) {
      maze[fR][fC].type = 0;
    }
    fR = row;
    fC = col;
    maze[fR][fC].type = 3;
  }
  
  found = false;
}

void keyPressed () {
  state = wrapAround (0, 2, state+1);  
}


int[][] asArray () {
  int[][] res = new int[rows][cols];

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (maze[i][j].type != 1) res[i][j] = -1;
      else res[i][j] = -2;
    }
  }

  return res;
}

int maxValIn2D (int[][] look) {
  int mx = 0;

  for (int i = 0; i < look.length; i++) {
    for (int j = 0; j < look[i].length; j++) {
      mx = look[i][j] > mx ? look[i][j] : mx;
    }
  }

  return mx;
}

int wrapAround (int low, int high, int data) {
  return (data >= low && data <= high) ? data : (data < low ? high - (low - data - 1) : low + (data - high - 1)); //LOL
}


