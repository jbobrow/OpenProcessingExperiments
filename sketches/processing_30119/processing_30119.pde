
int grid = 5;  // invader-elemente
int cell = 35;
color farbe;

void setup() {
  size(grid*cell+20, grid*cell+20);
  frameRate(12);
  farbe = color(255);
}

void draw () {
  background(0);
  invader(10,10,cell,farbe);
}

void invader (int xpos, int ypos, int cellsize, color c) {
  noStroke();
  fill(c);
  
  for (int k=0; k<round(grid/2.); k++) {
    for (int i=0; i<grid; i++) {
      if(round(random(1)) == 1) {
         rect(xpos + (cellsize * k), ypos + (i*cellsize), cellsize, cellsize);
         rect(xpos + ((grid-1-k)*cellsize), ypos + (i*cellsize), cellsize, cellsize);
      }
    }    
  }
  
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
  
                                                
