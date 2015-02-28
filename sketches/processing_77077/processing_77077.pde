
//Sarah Anderson, seanders
//hw11
//Copywrite Sarah Anderson at CMU 2012

final int max = 500;

//arrays
int [] boxX;
int [] boxY;
int [] boxSize;
int [] xSpeed;
int [] ySpeed;
int [] colors;
int [] strokes;

void setup(){
  size(900,700);
  background(50);
  smooth();
  boxX = new int [max];
  boxY = new int [max];
  boxSize = new int [max];
  xSpeed = new int [max];
  ySpeed = new int [max];
  colors = new int [max];
  strokes = new int [max];
  
  getColor();
  getArray(boxX, 0,width);
  getArray(boxY, 0, height);
  getArray(boxSize, 10, 100);
  getArray(xSpeed, 1, 8);
  getArray(ySpeed, 1, 8);
}

void draw(){
  setupWindow();  
  drawBoxes();
  moveBoxes();
}

void moveBoxes(){
  for (int i=0; i<max; i++){
    boxX[i]+= xSpeed[i];
    if(boxX[i]+ (boxSize[i]/2) > width || boxX[i]+ (boxSize[i]/2) < 0){
      xSpeed[i]= -xSpeed[i];  
    }
    boxY[i]+=ySpeed[i];
    if(boxY[i]+ (boxSize[i]/2) > height || boxY[i]+ (boxSize[i]/2) < 0){
      ySpeed[i]= -ySpeed[i];  
    }
  }  
}

void setupWindow(){
  fill(50,50,50,10);
  noStroke();
  rect(0,0,width,height);  
}

void getArray( int[] anyArray, int low, int high){
  for(int i =0; i< anyArray.length; i++){
    anyArray[i]=int(random(low,high));
  }  
}


void drawBoxes(){
  for(int i =0; i<max; i++){
    fill(colors[i],100);
    stroke(strokes[i]);
    rect(boxX[i],boxY[i],boxSize[i],boxSize[i]);  
  }
}

void getColor(){
  for(int i=0; i<colors.length; i++){
    colors[i] = color(random(255),random(255), random(255)); 
  }   
  for(int i = 0; i<strokes.length; i++){
    strokes[i] = color( random(255), random(255), random(255));  
  }
}
