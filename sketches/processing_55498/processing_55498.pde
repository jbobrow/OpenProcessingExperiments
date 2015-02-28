
import java.awt.Point;

import sprites.utils.*;
import sprites.*;

final int SPLASH = 0;
final int TRANSITION_FROM_SPLASH = 1;
final int SOLVE_PUZZLE = 2;
final int VIEW_PIC = 4;

int mode = SPLASH;
int colBoard, colEdge;

ArrayList<Jigsaw> jigs;
int jSelect = 0;
int nextZ;
Jigsaw jigsaw;

PFont font;
String splashText = "[Z] previous : [X] next : [S] solve this one";
String inPlayText = "[N] New jigsaw puzzle : [V] View solution";
String viewSolutionText = "[B] Back to solving the puzzle";
int splashTextX, inPlayTextX, viewSolutionTextX;

float timeToSpread = 2.5f;
StopWatch sw = new StopWatch();

void setup() {
  size(700, 700);
  cursor(CROSS);
  rectMode(CORNER);	
  colBoard = color(0, 0, 90);
  colEdge = color(0, 0, 48);
  font = createFont("Sans Serif", 24);
  textFont(font, 24);
  splashTextX = (width - (int) textWidth(splashText))/2;
  inPlayTextX = (width - (int) textWidth(inPlayText))/2;
  viewSolutionTextX = (width - (int) textWidth(viewSolutionText))/2;
  // Get a list of jigsaws
  String[] jFolder = loadStrings("jigsawlist.txt");
  jigs = new ArrayList<Jigsaw>();
  for (int i = 0; i < jFolder.length; i++) {
    if (jFolder[i].length() > 1)
      jigs.add(new Jigsaw(jFolder[i], width, height));
  }
  jSelect = 0;
  jigsaw = jigs.get(jSelect);
  sw.reset();
}

void draw() {
  float elapsedTime = (float) sw.getElapsedTime();
  background(0);
  switch(mode) {
  case SPLASH:
    drawSplash();
    break;
  case TRANSITION_FROM_SPLASH:
    drawSolutionTable();
    S4P.updateSprites(elapsedTime);
    S4P.drawSprites();
    if (sw.getRunTime() >= timeToSpread) {
      for (int p = 0; p < jigsaw.nbrPieces; p++) {
        jigsaw.pieces[p].setVelXY(0, 0);
        jigsaw.solved[p] = false;
      }
      mode = SOLVE_PUZZLE;
    }
    break;
  case SOLVE_PUZZLE:
    drawSolutionTable();
    float inPlace = jigsaw.progress();
    if (inPlace > 0) {
      fill(128, 0, 0);
      rect(0, 0, width * inPlace, 36);
      fill(255);
      text(nf(100 * inPlace, 2, 1) + "% solved", 5, 26);
    }
    fill(60, 60, 200);
    text(inPlayText, inPlayTextX, height - 30);
    S4P.drawSprites();	
    break;
  case VIEW_PIC:
    drawSolutionTable();
    fill(255);
    text(viewSolutionText, viewSolutionTextX, height - 30);
    imageMode(CORNER);
    image(jigsaw.picture, jigsaw.offX, jigsaw.offY);
    break;
  }
}

void drawSolutionTable() {
  background(colBoard);
  noStroke();
  fill(colEdge);
  rect(jigsaw.offX-10, jigsaw.offY-10, jigsaw.jWidth+20, jigsaw.jHeight+20);
  fill(128);
  rect(jigsaw.offX, jigsaw.offY, jigsaw.jWidth, jigsaw.jHeight);
}

void drawSplash() {
  imageMode(CORNER);
  int fx = (width - (int) textWidth(jigsaw.title))/2;
  fill(255);
  text(jigsaw.title, fx, 100);
  image(jigsaw.picture, jigsaw.offX, jigsaw.offY);
  fill(0, 160, 0);
  text(splashText, splashTextX, height -40);
}

void keyPressed() {
  if (mode == SPLASH) {
    if (key == 'x' || key == 'X') {
      jSelect++;
      jSelect %= jigs.size();
      jigsaw = jigs.get(jSelect);
    }
    else if (key == 'z' || key == 'Z') {
      jSelect += (jigs.size() - 1);
      jSelect %= jigs.size();	
      jigsaw = jigs.get(jSelect);
    }
    else if (key == 's' || key == 'S') {
      jigsaw.loadPieces(this);
      nextZ = 3000;
      mode = TRANSITION_FROM_SPLASH;
      prepareToSplitJigsaw();
      sw.reset();
    }
  }
  else if (mode == SOLVE_PUZZLE) {
    if (key == 'n' || key == 'N') {
      jigsaw.unloadPieces();
      mode = SPLASH;
    }
    else if (key == 'v' || key == 'V') {
      mode = VIEW_PIC;
    }
  }
  else if (mode == VIEW_PIC) {
    if (key == 'b' || key == 'B') {
      mode = SOLVE_PUZZLE;
    }
  }
}

void prepareToSplitJigsaw() {
  drawSolutionTable();
  int ex, ey;
  for (int p = 0; p < jigsaw.nbrPieces; p++) {
    do {
      ex = (int) random(12, width - 24);
      ey = (int) random(12, height - 24);
    } 
    while (get (ex, ey) != colBoard);
    float velX = ((float)(ex - jigsaw.px[p])) / timeToSpread;
    float velY = ((float)(ey - jigsaw.py[p])) / timeToSpread;
    jigsaw.pieces[p].setVelXY(velX, velY);
    jigsaw.solved[p] = false;
  }
}

void handleSpriteEvents(Sprite sprite) { 
  if (sprite.eventType == Sprite.PRESSED) {
    sprite.setZorder(nextZ++); // bring to front
  }
  else if (sprite.eventType == Sprite.RELEASED) {
    int pn = sprite.tagNo; // get piece number
    int deltaX = abs(jigsaw.px[pn] - round((float) sprite.getX()));
    int deltaY = abs(jigsaw.py[pn] - round((float) sprite.getY()));
    if (deltaX < 3 && deltaY < 3) {
      sprite.setXY(jigsaw.px[pn], jigsaw.py[pn]);
      jigsaw.solved[pn] = true;
    }
    else {
      jigsaw.solved[pn] = false;
    }
  }
}

class Jigsaw {
  String folder;
  String title;
  PImage picture;
  int cols, rows, nbrPieces;
  int pWidth, pHeight;

  int jWidth, jHeight;
  int offX, offY;

  Sprite[] pieces = null;
  int[] px = null;
  int[] py = null;
  boolean[] solved; // 0 = no, 1 = yes

  Jigsaw(String folder, int w, int h) {
    this.folder = folder;
    picture = loadImage(this.folder + "/picture.jpg");
    String[] info = loadStrings(this.folder + "/info.txt");
    title = info[0];
    cols = Integer.parseInt(info[1]);
    rows = Integer.parseInt(info[2]);
    pWidth = Integer.parseInt(info[3]);
    pHeight = Integer.parseInt(info[4]);
    nbrPieces = rows * cols;
    jWidth = cols * pWidth;
    jHeight = rows * pHeight;
    offX = (w - jWidth)/2;
    offY = (h - jHeight)/2;
  }

  void loadPieces(PApplet app) {
    if (pieces == null) {
      String fname;
      pieces = new Sprite[nbrPieces];
      px = new int[nbrPieces];
      py = new int[nbrPieces];
      solved = new boolean[nbrPieces];
      int p = 0, x, y;
      y = offY + pHeight/2;
      for (int r = 0; r < rows; r++) {
        x = offX + pWidth/2;
        for (int c = 0; c < cols; c++) {
          fname = folder + "/piece_" + nf(p, 3) + ".png";
          int z = (int) random(1000, 2999);
          px[p] = x;
          py[p] = y;
          pieces[p] = new Sprite(app, fname, z);
          pieces[p].tagNo = p;
          pieces[p].setXY(px[p], py[p]);
          solved[p] = true;
          pieces[p].respondToMouse(true);
          pieces[p].setDraggable(true);
          x += pWidth;
          p++;
        }
        y += pHeight;
      }
    }
    else {
      resetPieces();
    }
  }

  void resetPieces() {
    for (int p = 0; p < nbrPieces; p++) {
      int z = (int) random(1000, 2999);
      pieces[p].setZorder(z, false);
      pieces[p].setXY(px[p], py[p]);
      solved[p] = true;
      pieces[p].respondToMouse(true);
      pieces[p].setDraggable(true);	
      S4P.registerSprite(pieces[p]);
    }
    S4P.sortZorder();
  }

  void unloadPieces() {
    for (int p = 0; p < nbrPieces; p++) {
      pieces[p].respondToMouse(false);
      pieces[p].setDraggable(false);
      S4P.deregisterSprite(pieces[p]);
    }
  }

  // Returns true if all pieces in place
  boolean isSolved() {
    for (boolean b : solved)
      if (!b) return false;
    return true;
  }


  float progress() {
    float count = 0;
    for (boolean b : solved)
      if (b) count++;
    return count / nbrPieces;
  }
}


