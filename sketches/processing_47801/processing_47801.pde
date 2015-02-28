
int nx, ny, c, size, offxy;
boolean toggleLoop = true;

void setup() {
  size(300, 300);
  smooth();
  noStroke();
  frameRate(5);
  background(200);
}

void draw() {
  rectDraw(8, 9);
  rectDraw(2, 3);
}	

void rectDraw(int size, int offxy) {		
  this.size = size;
  this.offxy = offxy;

  for (int nx = 0; nx < width; nx += offxy) {
    for (ny = 0; ny < height; ny += offxy) {
      c = (int) random(10000);				
      if (c >= 9000) 
        c = color((int) random(125, 255));				
      else if (c <= 9000) 
        c = color((int) random(0, 125));				

      fill(c);
      rect(nx, ny, size, size);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
}


