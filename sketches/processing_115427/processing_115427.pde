

GridLayout grid;
Enemy en;

void setup() {
  size(450, 450);
  grid = new GridLayout(30);
  en = new Enemy(width/2, height/2, 1);
}

void draw() {
  background(255);
  grid.display();
  en.display(grid);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    grid.mPressed();
  }
  else {
    en.mPressed();
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    grid.mReleased();
  }
}


class Enemy {

  float x, y;
  float speed = 0.3;
  float gridX, gridY;
  float w;
  float angle = 0;
  int dir;
  // 0 = up
  // 1 = down
  // 2 = left
  // 3 = right
  boolean blockedUp;
  boolean blockedDown;
  boolean blockedLeft;
  boolean blockedRight;
  boolean blockedNW;
  boolean blockedNE;
  boolean blockedSE;
  boolean blockedSW;

  Enemy(float initialX, float initialY, int initialDir) {
    x = initialX;
    y = initialY;
    gridX = gridSpot(initialX);
    gridY = gridSpot(initialY);
    dir = initialDir;
  }

  void display(GridLayout grid) {
    w = grid.bSize;
    moveCharacter();
    if (abs(x - gridX) < speed && abs(y - gridY) < speed) {
      findPath();
      moveGridSpot();
    }

    noStroke();
    fill(0);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    triangle(-5, 5, 5, 5, 0, -10);
    popMatrix();

    gridX -= w/2;
    gridY -= w/2;
    blockedUp = grid.isFilled(gridX, gridY - w);
    blockedDown = grid.isFilled(gridX, gridY + w);
    blockedLeft = grid.isFilled(gridX - w, gridY);
    blockedRight = grid.isFilled(gridX + w, gridY);
    blockedNW = grid.isFilled(gridX - w, gridY - w);
    blockedNE = grid.isFilled(gridX + w, gridY - w);
    blockedSE = grid.isFilled(gridX + w, gridY + w);
    blockedSW = grid.isFilled(gridX - w, gridY + w);
    gridX += w/2;
    gridY += w/2;

    drawSensors();
  }

  void findPath() {
    boolean clearAhead = true;
    switch (dir) {
    case 0:
      if (blockedUp) {
        clearAhead = false;
        if (blockedLeft) {
          dir = 3;
        }
        else {
          dir = 2;
        }
      }
      break;
    case 1:
      if (blockedDown) {
        clearAhead = false;
        if (blockedLeft) {
          dir = 3;
        }
        else {
          dir = 2;
        }
      }
      break;
    case 2:
      if (blockedLeft) {
        clearAhead = false;
        if (blockedUp) {
          dir = 1;
        } 
        else {
          dir = 0;
        }
      }
      break;
    case 3:
      if (blockedRight) {
        clearAhead = false;
        if (blockedUp) {
          dir = 1;
        }
        else {
          dir = 0;
        }
      }
      break;
    }
    if (clearAhead) {
      hugCorners();
    }
  }

  void hugCorners() {
    switch (dir) {
    case 0:
      if (!blockedLeft && blockedSW) {
        dir = 2;
      }
      if (!blockedRight && blockedSE) {
        dir = 3;
      }
      break;
    case 1:
      if (!blockedLeft && blockedNW) {
        dir = 2;
      }
      if (!blockedRight && blockedNE) {
        dir = 3;
      }
      break;
    case 2:
      if (!blockedDown && blockedSE) {
        dir = 1;
      }
      if (!blockedUp && blockedNE) {
        dir = 0;
      }
      break;
    case 3:
      if (!blockedUp && blockedNW) {
        dir = 0;
      }
      if (!blockedDown && blockedSW) {
        dir = 1;
      }
      break;
    }
  }

  void drawSensors() {
    fill(255, 255, 0);
    ellipse(gridX, gridY, 7, 7);
    fill(0, 255, 0);
    if (blockedUp) {
      fill(255, 0, 0);
    }
    ellipse(gridX, gridY - w, 7, 7);
    fill(0, 255, 0);
    if (blockedDown) {
      fill(255, 0, 0);
    }
    ellipse(gridX, gridY + w, 7, 7);
    fill(0, 255, 0);
    if (blockedLeft) {
      fill(255, 0, 0);
    }
    ellipse(gridX - w, gridY, 7, 7);
    fill(0, 255, 0);
    if (blockedRight) {
      fill(255, 0, 0);
    }
    ellipse(gridX + w, gridY, 7, 7);

    fill(0, 255, 0);
    if (blockedNW) {
      fill(255, 0, 0);
    }
    ellipse(gridX - w, gridY - w, 7, 7);
    fill(0, 255, 0);
    if (blockedNE) {
      fill(255, 0, 0);
    }
    ellipse(gridX + w, gridY - w, 7, 7);
    fill(0, 255, 0);
    if (blockedSE) {
      fill(255, 0, 0);
    }
    ellipse(gridX + w, gridY + w, 7, 7);
    fill(0, 255, 0);
    if (blockedSW) {
      fill(255, 0, 0);
    }
    ellipse(gridX - w, gridY + w, 7, 7);
  }

  void moveCharacter() {
    if (x - gridX < -speed) {
      x += speed;
    }
    if (x - gridX > speed) {
      x -= speed;
    }
    if (y - gridY < -speed) {
      y += speed;
    }
    if (y - gridY > speed) {
      y -= speed;
    }
  }
  void moveGridSpot() {
    if (dir > 3) {
      dir = 0;
    }
    if (dir == 0) {
      angle = 0;
      gridY -= w;
    } 
    if (dir == 1) {
      angle = PI;
      gridY += w;
    }
    if (dir == 2) {
      angle = 3*PI/2;
      gridX -= w;
    }
    if (dir == 3) {
      angle = PI/2;
      gridX += w;
    }
  }

  float gridSpot(float num) {
    num -= constrain(num % w, 0, w);
    num += w/2;
    return num;
  }

  void mPressed() {
    x = mouseX;
    y = mouseY;
    gridX = gridSpot(mouseX);
    gridY = gridSpot(mouseY);
    dir = 0;
  }
}


class GridLayout {

  ArrayList<GridBlock> blockList;
  float bSize;
  boolean removing = false;
  boolean adding = false;

  GridLayout(float blockSize) {
    bSize = blockSize;
    blockList = new ArrayList<GridBlock>();
    for (float i = 0; i <= width-bSize; i += bSize) {
      for (float j = 0; j <= height-bSize; j += bSize) {
        blockList.add(new GridBlock(i, j, bSize));
      }
    }
  }

  void display() {
    for (int i = 0; i < blockList.size(); i++) {
      GridBlock block = blockList.get(i);
      block.display();

      if (removing && block.pointIsOver(mouseX, mouseY)) {
        block.isHidden = true;
      }
      if (adding && block.pointIsOver(mouseX, mouseY) && block.isHidden) {
        block.isHidden = false;
      }
    }

    stroke(0);
    for (float i = 0; i <= width-bSize; i += bSize) {
      line(i, 0, i, height);
    }
    for (float j = 0; j <= height-bSize; j += bSize) {
      line(0, j, width, j);
    }
  }

  boolean isFilled(float i, float j) {
    int index = (int)((width/bSize)*i/bSize + j/bSize);
    try {
      if (blockList.get(index).isHidden) {
        return false;
      }
      else {
        return true;
      }
    }
    catch (ArrayIndexOutOfBoundsException e) {
      return true;
    }
  }

  void mPressed() {
    boolean noBlockHere = true;
    for (int i = 0; i < blockList.size(); i++) {
      GridBlock block = blockList.get(i);
      if (block.isHidden == false && block.pointIsOver(mouseX, mouseY)) {
        noBlockHere = false;
      }
    }
    if (noBlockHere) {
      adding = true;
    }
    else {
      removing = true;
    }
  }

  void mReleased() {
    removing = false;
    adding = false;
  }
}

class GridBlock {
  float x;
  float y;
  float w;
  float h;
  boolean isHidden = false;

  GridBlock(float x, float y, float blockSize) {
    w = blockSize;
    h = blockSize;
    this.x = gridSpot(x);
    this.y = gridSpot(y);
  }

  void display() {
    if (!isHidden) {
      noStroke();
      rectMode(CORNER);
      fill(50, 110, 190);
      if (pointIsOver(mouseX, mouseY)) {
        fill(120, 160, 220);
      }
      rect(x, y, w, h);
      fill(30, 50, 90);
      if (pointIsOver(mouseX, mouseY)) {
        fill(50, 110, 190);
      }
      rect(x+1, y+1, w-2, h-2);
    }
  }

  float gridSpot(float num) {
    num -= constrain(num % w, 0, w);
    return num;
  }

  boolean pointIsOver(float pointX, float pointY) {
    if (pointX >= x && pointX < x + w && pointY >= y && pointY < y + h) {
      return true;
    }
    else {
      return false;
    }
  }
}



