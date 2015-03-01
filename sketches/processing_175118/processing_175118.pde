
int[][] maze;
float[][] light;
int[] stack = new int[0];
int res = 10;
int w, h;
int px, py, pDir;
int p2x, p2y, p2Dir;

int renderDist = 8;
boolean loopsPossible = true;
int loopPercentage = 10;

boolean lightsOut = true;

boolean[] keys = new boolean[256];

boolean titleScreen = true;
boolean helpScreen = false;
boolean multiPlayer = false;

PFont font = createFont("Vijaya", 32);
//stack <--> array conversions
//id = y*width + x
//y = (id-x) / width
//x = id % width



void setup() {
  size(410, 410);
  //size(300 + res, 300 + res);
  w = width/res;
  h = height/res;
  maze = new int[w][h];
  light = new float[w][h];
  textFont(font);
}

void draw() {
  if (titleScreen) {
    background(200);

    fill(0);
    textSize(50);
    text("Welcome to the Maze", 25, 70);
    textSize(25);
    text("Find the                       to escape", 60, 110);
    fill(220, 120, 0); 
    text("Golden Door", 133, 110); 
    fill(0);
    text("Press H at any time for help", 80, 325);

    stroke(0);
    fill(100); 
    if (mouseOver(55, 150, 300, 50)) fill(180); 
    rect(55, 150, 300, 50);
    fill(0); 
    text("Single Player", 150, 180);

    fill(100); 
    if (mouseOver(55, 225, 300, 50)) fill(180); 
    rect(55, 225, 300, 50);
    fill(0); 
    text("Multi Player", 150, 255);
  } else if (!titleScreen && !helpScreen) {
    drawMaze();
    drawPlayer();     
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        light[i][j] *= .98;
      }
    } 

    if (keys[87]) {    //W
      move(pDir);
      keys[87] = false;
    }  
    if (keys[83]) {    //S
      move((pDir + 2) % 4);
      keys[83] = false;
    }  
    if (keys[65]) {    //A
      pDir--; 
      if (pDir < 0) pDir = 3;
      keys[65] = false;
    }  
    if (keys[68]) {    //D
      pDir++; 
      pDir %= 4;
      keys[68] = false;
    }

    if (multiPlayer) {
      if (keys[UP]) {    //Up arrow
        move2(p2Dir);
        keys[UP] = false;
      }  
      if (keys[DOWN]) {    // Down arrow
        move2((p2Dir + 2) % 4);
        keys[DOWN] = false;
      }  
      if (keys[LEFT]) {    //Left arrow
        p2Dir--; 
        if (p2Dir < 0) p2Dir = 3;
        keys[LEFT] = false;
      }  
      if (keys[RIGHT]) {    //Right arrow
        p2Dir++; 
        p2Dir %= 4;
        keys[RIGHT] = false;
      }
    }

    if (keys[76]) {    //L
      if (lightsOut == false) {
        lightsOut = true;
      } else {
        lightsOut = false;
      }
      keys[76] = false;
    }

    if (keys[80]) {
      titleScreen = true;
      keys[80] = false;
    }

    generateLights(pDir, renderDist, px, py);
    if (multiPlayer) generateLights(p2Dir, renderDist, p2x, p2y);
  }
  if (helpScreen) {
    background(200);
    fill(0);
    textSize(50);
    text("Instructions", 25, 70);

    textSize(20);
    text("W or Up  arrow - Move forward", 40, 100);
    text("S or Down arrow - Move backward", 40, 130);
    text("A or Left arrow - Turn left", 40, 160);
    text("D or Right arrow - Turn right", 40, 190);
    text("P - Main menu", 40, 220);
    text("L - Toggle lights *for the faint of heart", 40, 250);
    textSize(15);
    text("* arrow keys used for player 2", 40, 280);
    textSize(20);
    text("Press any key to continue", 40, 350);
  }
}

boolean mouseOver(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) return true;
  else return false;
}

void mousePressed() {
  if (mouseOver(55, 150, 300, 50) && titleScreen && !helpScreen) {
    titleScreen = false;
    multiPlayer = false;
    generateMaze();
  }
  if (mouseOver(55, 225, 300, 50) && titleScreen && !helpScreen) {
    titleScreen = false;
    multiPlayer = true;
    generateMaze();
  }
  if (helpScreen) helpScreen = false;
}
void keyReleased() {
  keys[keyCode] = false;
}
void keyPressed() {
  keys[keyCode] = true;
  if (helpScreen) helpScreen = false;
  if (key == 'h') {
    helpScreen = true;
  }
}

void move2(int dir) {
  switch(dir) {
  case 0:
    if (p2y-1 > 0 && maze[p2x][p2y-1] != 0) p2y--;
    break;
  case 1:
    if (p2x+1 < w-1 && maze[p2x+1][p2y] != 0) p2x++;
    break;
  case 2:
    if (p2y+1 < h-1 && maze[p2x][p2y+1] != 0) p2y++;
    break;
  case 3:
    if (p2x-1 > 0 && maze[p2x-1][p2y] != 0) p2x--;
    break;
  default: 
    break;
  }
  if (maze[p2x][p2y] == 2) {
    println("You won!");
    generateMaze();
  }
}
void move(int dir) {
  switch(dir) {
  case 0:
    if (py-1 > 0 && maze[px][py-1] != 0) py--;
    break;
  case 1:
    if (px+1 < w-1 && maze[px+1][py] != 0) px++;
    break;
  case 2:
    if (py+1 < h-1 && maze[px][py+1] != 0) py++;
    break;
  case 3:
    if (px-1 > 0 && maze[px-1][py] != 0) px--;
    break;
  default: 
    break;
  }
  if (maze[px][py] == 2) {
    println("You won!");
    generateMaze();
  }
}

void generateLights(int dir, float L, int x, int y) {
  if (maze[x][y] != 0 && L > 0) {
    if (L > light[x][y]) light[x][y] = L;
    switch(dir) {
    case 0:
      if (y-1 > 0 && maze[x][y-1] != 0) generateLights(dir, L-1, x, y-1);
      if (x+1 < w-1 && maze[x+1][y] != 0) generateLights(1, L/4, x+1, y);
      if (x-1 > 0 && maze[x-1][y] != 0) generateLights(3, L/4, x-1, y);
      break;
    case 1:
      if (x+1 < w-1 && maze[x+1][y] != 0) generateLights(dir, L-1, x+1, y);
      if (y-1 > 0 && maze[x][y-1] != 0) generateLights(0, L/4, x, y-1);
      if (y+1 < h-1 && maze[x][y+1] != 0) generateLights(2, L/4, x, y+1);
      break;
    case 2:
      if (y+1 < h-1 && maze[x][y+1] != 0) generateLights(dir, L-1, x, y+1);
      if (x+1 < w-1 && maze[x+1][y] != 0) generateLights(1, L/4, x+1, y);
      if (x-1 > 0 && maze[x-1][y] != 0) generateLights(3, L/4, x-1, y);
      break;
    case 3:
      if (x-1 > 0 && maze[x-1][y] != 0) generateLights(dir, L-1, x-1, y);
      if (y-1 > 0 && maze[x][y-1] != 0) generateLights(0, L/4, x, y-1);
      if (y+1 < h-1 && maze[x][y+1] != 0) generateLights(2, L/4, x, y+1);
      break;
    default: 
      break;
    }
  }
}

void generateMaze() {
  int x = int(random(w-1));
  while (x % 2 == 0)
    x = int(random(w-1));
  int y = int(random(h-1));
  while (y % 2 == 0)
    y = int(random(h-1));

  maze = new int[w][h];
  light = new float[w][h];

  px = x; 
  py = y;

  maze[x][y] = 1; 
  stack = append(stack, y*w +x);
  recursion(x, y);

  p2x = int(random(w-1)); 
  p2y = int(random(h-1));
  while (dist (px, py, p2x, p2y) < 10 || maze[p2x][p2y] != 1) {
    p2x = int(random(w-1)); 
    p2y = int(random(h-1));
  }

  pDir = int(random(4));
  p2Dir = int(random(4));

  int gx = (int)random(w-1);
  int gy = (int)random(h-1);
  while (dist (x, y, gx, gy) < 10 || maze[gx][gy] != 1) {
    gx = (int)random(w-1);
    gy = (int)random(h-1);
  }
  maze[gx][gy] = 2;
}

void recursion(int x, int y) {    
  int dir[] = new int[4];
  dir[0] = int(random(3));
  int n = 1;
  while (n < 4) {
    dir[n] = (dir[n-1] + 1) % 4;
    n++;
  } 

  boolean success = false;

  for (int i = 0; i < 4; i++) {
    switch(dir[i]) {
    case 0:
      if (y-2 < 0 || maze[x][y-2] != 0) {
        float p = random(100);
        if (loopsPossible)
          if (p < loopPercentage && y-2 > 0) maze[x][y-1] = 1;
        continue;
      }
      if (maze[x][y-2] == 0) {
        maze[x][y-2] = 1;
        maze[x][y-1] = 1;
        stack = append(stack, (y-2)*w +x);
        recursion(x, y-2);
        success = true;
      }
      break;
    case 1:
      if (x+2 > w-2 || maze[x+2][y] != 0) {
        float p = random(100);
        if (loopsPossible)
          if (p < loopPercentage && x+2 < w-2) maze[x+1][y] = 1;
        continue;
      }
      if (maze[x+2][y] == 0) {
        maze[x+2][y] = 1;
        maze[x+1][y] = 1;
        stack = append(stack, y*w +x+2);
        recursion(x+2, y);
        success = true;
      }
      break;
    case 2:
      if (y+2 > h-2 || maze[x][y+2] != 0) {
        float p = random(100);
        if (loopsPossible)
          if (p < loopPercentage && y+2 < h-2) maze[x][y+1] = 1;
        continue;
      }
      if (maze[x][y+2] == 0) {
        maze[x][y+2] = 1;
        maze[x][y+1] = 1;
        stack = append(stack, (y+2)*w +x);
        recursion(x, y+2);
        success = true;
      }
      break;
    case 3:
      if (x-2 < 0 || maze[x-2][y] != 0) {
        float p = random(100);
        if (loopsPossible)
          if (p < loopPercentage && x-2 > 0) maze[x-1][y] = 1;
        continue;
      }
      if (maze[x-2][y] == 0) {
        maze[x-2][y] = 1;
        maze[x-1][y] = 1;
        stack = append(stack, y*w +x-2);
        recursion(x-2, y);
        success = true;
      }
      break;
    default: 
      break;
    }
    break;
  }
  if (!success) {
    stack = shorten(stack);
    if (stack.length != 0) {
      int i = stack.length-1;
      recursion(stack[i] % w, (stack[i] - (stack[i] % w)) / w);
    }
  }
}

void drawPlayer() {
  fill(255, 0, 0); 
  rect(px*res, py*res, res, res);
  stroke(0, 0, 255);
  switch(pDir) {
  case 0:
    line(px*res + res/2, py*res + res/2, px*res + res/2, py*res);
    break;
  case 1:
    line(px*res + res/2, py*res + res/2, px*res + res, py*res + res/2);
    break; 
  case 2:
    line(px*res + res/2, py*res + res/2, px*res + res/2, py*res + res);
    break; 
  case 3:
    line(px*res + res/2, py*res + res/2, px*res, py*res + res/2);
    break;
  default: 
    break;
  }
  noStroke();
  if (multiPlayer) {
    fill(0, 0, 255); 
    rect(p2x*res, p2y*res, res, res);
    stroke(255, 0, 0);
    switch(p2Dir) {
    case 0:
      line(p2x*res + res/2, p2y*res + res/2, p2x*res + res/2, p2y*res);
      break;
    case 1:
      line(p2x*res + res/2, p2y*res + res/2, p2x*res + res, p2y*res + res/2);
      break; 
    case 2:
      line(p2x*res + res/2, p2y*res + res/2, p2x*res + res/2, p2y*res + res);
      break; 
    case 3:
      line(p2x*res + res/2, p2y*res + res/2, p2x*res, p2y*res + res/2);
      break;
    default: 
      break;
    }
    stroke(0);
  }
}  

void drawMaze() {
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      if (maze[i][j] == 0) fill(0);
      if (lightsOut) {
        if (maze[i][j] == 1) fill(light[i][j]*255/renderDist);
        if (maze[i][j] == 2) fill(light[i][j]*220/renderDist, light[i][j]*120/renderDist, 0);
      } else {
        if (maze[i][j] == 1) fill(255);
        if (maze[i][j] == 2) fill(220, 120, 0);
      }
      noStroke();       
      rect(i*res, j*res, res, res);
    }
  }
}

