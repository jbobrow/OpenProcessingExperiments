
int lastMouseX, lastMouseY;
Field f[][];
int cntX, cntY;

//================================================================

void setup() {
  size(600,400);
  smooth();
  fill(0, 255, 64, 64);
  noStroke();
  textSize(9);
  textAlign(CENTER, CENTER);
  
  int gap = 5;
  
  lastMouseX = -1;
  lastMouseY = -1;
  cntX = width/gap;
  cntY = height/gap;
  f = new Field[cntX][cntY];
  for (int y=0; y<cntY; y++)
    for (int x=0; x<cntX; x++)
      f[x][y] = new Field(x*gap + gap/2, y*gap + gap/2);
}

//================================================================

void draw() {
  if (mouseX != lastMouseX || mouseY != lastMouseY) {
    background(0);
    
    for (int y=0; y<cntY; y++)
      for (int x=0; x<cntX; x++)
        f[x][y].show();
        
    fill(128, 0, 0);
    ellipse(mouseX, mouseY, 30, 30);
    lastMouseX = mouseX;
    lastMouseY = mouseY;
    
  }
}

//================================================================

class Field {
  PVector pos;
  //--------------------------------------------
  Field(float x, float y) {
    pos = new PVector(x, y);
  }
  //--------------------------------------------
  void show() {
    float dist = sqrt(sq(pos.x - mouseX) + sq(pos.y - mouseY));
    float adj = 6 - log(dist);
    pushMatrix();
      translate(pos.x, pos.y + adj*20 - 60);
      fill(0, 255 - adj*50, 0, 64);
      ellipse(0, 0, 5, 5);
    popMatrix();
  }
}


