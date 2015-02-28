
int maxrezX = 640;
int maxrezY = 480;
//int gridSizeX = 20;
//int gridSizeY = 15;
int gridSizeX = 80;
int gridSizeY = 60;
gShape [][] shapeArray = new gShape[gridSizeX][gridSizeY];
ArrayList<PVector> history = new ArrayList<PVector>();
boolean addHistory;

// USER VARS

int window = 50;
int maxSize = 85; //percentage of grid allowed
int brushSize = 50;

void setup() {
  //size(maxrezX, maxrezY, P2D);
  size(640, 480, P2D);
  for (int i = 0 ;i < gridSizeX; i++) {
    for (int j = 0; j < gridSizeY; j++) {
      float cX = maxrezX*i/gridSizeX;
      float cY = maxrezY*j/gridSizeY;
      shapeArray[i][j] = new gShape(0, 1, new PVector(cX, cY), (maxSize/100.00)*(maxrezX/gridSizeX));
    }
  }
  //history.add(new PVector(0, 0));
}
void draw() {
  background(255);
  stroke(0);
  fill(0);
  int k2=history.size()-1;
  //if(k2 > -1) history.get(k2).z = 0;
  if (addHistory) 
    if (k2 == -1) history.add(new PVector(mouseX, mouseY, 1));
    else
      //if (frameCount%1 == 0) 
      if (dist(history.get(k2).x, history.get(k2).y, mouseX, mouseY) > 10) { 
        history.add(new PVector(mouseX, mouseY, 1));
        //history.get(k2).z = 1;
      }



  for (int i = 0; i<gridSizeX; i++) {
    for (int j = 0; j < gridSizeY; j++) {
      float f = 0;
      int inBrush = 0;
      for (int k = 0 ; k < history.size(); k++) {
        float d = dist(history.get(k).x, history.get(k).y, shapeArray[i][j].c.x, shapeArray[i][j].c.y);
        f += exp(-sq(d) / (2*sq(window)));
        if (d < brushSize && inBrush == 0) inBrush = 1;
      }
      if (inBrush != 0) shapeArray[i][j].sz = f;
      shapeArray[i][j].draw();
    }
  }
  stroke(255, 0, 0, 100);
  for (int k = 1; k < history.size(); k++) 
    if (history.get(k-1).z != 0)
      line(history.get(k).x, history.get(k).y, history.get(k-1).x, history.get(k-1).y);
  fill(200,100,45,50);
  noStroke();
  ellipse(mouseX, mouseY, brushSize*2, brushSize*2);
}
class gShape {
  float sz = 0;
  float msz = 0;
  PVector c = new PVector(0,0);
  gShape(float saiz, int type,PVector cent, float maxSize) {
    sz = saiz;
    msz = maxSize;
    c = cent.get();
  }
  void draw() {
    
    rec(c,sz);
  }
  void rec(PVector c, float sz) {
    if(sz > msz) sz = msz; 
    if(sz > 0.1) rect(c.x,c.y,sz,sz);
     
    
  }
}
void keyPressed() {
  switch(key) {
  case 'a':
    break;
  }
}
void mousePressed() {
  addHistory = true;
}
void mouseReleased() {
  addHistory = false;
  if(history.size()-1 > -1) history.get(history.size()-1).z = 0;
}
