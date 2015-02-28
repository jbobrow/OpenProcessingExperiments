
// This is a Warm Color Scheme Arc
//set start fill() color as yellow : Hue = PI/3;
float startFill;
// set start drawing arc from angle PI
float startAngle;
// set how many arcs are drawn
int step;
float stepLength;

float centerX;
float centerY;

float pSize;
float pAngle;
float pFill;
float bValue;

void setup(){
  size(250, 250);
  colorMode(HSB, 2*PI, 100, 100);
  smooth();
}

void draw(){
  background(0,0,95);
  ellipseMode(CENTER);
  noStroke();
  
  step = 10;
  centerX = width/2;
  centerY = height/2;
  startFill = PI;
  startAngle = PI;
  stepLength = PI/step;
  
  pSize = 200;
  bValue = 100;
  
  // draw arcs
for(int i=0; i< 2* step; i++){
  
    /*fill(startFill, 100, 85);
    arc(centerX, centerY, width-10, width-10, startAngle, startAngle+stepLength);
    */
    
     //saturation pointer that follows mouse cursor, 
      //in this demonstration there's no mouse interaction, demo only
     for(int j=0; j< step; j++){
        fill(startFill, bValue, 100);
        stroke(0,0,95);
        arc(centerX, centerY, pSize, pSize, startAngle, startAngle+stepLength);
       
        bValue = bValue - 100/step;
        pSize = pSize - 200/step;
       
    
    startFill = startFill + stepLength;
    startAngle = startAngle + stepLength;
    
     if (startFill > 2* PI){
      startFill = startFill - 2 * PI;
    }

  }
    
   
    
}
 
    
     // draw center circle that blocks the center of the arcs
 /* fill(0,0,95);
  ellipse(centerX, centerY, 200, 200);
*/
  
  
  
}

