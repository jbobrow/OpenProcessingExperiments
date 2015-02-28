
import corkbird.*;

/**

Gridded 5x5
Not a square grid
Alter the gradients of color in each box
Boxes in the top a dark blue
Person whose sketching can drag to change color
and to change box size

next version
wasn't thinking boxes within the grid
adaptive grid where things nereby change in shape and color
dragging in a direction can shrink or expand, or change colors



*/

transient int HORZ_GRIDS = 5;
transient int VERT_GRIDS = 4;
transient int GRID_HEIGHT, GRID_WIDTH;
void setup() {
  size(480,320);
  new Corkbird(this);
  smooth();
  colorMode(HSB);
  GRID_HEIGHT = height/VERT_GRIDS;
  GRID_WIDTH = width/HORZ_GRIDS;
  gridies = new Gridie[VERT_GRIDS*HORZ_GRIDS];
  for(int i = 0; i < gridies.length; i++) {
    gridies[i] = new Gridie();
    gridies[i].redraw();
  }
}

public Gridie[] gridies;
void draw() {
  background(0);
  int i = 0;
  for(int row = 0; row < VERT_GRIDS; row++) {
    for(int col = 0; col < HORZ_GRIDS; col++) {
      if(gridies[i].tile == null) {
        gridies[i].redraw();
      }
      image(gridies[i].tile, col*GRID_WIDTH, row*GRID_HEIGHT);
      i++;
      if(i > gridies.length) return;
    }
  }
}

public class Gridie {
  public int colorA, colorB, seed;
  public float ratio, scale;
  transient PGraphics tile;
  public Gridie() {
    colorA = 150;
    colorB = 200;
    ratio = 0;
    scale = 20;
  }
  public Gridie(Gridie clone) {
    super();
    colorA = clone.colorA;
    colorB = clone.colorB;
    ratio = clone.ratio;
    scale = clone.scale;
    seed = clone.seed;
  }
  void redraw() {
    if(tile == null) tile = createGraphics(GRID_WIDTH, GRID_HEIGHT, P2D);
    randomSeed(seed);
    int
    h = colorA,
    s = 230,
    b = int(colorB*0.5+128);
    
    float
    trueRatio = pow(2, ratio),
    loScale = scale*0.9,
    hiScale = scale/0.9,
    loRatio = trueRatio*0.9,
    hiRatio = trueRatio/0.9,
    loWide = scale*loRatio,
    hiWide = scale*hiRatio,
    loTall = scale/hiRatio,
    hiTall = scale/loRatio;
        
    tile.beginDraw();
    tile.colorMode(HSB);
    tile.rectMode(CENTER);
    
    tile.stroke(255);
    tile.background(h,s,b);

    for(int i = 0; i < 30; i++) {
      tile.fill(random(h-H_RANGE, h+H_RANGE), random(s-S_RANGE, s+S_RANGE), random(b-B_RANGE, b+B_RANGE));
      tile.rect(random(0,GRID_WIDTH), random(0,GRID_HEIGHT), max(0,random(loWide, hiWide)), max(0,random(loTall, hiTall)));
    }
    tile.endDraw();
  }
}

static final int
H_RANGE = 20,
S_RANGE = 20,
B_RANGE = 20,
RATIO_RANGE = 15,
VERT_RANGE = 15;

transient int startMouseX, startMouseY;
transient Gridie editing, initial;
transient int editingMode;
static final int COLOR_EDITING = 0;
static final int SHAPE_EDITING = 1;
void mousePressed() {
  startMouseX = mouseX;
  startMouseY = mouseY;
  editing = gridies[indexForPosition(mouseX, mouseY)];
  editingMode = modeForPosition(mouseX, mouseY);
  initial = new Gridie(editing);
}

int indexForPosition(int x, int y) {
  int col = x/GRID_WIDTH;
  int row = y/GRID_HEIGHT;
  return row*HORZ_GRIDS + col;
}

int modeForPosition(int x, int y) {
  if(y%GRID_HEIGHT > GRID_HEIGHT*0.5) {
    return SHAPE_EDITING;
  } else {
    return COLOR_EDITING;
  }
}

void mouseDragged() {
  if(editing != null) {
    if(editingMode == COLOR_EDITING) {
      editing.colorA = wrap(initial.colorA + (mouseX-startMouseX), 255);
      editing.colorB = constrain(initial.colorB - (mouseY-startMouseY)*2, 0, 255);
    } else if(editingMode == SHAPE_EDITING) {
      editing.ratio = constrain(initial.ratio + (mouseX-startMouseX)*0.008, -5, 5);
      editing.scale = constrain(initial.scale - (mouseY-startMouseY)*0.2, 1, 100);
      editing.seed = int(editing.scale);
    }
    editing.redraw();
  }
}

int wrap(int value, int range) {
  if(value < 0) {
    return range-(value%range);
  } else {
    return value%range;
  }
}

void mouseReleased() {
  editing = null;
}


