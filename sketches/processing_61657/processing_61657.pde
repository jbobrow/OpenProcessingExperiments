
PImage rChecker; PImage wChecker;
redChecker[] r; whiteChecker[] w;
private int j; private int k; private int l; private int m;
private int initX; private int initY; private int newX; private int newY;
private int numClicked;
private boolean selected = false;
private boolean validMove = false;

void setup() {
 size (800,800);
 r = new redChecker[12];
 w = new whiteChecker[12];
 background(0);
 smooth(); 
 rChecker = loadImage("rChecker.png");
 wChecker = loadImage("wChecker.png");
 j = 100;
 k = 0;
 l = 0;
 m = 700;
 
 for (int i = 0; i < 12; i++) {
  r[i] = new redChecker(j,k);
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
   w[i] = new whiteChecker(l,m);
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
 for (int i = 0; i < width; i += 100){
   a++;
   for (int j = 0; j < height; j += 100){
     a++;
     if ( a % 2 != 0) {
       fill(0);
     } else {
       fill(255);
     }
     rect(i,j, 100, 100);
     rect(i + 100, j+ 100, 100, 100);
   }
 } 
 stroke(0);
 for (redChecker b: r) {
   b.renderRed();
 }
 for (whiteChecker c: w) {
   c.renderWhite();
 }
}

void mousePressed() {
  if ( selected == true ) {
    selected = false;
    newX = roundToPixel(mouseX);
    newY = roundToPixel(mouseY);  
    if (validMove == false) {
      for(whiteChecker c: w) {
        if (c.getWidth() != newX && c.getHeight() != newY) {
          for(redChecker v: r) {
            if (v.getWidth() != newX && v.getHeight() != newY) {
              validMove = true;
            }
          }
        }
      }
    }  
    for(whiteChecker c: w) {
     if ( c.getWidth() == initX && c.getHeight() == initY && (newX - initX == 100 || newX - initX
         == -100) && (newY - initY == 100 || newY - initY == -100) && validMove == true) {
       c.setLocation(newX,newY);
       c.renderWhite();
       validMove = false;
     } else if (c.getWidth() == initX && c.getHeight() == initY && (newX - initX == 200) && (newY - initY == -200) && validMove == true) {
       whiteJumpRight(c,newX,newY);
     } else if (c.getWidth() == initX && c.getHeight() == initY && (newX - initX == -200) && (newY - initY == -200) && validMove == true) {
       whiteJumpLeft(c,newX,newY);
     }
    } 
    for(redChecker b: r) {
     if ( b.getWidth() == initX && b.getHeight() == initY && (newX - initX == 100 || newX - initX
         == -100) && (newY - initY == 100 || newY - initY == -100) && validMove == true) {
       b.setLocation(newX,newY);
       b.renderRed();
     } else if (b.getWidth() == initX && b.getHeight() == initY && (newX - initX == 200) && (newY - initY == 200) && validMove == true) {
       redJumpRight(b,newX,newY);
     } else if (b.getWidth() == initX && b.getHeight() == initY && (newX - initX == -200) && (newY - initY == 200) && validMove == true) {
       redJumpLeft(b,newX,newY);
     }
    }
  } else {
    initX = roundToPixel(mouseX);
    initY = roundToPixel(mouseY);
    selected = true;
  } 
  loop();
}

void redJumpRight(redChecker r, int x, int y) {
  r.setLocation(x,y);
  r.renderRed();
}
void whiteJumpRight(whiteChecker w, int x, int y) {
  w.setLocation(x,y);
  w.renderWhite();
}
void redJumpLeft(redChecker r, int x, int y) {
  r.setLocation(x,y);
  r.renderRed();
}
void whiteJumpLeft(whiteChecker w, int x, int y) {
  w.setLocation(x,y);
  w.renderWhite();
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
 private int x,y;
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
  if(nY > y) {
   x = nX; 
   y = nY;
  }
 }
 public void renderRed() {
   image(rChecker , x , y);
 }
}

public class whiteChecker {
 private int x,y;
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
  if ( y > nY) {
   x = nX; 
   y = nY;
  }
 }
 public void renderWhite() {
    image(wChecker, x , y);
  }
}

