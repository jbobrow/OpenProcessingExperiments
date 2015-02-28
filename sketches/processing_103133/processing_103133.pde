
int xSize = 10;
int ySize = 10;
float hueStepSize = 50;
float saturationStepSize = 20;
char mode = 'd';

int xGridSize;
int yGridSize;
float[][] hueArray; 
float[][] saturationArray;

void setup() {
  size(600, 400);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  background(255, 255, 255);
  
  xGridSize = ceil(width / float(xSize));
  yGridSize = ceil(height / float(ySize));
  hueArray = new float[xGridSize][yGridSize]; 
  saturationArray = new float[xGridSize][yGridSize]; 

  initArrays();
}

void draw() {
  // make changes to the grid, as determined by the mode.
  if (mouseX != pmouseX || mouseY != pmouseY){
    // first figure out where the mouse is.
    int mouseXgrid = (int) (mouseX / xSize);
    int mouseYgrid = (int) (mouseY / ySize);
    
    if (mode == 'r') { // random colors
      hueArray[mouseXgrid][mouseYgrid] = random(360);
      saturationArray[mouseXgrid][mouseYgrid] = random(100);
    } else {  // colors changes determined by mouse direction
      int xDelta = mouseX - pmouseX;
      int yDelta = mouseY - pmouseY;
    
      if (abs(xDelta) > abs(yDelta)) {
        hueArray[mouseXgrid][mouseYgrid] = (hueArray[mouseXgrid][mouseYgrid] + sgn(xDelta) * random(hueStepSize) + 360) % 360;
      } else {
        saturationArray[mouseXgrid][mouseYgrid] += sgn(yDelta) * random(saturationStepSize);
      }
    }
  }
    
  // draw the color grid
  for (int x = 0; x < xGridSize; x++) {
    for (int y = 0; y < yGridSize; y++) {
      fill(hueArray[x][y],saturationArray[x][y],100);
      rect(x*xSize,y*ySize,xSize,ySize);
    }
  }
    line(mouseX,mouseY,pmouseX,pmouseY);
}

// initialize hue and saturation arrays
void initArrays() {
  float hueInit = random(360);
  for (int x = 0; x < xGridSize; x++) {
    for (int y = 0; y < yGridSize; y++) {
      hueArray[x][y] = hueInit;
      saturationArray[x][y] = 50;
    }
  }
}

void mouseClicked() {
  initArrays();
}  

void keyPressed() {
  if (mode == 'r') {
    mode = 'd';
  } else {
    mode = 'r';
  }
}

int sgn(float x) {
  if (x > 0) {
    return 1;
  } else if (x < 0) {
    return -1;
  } else {
    return 0;
  }
}


