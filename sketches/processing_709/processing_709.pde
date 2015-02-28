
int xpos = 0;
int ypos = 0;
int xScreenSize = screen.width; 
int yScreenSize = screen.height;
int gridSizeX = 0;
int gridSizeY = 0;


void setup() {
  size(screen.width,screen.height);
  noStroke();
  background(0);
  gridSizeX = xScreenSize / 40;
  gridSizeY = yScreenSize / 40;
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
  rect(xpos*40, ypos*40, 40, 40);
  delay(20);
}


//randomgggg





