
// Midterm proposal - Wooden mirror
// Gabriela Gutierrez
// October 2010


int videoScale = 10;

int cols, rows;

void setup() {
  size(500,300);
  
  cols = width/videoScale;
  rows = height/videoScale;
}


void draw() {
  background(255,255,0);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
    
      int x = i*videoScale;
      int y = j*videoScale;
      
      color c = color (random(215,255), random(165,215), random(0,65));
      
      fill(c);
      stroke(1);
      rect(x,y,videoScale-1,videoScale-1);
    
    }  
  }
}

