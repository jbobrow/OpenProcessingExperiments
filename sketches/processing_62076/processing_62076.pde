
PImage rChecker; 
PImage rCheckerKing;
PImage wChecker;
PImage wCheckerKing;
redChecker[] r; 
whiteChecker[] w;
redCheckerKing[] rk;
whiteCheckerKing[] wk;
private int j, k, l, m; 
private int initX; 
private int initY; 
private int newX; 
private int newY;
private int numClicked;
private int countRedKing;
private int countWhiteKing;
private boolean selected = false;
private boolean validMove = false;

void setup() {
  size (800, 800);
  r = new redChecker[12];
  w = new whiteChecker[12];
  rk = new redCheckerKing[12];
  wk = new whiteCheckerKing[12];
  background(0);
  smooth(); 
  rChecker = loadImage("rChecker.png");
  rCheckerKing = loadImage("rCheckerKing.PNG");
  wChecker = loadImage("wChecker.png");
  wCheckerKing = loadImage("wCheckerKing.PNG");
  j = 100;
  k = 0;
  l = 0;
  m = 700;

  for (int i = 0; i < 12; i++) {
    r[i] = new redChecker(j, k);
    j += 200;
    if ( j >= width ) {
      k += 100;
      j = 100;
      if ( k == 100 || k == 300 ) {
        j = 0;
      }
    }
  }

  for ( int i = 0; i < 12; i++ ) {
    w[i] = new whiteChecker(l, m);
    l += 200;
    if ( l >= width ) {
      m -= 100;
      l = 0;
      if ( m == 800 || m == 600 ) {
        l = 100;
      }
    }
  }
  noLoop();
}

void draw() {
  int a = 0;
  for (int i = 0; i < width; i += 100) {
    a++;
    for (int j = 0; j < height; j += 100) {
      a++;
      if ( a % 2 != 0) {
        fill(0);
      }
      else {
        fill(255);
      } 
      rect(i, j, 100, 100);
      rect(i + 100, j+ 100, 100, 100);
    }
  } 
  stroke(0);
  for (redChecker b: r) {
    if (b.isDead() == false) {
      b.renderRed();
    }
  }
  for (whiteChecker c: w) {
    if (c.isDead() == false) {
      c.renderWhite();
    }
  }
  for (whiteCheckerKing whitek: wk) {
    if ( whitek != null  && whitek.isDead() == false) {
      whitek.renderWhiteKing();
    }
  }
  for (redCheckerKing redk: rk) {
    if (redk != null && redk.isDead() == false) {
      redk.renderRedKing();
    }
  }
}

void mousePressed() {
  if ( selected == true ) {
    selected = false;
    newX = roundToPixel(mouseX);
    newY = roundToPixel(mouseY);  
    if (validMove == false) {
      for (whiteChecker c: w) {
        if (c.getWidth() != newX && c.getHeight() != newY) {
          for (redChecker v: r) {
            if (v.getWidth() != newX && v.getHeight() != newY) {
              validMove = true;
            }
          }
        }
      }
    }  
    for (whiteChecker c: w) {
      if ( c.getWidth() == initX && c.getHeight() == initY && (newX - initX == 100 || newX - initX
        == -100) && (newY - initY == 100 || newY - initY == -100) && validMove == true && isValidMove(newX, newY) == true) {
        c.setLocation(newX, newY);
        c.renderWhite();
        validMove = false;
      } 
      else if (c.getWidth() == initX && c.getHeight() == initY && (newX - initX == 200) && (newY - initY == -200) && validMove == true && isValidMove(newX, newY) == true) {
        for (redChecker b: r) {
          if (b.getWidth() + 100 == newX && newY - b.getHeight() == -100 ) {
            whiteJumpRight(c, newX, newY);
            b.destroy();
          }
        }
        for (redCheckerKing b: rk) {
          if (b != null && b.getWidth() + 100 == newX && newY - b.getHeight() == -100 ) {
            whiteJumpRight(c, newX, newY);
            b.destroy();
          }
        }
      } 
      else if (c.getWidth() == initX && c.getHeight() == initY && (newX - initX == -200) && (newY - initY == -200) && validMove == true && isValidMove(newX, newY) == true) {
        for (redChecker b: r) {
          if (b.getWidth() - 100 == newX && newY - b.getHeight() == -100 ) {
            whiteJumpLeft(c, newX, newY);
            b.destroy();
          }
        }
        for (redCheckerKing b: rk) {
          if (b != null && b.getWidth() - 100 == newX && newY - b.getHeight() == -100 ) {
            whiteJumpLeft(c, newX, newY);
            b.destroy();
          }
        }
      }
    } 
    for (redChecker b: r) {
      if ( b.getWidth() == initX && b.getHeight() == initY && (newX - initX == 100 || newX - initX
        == -100) && (newY - initY == 100) && validMove == true && isValidMove(newX, newY) == true) {
        b.setLocation(newX, newY);
        b.renderRed();
      } 
      else if (b.getWidth() == initX && b.getHeight() == initY && (newX - initX == 200) && (newY - initY == 200) && validMove == true && isValidMove(newX, newY) == true) {
        for (whiteChecker y: w) {
          if (y.getWidth() - newX == -100 && newY - y.getHeight() == 100 ) {
            redJumpRight(b, newX, newY);
            y.destroy();
          }
        }
        for (whiteCheckerKing y: wk) {
          if (y != null && y.getWidth() - newX == -100 && newY - y.getHeight() == 100 ) {
            redJumpRight(b, newX, newY);
            y.destroy();
          }
        }
      } 
      else if (b.getWidth() == initX && b.getHeight() == initY && (newX - initX == -200) && (newY - initY == 200) && validMove == true && isValidMove(newX, newY) == true) {
        for (whiteChecker y: w) {
          if (y.getWidth() - newX == 100 && newY - y.getHeight() == 100 ) {
            redJumpRight(b, newX, newY);
            y.destroy();
          }
        }
        for (whiteCheckerKing y: wk) {
          if (y != null && y.getWidth() - newX == 100 && newY - y.getHeight() == 100 ) {
            redJumpRight(b, newX, newY);
            y.destroy();
          }
        }
      }
    }
    for (whiteCheckerKing kingW: wk) {
      if (kingW != null && (kingW.getWidth() == initX && kingW.getHeight() == initY) && (newX - initX == 100 || newX - initX
        == -100) && (newY - initY == 100 || newY - initY == -100) && isValidMove(newX, newY) == true) {
        kingW.setLocation(newX, newY);
        kingW.renderWhiteKing();
        validMove = false;
      } 
      else if (kingW != null && kingW.getWidth() == initX && kingW.getHeight() == initY && (newX - initX == 200) && (newY - initY == -200) && isValidMove(newX, newY) == true) {
        for (redChecker b: r) {
          if (b.getWidth() + 100 == newX && newY - b.getHeight() == -100 ) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
        for (redCheckerKing b: rk) {
          if (b != null && b.getWidth() + 100 == newX && newY - b.getHeight() == -100 ) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
      } 
      else if (kingW != null && kingW.getWidth() == initX && kingW.getHeight() == initY && (newX - initX == -200) && (newY - initY == -200) && isValidMove(newX, newY) == true) {
        for (redChecker b: r) {
          if (b.getWidth() - 100 == newX && newY - b.getHeight() == -100 ) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
        for (redCheckerKing b: rk) {
          if (b != null && b.getWidth() - 100 == newX && newY - b.getHeight() == -100 ) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
      }
      else if (kingW != null && kingW.getWidth() == initX && kingW.getHeight() == initY && newX - initX == 200 && newY - initY == 200 && isValidMove(newX, newY) == true) {
        for (redChecker b: r) {
          if (b.getWidth() + 100 == newX && newY - b.getHeight() == 100) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
        for (redCheckerKing b: rk) {
          if (b != null && b.getWidth() + 100 == newX && newY - b.getHeight() == 100) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
      }
      else if (kingW != null && kingW.getWidth() == initX && kingW.getHeight() == initY && newX - initX == -200 && newY - initY == 200 && isValidMove(newX, newY) == true) {
        for (redChecker b: r) {
          if (b.getWidth() - 100 == newX && newY - b.getHeight() == -100) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
        for (redCheckerKing b: rk) {
          if (b != null && b.getWidth() - 100 == newX && newY - b.getHeight() == -100) {
            wkJump(kingW, newX, newY);
            b.destroy();
          }
        }
      }
    }
    for (redCheckerKing kingR: rk) {
      if (kingR != null && kingR.getWidth() == initX && kingR.getHeight() == initY && (newX - initX == 100 || newX - initX
        == -100) && (newY - initY == 100 || newY - initY == -100) && isValidMove(newX, newY) == true) {
        kingR.setLocation(newX, newY);
        kingR.renderRedKing();
      } 
      else if (kingR != null && kingR.getWidth() == initX && kingR.getHeight() == initY && (newX - initX == 200) && (newY - initY == 200) && isValidMove(newX, newY) == true) {
        for (whiteChecker y: w) {
          if (y.getWidth() - newX == -100 && newY - y.getHeight() == 100 ) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
        for (whiteCheckerKing y: wk) {
          if (y != null && y.getWidth() - newX == -100 && newY - y.getHeight() == 100 ) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
      } 
      else if (kingR != null && kingR.getWidth() == initX && kingR.getHeight() == initY && (newX - initX == -200) && (newY - initY == 200) && isValidMove(newX, newY) == true) {
        for (whiteChecker y: w) {
          if (y.getWidth() - newX == 100 && newY - y.getHeight() == 100 ) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
        for (whiteCheckerKing y: wk) {
          if (y != null && y.getWidth() - newX == 100 && newY - y.getHeight() == 100 ) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
      }
      else if (kingR != null && kingR.getWidth() == initX && kingR.getHeight() == initY && newX - initX == 200 && newY - initY == -200 && isValidMove(newX, newY) == true) {
        for (whiteChecker y: w) {
          if (y.getWidth() - newX == -100 && newY - y.getHeight() == -100) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
        for (whiteCheckerKing y: wk) {
          if (y != null && y.getWidth() - newX == -100 && newY - y.getHeight() == -100) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
      }
      else if (kingR != null && kingR.getWidth() == initX && kingR.getHeight() == initY && newX - initX == -200 && newY - initY == -200 && isValidMove(newX, newY) == true) {
        for (whiteChecker y: w) {
          if (y.getWidth() - newX == 100 && newY - y.getHeight() == -100) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
        for (whiteCheckerKing y: wk) {
          if (y != null && y.getWidth() - newX == 100 && newY - y.getHeight() == -100) {
            rkJump(kingR, newX, newY);
            y.destroy();
          }
        }
      }
    }
  } 
  else {
    initX = roundToPixel(mouseX);
    initY = roundToPixel(mouseY);
    selected = true;
    loadPixels();
    for(int i = initX; i < initX + 100; i++) {
      for (int j = initY; j < initY + 100; j++) {
        color yellow = color(255,255,0);
        set(i,j,yellow);
      }
    }
  } 
  loop();
}
void wkJump(whiteCheckerKing w, int x, int y) {
  w.setLocation(x, y);
  w.renderWhiteKing();
}
void rkJump(redCheckerKing r, int x, int y) {
  r.setLocation(x, y);
  r.renderRedKing();
}
void rkJumpLeft(redCheckerKing r, int x, int y) {
  r.setLocation(x, y);
  r.renderRedKing();
}
void redJumpRight(redChecker r, int x, int y) {
  r.setLocation(x, y);
  r.renderRed();
}
void whiteJumpRight(whiteChecker w, int x, int y) { 
  w.setLocation(x, y);
  w.renderWhite();
}
void redJumpLeft(redChecker r, int x, int y) {
  r.setLocation(x, y);
  r.renderRed();
}
void whiteJumpLeft(whiteChecker w, int x, int y) {
  w.setLocation(x, y);
  w.renderWhite();
}
boolean isValidMove(int x, int y) {
  boolean valid = false;
  int count = 0;
  for (whiteChecker ab: w) {
    if (ab.getWidth() == x && ab.getHeight() == y && ab.isDead() == false) {
      count++;
    }
  }
  for (redChecker bc: r) {
    if (bc.getWidth() == x && bc.getHeight() == y && bc.isDead() == false) {
      count++;
    }
  }
  for (whiteCheckerKing cd: wk) {
    if (cd != null && cd.getWidth() == x && cd.getHeight() == y && cd.isDead() == false) {
      count++;
    }
  }
  for (redCheckerKing dc: rk) {
    if (dc != null && dc.getWidth() == x && dc.getHeight() == y && dc.isDead() == false) {
      count++;
    }
  }
  if (count == 0) {
    valid = true;
  }
  count = 0;
  return valid;
}

int roundToPixel(int a) {
  for (int i = 100; i < 1000; i += 100) {
    if (a < i && a > i - 100) {
      a = i - 100;
    }
  }
  return a;
}

public class redChecker {
  private int x, y;
  private boolean isDestroyed = false;
  public redChecker(int rX, int rY) {
    x = rX;
    y = rY;
  }
  public int getWidth() {
    return x;
  }
  public int getHeight() {
    return y;
  }
  public void setLocation(int nX, int nY) {
    if (nY > y && nY != 700) {
      x = nX; 
      y = nY;
    } 
    else if (nY > y && nY == 700) {
      destroy();
      rk[countRedKing] = new redCheckerKing(nX, nY);
      rk[countRedKing].renderRedKing();
      countRedKing++;
    }
  }
  public void renderRed() {
    image(rChecker, x, y);
  }
  public void destroy() {
    isDestroyed = true;
  }
  public boolean isDead() {
    if (isDestroyed == true) {
      return true;
    }
    else {
      return false;
    }
  }
}

public class whiteChecker {
  private int x, y;
  private boolean isDestroyed = false;
  public whiteChecker(int rX, int rY) {
    x = rX;
    y = rY;
  }
  public int getWidth() {
    return x;
  }
  public int getHeight() {
    return y;
  }
  public void setLocation(int nX, int nY) {
    if ( y > nY && nY != 0) {
      x = nX; 
      y = nY;
    } 
    else if (y > nY && nY == 0) {
      destroy();
      wk[countWhiteKing] = new whiteCheckerKing(nX, nY);
      wk[countWhiteKing].renderWhiteKing();
      countWhiteKing++;
    }
  }
  public void renderWhite() {
    image(wChecker, x, y);
  }
  public void destroy() {
    isDestroyed = true;
  }
  public boolean isDead() {
    if (isDestroyed == true) {
      return true;
    } 
    else {
      return false;
    }
  }
}
public class whiteCheckerKing {
  private int x, y;
  private boolean isDestroyed = false;
  public whiteCheckerKing(int rX, int rY) {
    x = rX;
    y = rY;
  }
  public int getWidth() {
    return x;
  }
  public int getHeight() {
    return y;
  }
  public void setLocation(int nX, int nY) {
    x = nX;
    y = nY;
  }
  public void destroy() {
    isDestroyed = true;
  }
  public boolean isDead() {
    if (isDestroyed == true) {
      return true;
    } 
    else {
      return false;
    }
  }
  public void renderWhiteKing() {
    image(wCheckerKing, x, y);
  }
}
public class redCheckerKing {
  private int x, y;
  private boolean isDestroyed = false;
  public redCheckerKing(int rX, int rY) {
    x = rX;
    y = rY;
  }
  public int getWidth() {
    return x;
  }
  public int getHeight() {
    return y;
  }
  public void setLocation(int nX, int nY) {
    x = nX;
    y = nY;
  }
  public void destroy() {
    isDestroyed = true;
  }
  public boolean isDead() {
    if (isDestroyed == true) {
      return true;
    } 
    else {
      return false;
    }
  }
  public void renderRedKing() {
    image(rCheckerKing, x, y);
  }
}


