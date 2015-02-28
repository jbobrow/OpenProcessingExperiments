

PFont font;
float centerX; 
float centerY;
float centerXTarget;
float centerYTarget;
float pointX;
float pointY;
float pointXTarget;
float pointYTarget;
int doubleClickInterval;

void setup() {
  size(500,500);
 font = loadFont("Monospaced-15.vlw");
 textFont(font,15);
 centerX = centerXTarget = width/2;
 centerY = centerYTarget = height/2;
 pointX = pointXTarget = 120;
 pointY = pointYTarget = 300;
 strokeWeight(2);
 smooth();
}

void draw() {
  background(10);
  
  // Move center towards target
  centerX = (centerXTarget-centerX)/10.0 + centerX;
  centerY = (centerYTarget-centerY)/10.0 + centerY;
  pointX = (pointXTarget-pointX)/10.0 + pointX;
  pointY = (pointYTarget-pointY)/10.0 + pointY;
  
  
  // Timeout the double click as a single click
  if ( doubleClickInterval != 0 &&  (doubleClickInterval + 250 < millis())) {
    pointXTarget = mouseX;
    pointYTarget = mouseY;
    doubleClickInterval = 0;
  }
  
  drawGeometry();
  
}

void keyPressed() {
  
  if ( key == 'c' ) {
    centerXTarget = width/2;
    centerYTarget = height/2;
  } 
  /*
  // Change strokeWeight through keys
  else if ( key > 48 && key < 58 ) { //keys 1-9
    strokeWeight((key-48)*2 -1 );
  } else if ( key == 48 ) { //key 0
     strokeWeight(19);
  }
  */
 
}

void mousePressed() {
  
  if ( doubleClickInterval == 0 ) {
    doubleClickInterval = millis();
  } else {
    centerXTarget = mouseX;
    centerYTarget = mouseY;
    doubleClickInterval = 0;
  }
  
}

void mouseDragged() {
  if ( mousePressed ) {
    pointX = pointXTarget =  mouseX;
    pointY = pointYTarget = mouseY;
  }
  
}

void drawGeometry() {
  stroke(255,255,0);
  line(centerX,centerY,pointX,pointY);
  stroke(255,0,0);
  line(centerX,centerY,centerX,pointY);
  stroke(0,255,0);
  line(centerX,pointY,pointX,pointY);
  
   
  int distance = (int)dist(centerX,centerY,pointX,pointY);
  float angle = atan2(pointY-centerY,pointX- centerX);
  if (angle < 0 ) angle = angle + TWO_PI;
  noFill();
 
  float[] list = { distance, width-centerX, centerX,height-centerY,centerY };
  float shortDistance = min(list);
 
  stroke(0,0,127);
  ellipse(centerX,centerY,shortDistance*2,shortDistance*2);
  stroke(255,127,0);
  
  arc(centerX,centerY,shortDistance*2,shortDistance*2,0,angle);
  //stroke(0,0,255);
  //arc(centerX,centerY,shortDistance*2,shortDistance*2,TWO_PI+angle,TWO_PI);
  fill(255,127,0);
  float x = cos(angle/2) * shortDistance + centerX + 5;
  float y = sin(angle/2) * shortDistance + centerY + 5;
  noStroke();
  rect(x-1,y-1,50,12);
  fill(0);
  textAlign(LEFT,TOP);
  text(angle,x-5,y);
 
  fill(255,255,0);
  noStroke();
  rect((centerX-pointX)/2+pointX-1,(centerY-pointY)/2+pointY-1,27,12);
  fill(0);
  textAlign(LEFT,TOP);
  
   text(distance,(centerX-pointX)/2+pointX,(centerY-pointY)/2+pointY);
  
  fill(255,0,0);
  distance = (int)dist(centerX,centerY,centerX,pointY);
  
  noStroke();
  rect(centerX-1,(centerY-pointY)/2+pointY-1,27,12);
  fill(0);
  textAlign(LEFT,TOP);
  
  text(distance,centerX, (centerY-pointY)/2+pointY);
  fill(0,255,0);
   distance = (int)dist(centerX,pointY,pointX,pointY);
   
  noStroke();
  rect((centerX-pointX)/2+pointX -1,pointY-1,27,12);
  fill(0);
  textAlign(LEFT,TOP);
   
  text(distance,(centerX-pointX)/2+pointX ,pointY);
  
}




