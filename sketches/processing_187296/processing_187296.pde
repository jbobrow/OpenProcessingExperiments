
void setup() {
  size(640, 360); 
  background(0); 
  noStroke(); 
  frameRate(24);
}

void draw() {
  blueDiamond();
}

int gridSize = 40;
float jitter,angle;

void blueDiamond() {
  for (int x = gridSize;x <= width - gridSize; x += gridSize) {
      for(int y=gridSize; y <= height - gridSize; y += gridSize) {
      noStroke();
      fill(random(0-50),random(0,230), random(230,255));
      quad(x,y,x+5,y-10,x+10,y,x+5,y+10);    
      }
  } 
}

void mousePressed (){
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      blueDiamond();
      stroke(random(200,255),100);
      line(x, y, width/2, height/2);
    }
  }
}







