
int xpos = 0;
int ypos = 0;
int xScreenSize = screen.width; 
int yScreenSize = screen.height;
int gridSizeX = 0;
int gridSizeY = 0;


void setup() {
  size(500,500);
  noStroke();
  background(0);
  gridSizeX = xScreenSize / 100;
  gridSizeY = yScreenSize / 100;
}

void draw() {
  if (mousePressed == true) {
    
    background(0);
    
  }
  if (keyPressed == true)  {
    return;
  }
  xpos=int(random(gridSizeX));
  ypos=int(random(gridSizeY));
  rect(xpos*100, ypos*100, 100, 100);
  delay(40);
  
}


//randomgggg






