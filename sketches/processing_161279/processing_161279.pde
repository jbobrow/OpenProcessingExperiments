
//=======================PAINT EFFECT

float iterations = 1000;
float opacity = 0.4;
float radius = 7;
float colorRange = 30;

color colorShift(color c) {
  return color(red(c) + random(-colorRange, colorRange), 
  green(c) + random(-colorRange, colorRange), 
  blue(c) + random(-colorRange, colorRange), 255*opacity);
}

void paintImage(PImage pi, float posX, float posY) {
  pi.loadPixels();
  float i = 0;
  color c;
  int x, y;
  pushStyle();
  noStroke();
  while (i < iterations) {
    x = int(random(pi.width));
    y = int(random(pi.height));
    c = pi.get(x, y);
    fill(colorShift(c));
    ellipse(posX+x, posY+y, random(radius/2, radius*2), random(radius/2, radius*2));
    i += random(-1, 2);
  }
  popStyle();
} 

//==========================AUTOMATA

float cellSide = 20;
float cellHeight = sqrt(3)/2*cellSide;
int cellsWidth, cellsHeight;
int[][] cells;
color[] palette = {
  #5e76ff, #ff6507, #e8d009, #e874dd, #07ff27
};
float iterWeight = 3;
float centerBias = 5;
int curColor = 0;

void automataInit() {
  cellsWidth = int(width / cellSide * 2) + 5;
  cellsHeight = int(height / cellHeight) + 5;
  cells = new int[cellsWidth+1][cellsHeight+1];
}

void automataUpdateCoords(float x, float y) {
  cells[2*int(x / cellSide)][int(y/cellHeight)] = curColor;
  cells[2*int(x / cellSide) + 1][int(y/cellHeight)] = curColor;  
}

void automataUpdateClick() {
  float diffX = mouseX-pmouseX;
  float diffY = mouseY-pmouseY;
  for (float s = 0; s <= 1; s += 0.1) {
    if ((pmouseX+s*diffX > 0 && pmouseX+s*diffX < width)
        && (pmouseY+s*diffY > 0 && pmouseY+s*diffY < height)){
    automataUpdateCoords(pmouseX+s*diffX, pmouseY+s*diffY); }
  }
}

void automataUpdate(float share) {
  float i = 0;
  float p, p0, p1, p2, p3;
  int c0, c1, c2, c3;
  int x, y;
  while (i < cellsWidth * cellsHeight * share) {
    x = int(random(cellsWidth));
    y = int(random(cellsHeight));
    c0 = cells[x][y];
    if (x-1 >= 0) { 
      c1 = cells[x-1][y];
    } else { 
      c1 = 0;
    };
    if (x+1 < cellsWidth) { 
      c2 = cells[x+1][y];
    } else { 
      c2 = 0;
    };
    if ((y + pow(-1, x) >= 0) && (y + pow(-1, x) < cellsHeight)) { 
      c3 = cells[x][y + int(pow(-1, x))];
    } else { 
      c3 = 0;
    };
    p0 = centerBias * pow(iterWeight, c0);
    p1 = pow(iterWeight, c1);
    p2 = pow(iterWeight, c2);
    p3 = pow(iterWeight, c3);
    p = random(p0+p1+p2+p3);
    cells[x][y] = (p < p0) ? c0 : (p < p0+p1) ? c1 : (p < p0+p1+p2) ? c2 : c3; 
    i += random(-1, 3);
  }
}

void automataDraw(PGraphics pg) {
  pg.beginDraw();
  pg.pushStyle();
  pg.noStroke();
  for (float x = 0; x < cellsWidth; x++) {
    for (float y = 0; y < cellsHeight; y++) {
      pg.fill(palette[cells[int(x)][int(y)] % 5]);
      if ((int(x)+int(y)) % 2 == 1) {
        pg.triangle((x-1)/2 * cellSide, y * cellHeight, 
                    (x+1)/2 * cellSide, y * cellHeight, 
                    x / 2 * cellSide, (y+1) * cellHeight);
      } else {
        pg.triangle((x-1)/2 * cellSide, (y+1) * cellHeight, 
                    (x+1)/2 * cellSide, (y+1) * cellHeight, 
                    x / 2 * cellSide, y * cellHeight);    
      }
    }
  } 
  pg.popStyle();
  pg.endDraw();
}


//==========================DRAWING
PGraphics pg;
int sizex = 800;
int sizey = 600;
void setup() {
  size(sizex, sizey);
  background(#000000);
  pg = createGraphics(sizex, sizey);
  automataInit();
 // noLoop();
}

int phase = 0;
void draw() {
  if (mousePressed) { 
    automataUpdateClick();
  }
  automataDraw(pg);
  paintImage(pg, 0, 0);
  //image(pg, 0, 0);
  automataUpdate(0.3);
  //saveFrame();
}

void mousePressed() { 
  curColor++;
}

void keyPressed() {
  if (key == ' ') { save("img.png"); }
}
