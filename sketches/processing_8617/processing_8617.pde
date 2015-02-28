
float startFill;
float startAngle;
int step;
float stepLength;

float centerX;
float centerY;

float pSize;
float bValue;

void setup(){
  size(250, 250);
  colorMode(HSB, 2*PI, 100, 100);
  smooth();
}

void draw(){
  background(0,0,25);
  ellipseMode(CENTER);
  noStroke();
  
  step = 10;
  centerX = width/2;
  centerY = height/2;
  startFill = 0;
  startAngle = 0;
  stepLength = PI/step;
  
  pSize = 200;
  bValue = 100;
  
  // draw arcs
for(int i=0; i< 2*step; i++){
  
    fill(startFill, 100, 85);
    arc(centerX, centerY, width-10, width-10, startAngle, startAngle+stepLength);
    
    
   //for(int j=0; j< step; j++){
        fill(startFill, bValue, 100,80);
        stroke(0,0,95,20);
        arc(centerX, centerY, pSize, pSize, startAngle, startAngle+stepLength);
       
       bValue = bValue - 50/step;
       pSize = pSize - 50/step;
 
    //}    
    
    startFill =  startFill + stepLength;
    startAngle = startAngle + stepLength;
    
  }
  
}

