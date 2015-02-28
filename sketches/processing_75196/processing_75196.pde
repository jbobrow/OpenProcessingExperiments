
boolean click = false;
boolean release = true;
Button[] ButtArray = new Button[20];
int mxcheck;
int mycheck;
boolean doublecheck1, doublecheck2;

void makeButtons() {
  //round (10 buttons)
  for (int i = 0; i < 10; i+=2) {
    ButtArray[i] = new Button(50, 50+i/2*100, 50, true); 
    ButtArray[i+1] = new Button(450, 50+i/2*100, 50, false);
  }
  //arrows (another 10 buttons)
  //updown
  ButtArray[10]= new Button(200, 50, 10, true);
  ButtArray[11]= new Button(300, 50, 10, false);
  // double down and up
  ButtArray[12] = new Button(200, 170, 13, true);
  ButtArray[13] = new Button(300, 170, 13, false);
  ButtArray[14] = new Button(200, 250, 13, true);
  ButtArray[15] = new Button(300, 250, 13, false);
  //down and up
  ButtArray[16] = new Button(200, 360, 7, true);
  ButtArray[17] = new Button(300, 360, 7, false);
  ButtArray[18] = new Button(200, 440, 7, true);
  ButtArray[19] = new Button(300, 440, 7, false);
}

void setup() {
  size(500, 500);
  smooth();
  makeButtons();
}

void draw() {
  background(200, 200, 200);
  for(int i = 0; i < 10; i++) {
    ButtArray[i].display();
  }
  for(int i = 10; i < 20; i++) {
    ButtArray[i].polydisplay((i-10)/2);
  }
}

void mousePressed() {
  ButtArray[0].flip();
  ButtArray[1].flip();
  ButtArray[10].polyflip();
  ButtArray[11].polyflip();
  
  doublecheck1 = inPoly(ButtArray[10].vertices);
  doublecheck2 = inPoly(ButtArray[11].vertices);
  
  ButtArray[4].flip();
  ButtArray[5].flip();
  ButtArray[14].polyflip();
  ButtArray[15].polyflip();

  if (!ButtArray[8].checker)
    ButtArray[8].flip();
  if (!ButtArray[9].checker)
    ButtArray[9].flip();
  if (!ButtArray[18].checker)
    ButtArray[18].polyflip();
  if (!ButtArray[19].checker)
    ButtArray[19].polyflip();
    
  mxcheck = mouseX;
  mycheck = mouseY;
  
}

void mouseClicked() {
  ButtArray[2].flip();
  ButtArray[3].flip();
  ButtArray[12].polyflip();
  ButtArray[13].polyflip();
}

void mouseReleased() {
  if (pow((mxcheck- ButtArray[0].x), 2) + pow((mycheck - 
           ButtArray[0].y), 2) <= pow(50/2, 2)) 
    ButtArray[0].flip();
  if (pow((mxcheck- ButtArray[1].x), 2) + pow((mycheck - 
           ButtArray[1].y), 2) <= pow(50/2, 2))
    ButtArray[1].flip();
  
  if(doublecheck1)
  ButtArray[10].polyflip();
  if(doublecheck2)
  ButtArray[11].polyflip();
  
  ButtArray[8].flip();
  ButtArray[9].flip();
  ButtArray[8].flip();
  ButtArray[9].flip();
  
  ButtArray[18].polyflip();
  ButtArray[19].polyflip();
  ButtArray[18].polyflip();
  ButtArray[19].polyflip();
  
  if (!ButtArray[6].checker)
    ButtArray[6].flip();
  if (!ButtArray[7].checker)
    ButtArray[7].flip();
  if (!ButtArray[16].checker)
    ButtArray[16].polyflip();
  if (!ButtArray[17].checker)
    ButtArray[17].polyflip();
}

class Button {
  int s, x, y;
  boolean cl; //if true, white, else black
  boolean checker = false;
  PVector[] vertices;

  Button(int px, int py, int si, boolean c) {
    s = si;
    x = px;
    y = py;
    cl = c;
    vertices = new PVector[s];
  }

  void display() {
    if (cl) fill(255, 255, 255);
    else fill(0, 0, 0);
    ellipse(x, y, s, s);
  }

  void flip() {
    if (pow((mouseX - x), 2) + pow((mouseY - y), 2) <= pow(s/2, 2)) {
      checker = true;
      cl = !cl;
    }
  }

  void polydisplay(int option) {
    if (cl) fill(255, 255, 255);
    else fill(0, 0, 0);
    switch (option) {
    case 0:
      drawUpDown(vertices, x, y);
      break;
    case 1:
      drawTwoUpArrows(vertices, x, y);
      break;
    case 2:
      drawTwoDownArrows(vertices, x, y);  
      break;
    case 3:
      drawUpArrow(vertices, x, y);
      break;
    case 4:
      drawDownArrow(vertices, x, y);
      break;
    }
  }

  void polyflip() {
    if (inPoly(vertices)) {
      checker = true;
      cl = !cl;
    }
  }
}


/* ARROW DRAWING */
void drawUpArrow(PVector[] v, int mx, int my) {
  beginShape();
  vertex(mx - 10, my - 10);
  vertex(mx - 30, my - 10);
  vertex(mx, my - 50);
  vertex(mx + 30, my - 10);
  vertex(mx + 10, my - 10);
  vertex(mx + 10, my + 30);
  vertex(mx - 10, my + 30);
  endShape(CLOSE);
  v[0] = new PVector(mx - 10, my - 10);
  v[1] = new PVector(mx - 30, my - 10);
  v[2] = new PVector(mx, my - 50);
  v[3] = new PVector(mx + 30, my - 10);
  v[4] = new PVector(mx + 10, my - 10);
  v[5] = new PVector(mx + 10, my + 30);
  v[6] = new PVector(mx - 10, my + 30);
}

void drawDownArrow(PVector[] v, int mx, int my) {
  beginShape();
  vertex(mx - 10, my + 10);
  vertex(mx - 30, my + 10);
  vertex(mx, my + 50);
  vertex(mx + 30, my + 10);
  vertex(mx + 10, my + 10);
  vertex(mx + 10, my - 30);
  vertex(mx - 10, my - 30);
  endShape(CLOSE);
  v[0] = new PVector(mx - 10, my + 10);
  v[1] = new PVector(mx - 30, my + 10);
  v[2] = new PVector(mx, my + 50);
  v[3] = new PVector(mx + 30, my + 10);
  v[4] = new PVector(mx + 10, my + 10);
  v[5] = new PVector(mx + 10, my - 30);
  v[6] = new PVector(mx - 10, my - 30);
}

void drawTwoUpArrows(PVector[] v, int mx, int my) {
  beginShape();
  vertex(mx - 20, my - 10);
  vertex(mx - 30, my - 10);
  vertex(mx - 15, my - 50);
  vertex(mx, my - 20);
  vertex(mx + 15, my - 50);
  vertex(mx + 30, my - 10);
  vertex(mx + 20, my - 10);
  vertex(mx + 20, my + 30);
  vertex(mx + 10, my + 30);
  vertex(mx + 10, my - 10);
  vertex(mx - 10, my - 10);
  vertex(mx - 10, my + 30);
  vertex(mx - 20, my + 30);
  endShape(CLOSE);
  v[0] = new PVector(mx - 20, my - 10);
  v[1] = new PVector(mx - 30, my - 10);
  v[2] = new PVector(mx - 15, my - 50);
  v[3] = new PVector(mx, my - 20);
  v[4] = new PVector(mx + 15, my - 50);
  v[5] = new PVector(mx + 30, my - 10);
  v[6] = new PVector(mx + 20, my - 10);
  v[7] = new PVector(mx + 20, my + 30);
  v[8] = new PVector(mx + 10, my + 30);
  v[9] = new PVector(mx + 10, my - 10);
  v[10] = new PVector(mx - 10, my - 10);
  v[11] = new PVector(mx - 10, my + 30);
  v[12] = new PVector(mx - 20, my + 30);
}


void drawTwoDownArrows(PVector[] v, int mx, int my) {
  beginShape();
  vertex(mx - 20, my + 10);
  vertex(mx - 30, my + 10);
  vertex(mx - 15, my + 50);
  vertex(mx, my + 20);
  vertex(mx + 15, my + 50);
  vertex(mx + 30, my + 10);
  vertex(mx + 20, my + 10);
  vertex(mx + 20, my - 30);
  vertex(mx + 10, my - 30);
  vertex(mx + 10, my + 10);
  vertex(mx - 10, my + 10);
  vertex(mx - 10, my - 30);
  vertex(mx - 20, my - 30);
  endShape(CLOSE);
  v[0] = new PVector(mx - 20, my + 10);
  v[1] = new PVector(mx - 30, my + 10);
  v[2] = new PVector(mx - 15, my + 50);
  v[3] = new PVector(mx, my + 20);
  v[4] = new PVector(mx + 15, my + 50);
  v[5] = new PVector(mx + 30, my + 10);
  v[6] = new PVector(mx + 20, my + 10);
  v[7] = new PVector(mx + 20, my - 30);
  v[8] = new PVector(mx + 10, my - 30);
  v[9] = new PVector(mx + 10, my + 10);
  v[10] = new PVector(mx - 10, my + 10);
  v[11] = new PVector(mx - 10, my - 30);
  v[12] = new PVector(mx - 20, my - 30);
}

void drawUpDown(PVector[] v, int mx, int my) {
  beginShape();
  vertex(mx - 10, my - 10);
  vertex(mx - 30, my - 10);
  vertex(mx, my - 50);
  vertex(mx + 30, my - 10);
  vertex(mx + 10, my - 10);
  vertex(mx + 10, my + 20);
  vertex(mx + 30, my + 20);
  vertex(mx, my + 50);
  vertex(mx - 30, my + 20);
  vertex(mx - 10, my + 20);
  endShape(CLOSE);
  v[0] = new PVector(mx - 10, my - 10);
  v[1] = new PVector(mx - 30, my - 10);
  v[2] = new PVector(mx, my - 50);
  v[3] = new PVector(mx + 30, my - 10);
  v[4] = new PVector(mx + 10, my - 10);
  v[5] = new PVector(mx + 10, my + 20);
  v[6] = new PVector(mx + 30, my + 20);
  v[7] = new PVector(mx, my + 50);
  v[8] = new PVector(mx - 30, my + 20);
  v[9] = new PVector(mx - 10, my + 20);
}

/* 
 * Point in poly code, taken from
 * http://forum.processing.org/topic/hit-test-point-in-polygon-algorithm-for-complex-polygons
 */
boolean inPoly(PVector[] verts) {
  PVector pos = new PVector(mouseX, mouseY);
  boolean bleh = false;
  int i, j;
  int sides = verts.length;
  for (i=0,j=sides-1;i<sides;j=i++) {
    if ((((verts[i].y <= pos.y) && (pos.y < verts[j].y))|| 
      ((verts[j].y <= pos.y) && (pos.y < verts[i].y))) &&
      (pos.x < (verts[j].x - verts[i].x) * (pos.y - verts[i].y) / 
    (verts[j].y - verts[i].y) + verts[i].x)) {
      bleh = !bleh;
    }
  }
  return bleh;
}

