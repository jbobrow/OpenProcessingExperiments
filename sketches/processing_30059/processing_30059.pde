
CellArray cells;

void setup(){
  frameRate(30);
  colorMode(HSB);
    stroke(100, 200, 20);
  size(900, 500, P2D);
  cells = new CellArray((float)width, (float)height, 50, 90);
}
void draw(){
  cells.staticActivity();
  //frame.setTitle("FrameRate:"+frameRate);
  for(int i = 0; i < 2; i++)
  cells.mouseAction();
  cells.handle();
}

    

