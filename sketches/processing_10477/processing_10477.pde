
// Polar Paint v.0.something
// By Roger Löf
// Controls:
//q to increase brush size
//w to decrease brush size
//a to increase number of slices
//s to decrease number of brushes
//c to clear
//m to change drawing mode (from mirrored to rotational)

int centerX;
int centerY;
int slices = 8;
int brushSize = 10;
int drawType = 0;
float angleOffset = -PI/2;

void setup(){
  size(600,600);
  background(0);
  centerX = round(width/2);
  centerY = round(height/2);
}

void draw(){
  if(mousePressed){
    if(drawType == 0){
      drawMirroredSlices(slices);
    }else if(drawType == 1){
      drawSlices(slices);
    }    
  }
}

float getRadius(int x, int y){
  return sqrt(sq(x-centerX)+sq(y-centerY));
}

float getAngle(int x, int y){
    return atan2((y-centerY),(x-centerX));
}

void drawSlices(int numSlices){
  float radius = getRadius(mouseX, mouseY);
  float angle = getAngle(mouseX, mouseY);
  for(int i = 0; i < numSlices; i++){
    int x = centerX + round(radius*cos(angle+i*((2*PI)/numSlices)));
    int y = centerY + round(radius*sin(angle+i*((2*PI)/numSlices)));
    myDraw(x,y);
  }
}

void drawMirroredSlices(int numSlices){
  float radius = getRadius(mouseX, mouseY);
  float angle = getAngle(mouseX, mouseY);
  float sliceAngle = (2*PI)/numSlices;
  for(int i = 0; i < numSlices+3; i=i+2){
      int x1 = centerX + round(radius*cos(angle+i*sliceAngle));
      int y1 = centerY + round(radius*sin(angle+i*sliceAngle));
      myDraw(x1,y1);
      int x2 = centerX + round(radius*cos(-angle+i*sliceAngle));
      int y2 = centerY + round(radius*sin(-angle+i*sliceAngle));
      myDraw(x2,y2);
  }
}


void myDraw(int x, int y){
  noStroke();
  fill(255);
  smooth();
  ellipse(x, y, brushSize, brushSize);
  //line(x,y,centerX+random(50),centerY+random(50));
  //filter(BLUR,1);
}

void keyPressed() {
  if(key == 'c' || key == 'C'){
    background(0);
    println("Cleared.");
  }
  
  if(key == 'a'){
    slices++;
    println("Slices: " + slices);
  }
  
  if(key == 's'){
    if(slices >= 2){
      slices--;
      println("Slices: " + slices);
    }
  }
  
  if(key == 'q'){
    brushSize++;
    println("Brush Size: " + brushSize);
  }
  
  if(key == 'w'){
    if(brushSize >= 2){
      brushSize--;
      println("Brush Size: " + brushSize);
    }
  }
  
  if(key == 'm'){
    if(drawType < 1){
      drawType++;
      println("Mode changed.");
    }else{
      drawType--;
      println("Mode changed.");
    }
  }
}

