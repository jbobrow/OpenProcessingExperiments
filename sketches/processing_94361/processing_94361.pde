
Cell [] _cellArray = {};

void setup(){
  size(800, 600);
  sketchFullScreen();
  background(0);
  stroke(0);
  smooth();
  frameRate(60);
  for(int i = 0; i < 10;i++){
    Cell thisCell = new Cell();
    _cellArray = (Cell []) append(_cellArray, thisCell);
  }
}

void draw(){
  fill(0, 0, 0, 10);
  noStroke();
  rect(0,0,width, height);
  for(int i = 0; i < _cellArray.length; i++){
    _cellArray[i].draw();
    _cellArray[i].update();
  }
}

void drawRay(int x1, int y1, int x2, int y2){
  stroke(random(0, 255), 0, 0);
  int fragments = 20;
  int x = x1, y = y1, last_x, last_y;
  float x_frag = abs(x1-x2)/fragments;
  float y_frag = abs(y1-y2)/fragments;
  if(x1>x2){x_frag*=-1;}
  if(y1>y2){y_frag*=-1;}
  for(int i = 0; i < fragments-1; i++){
    last_x = x;
    last_y = y;
    x+=x_frag + (int) random(-5, 5);
    y+=y_frag + (int) random(-5, 5);
    line(x, y, last_x, last_y);
  }
  line(x2, y2, x, y);
}

void mouseReleased(){
  Cell thisCell = new Cell(mouseX, mouseY, (int) random(10)+5);
  _cellArray = (Cell []) append(_cellArray, thisCell);
}

//Fullscreen Variable
boolean sketchFullScreen() {
  return true;
}

//Screen Capturer
void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}
class Cell{
  int xpos, ypos;
  int radius;
  color cellColor = color(255, 255, 255);
  float randomStart = random(-5000, 5000);
  Cell(){
    xpos = (int) random(width);
    ypos = (int) random(height);
    radius = (int) random(10)+5;
  }
  Cell(int _xpos, int _ypos, int _radius){
    xpos = _xpos;
    ypos = _ypos;
    radius = _radius;
  }
  
  void draw(){
    fill(cellColor);
    ellipse(xpos, ypos, radius, radius);
  }
  
  void update(){
    //xpos += (noise(randomStart + (frameCount/10), 0)*5-2.5)*floor(random(-2, 2));
    //ypos += (noise(0, randomStart + (frameCount/10))*5-2.5)*floor(random(-2, 2));
    int step_lenght = 8;
    float angle = radians(random(-360, 360));
    xpos += step_lenght*cos(angle);
    ypos += step_lenght*sin(angle);
    if(xpos>(width+radius)){xpos = 0-radius;}
    if(xpos<(0-radius)){xpos = width+radius;}
    if(ypos>(height+radius)){ypos = 0-radius;}
    if(ypos<(0-radius)){ypos = height+radius;}
    cellColor = color(255);
    this.checkOtherCells();
  }
  
  void checkOtherCells(){
    for (int i=0; i<_cellArray.length; i++) {
      Cell otherCell = _cellArray[i];
      if (otherCell != this) {
        float distance = dist(xpos, ypos, otherCell.xpos, otherCell.ypos);
        if(distance<200){
          drawRay(xpos, ypos, otherCell.xpos, otherCell.ypos);
          cellColor = color(15, 142, 196);
        }
      }     
    }
  }
}


