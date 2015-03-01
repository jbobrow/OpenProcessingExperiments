
/*
Exercise III: Time
A small program that visualize the passing of 60 seconds
by Irene Ye Yuan 1/19/2015
*/
// define global variables
// create an array to store the diagonal path 
PVector[] diag = new PVector[7];
// for each arch, create an array to store the points on the arc
PVector[] sec10 = new PVector[11];
PVector[] sec20 = new PVector[21];
PVector[] sec30 = new PVector[31];
PVector[] sec40 = new PVector[41];
PVector[] sec50 = new PVector[51];
PVector[] sec60 = new PVector[61];

// duration for the diagonal traveling to the next arc
float duration = 10000;
// variable for the current time of diagonal traveling
int diagTime; 
// variable for the current time of the arc clock 
int[] clockTime = new int[6];
// counter for the diagonal traveling
int counter;
// counter for six arc
int[] index = new int[6];

// positions for diagonal traveling
float initX, initY;
float finalX, finalY;
float currentX, currentY;
// hue values for different arcs
float[] hue = new float[7];
// variables for changing hue values of the traveling ball
float initHue;
float currentHue;
float destHue;
// variables for saturation and brightness
float saturation, bright;

void setup(){
  // set canvas the canvas size to 427x427
  size(427,427);
  // set background to black
  background(0);
  // set color mode to HSB and set range
  colorMode(HSB,360,100,100,100);
  // initialize counter 
  counter = 0;
  // initialize the index counter for arcs
  for(int i = 0; i < 6; i++){
    if( i%2==0 ){ index[i] = 1; }
    else{ index[i] = (i+1)*10 -1; }
  }
  // initialize hue values
  hue[0] = 200;
  for(int i = 0; i< 6; i++){ hue[i+1] = 60+i*30; }
  // initialize saturation and brightness
  saturation = 75;
  bright = 80;
  // initialize hue values in order to change it 
  initHue = hue[0];
  currentHue = initHue;
  destHue = hue[1];
  // initialize circles on the arcs
  initDiag(diag,7);
  initPts(sec10,11,70);
  initPts(sec20,21,70*2);
  initPts(sec30,31,70*3);
  initPts(sec40,41,70*4);
  initPts(sec50,51,70*5);
  initPts(sec60,61,70*6);
  // set initial position for the diagonal traveling circle
  initX = diag[counter].x;
  initY = diag[counter].y;
  counter ++;
  finalX = diag[counter].x;
  finalY = diag[counter].y;
  currentX = initX;
  currentY = initY;
  // initialize the time
  diagTime = millis();
  // initialize the time for each clock
  for(int i = 0; i < 6; i++){clockTime[i] = millis();}
}

void draw(){
  // rotate and translate to set the origin at the bottom left
  translate(0,427);
  rotate(-PI/2);
  // redraw the background
  background(0);
  // draw the traveling circle at current position
  fill(currentHue,saturation,bright,75); 
  stroke(currentHue,saturation,bright,90);
  ellipse(currentX,currentY,7,7);
  stroke(currentHue,saturation,bright,30);
  line(currentX,currentY,0,0);
  // draw the arc and update the arc
  drawClock();
  updateClock();
  // check if the circle is traveling between the arcs
  if( millis() < diagTime + duration ){  
    // calculate circle's velocity 
    float deltaX = (finalX - initX) / duration ;
    float deltaY = (finalY - initY) / duration ;
    // update circle's current position
    currentX = initX + deltaX * (millis() - diagTime);
    currentY = initY + deltaY * (millis() - diagTime);
    // calculate the change in hue
    float deltaHue = (destHue - initHue ) / duration;
    // update the current hue
    currentHue = initHue + deltaHue * (millis() - diagTime);
    // update each clock arc
    for(int i = 0; i < 6; i++){
      // let the arc update at certain time interval
      if (millis () >= clockTime[i] + ((duration+duration*i)/(5*(i+1)))){
        // arcs travel in different different directions
        if(i%2 == 0){ index[i]++; }
        else{ index[i]--; }
        // if counter is out of index, reset the counter
        if(index[i] > (10+10*i) || index[i] < 0){ index[i] = 0; }
        // update the current time
        clockTime[i] = millis();
      }
    }
  }
  else{
    // if the diagonal travelling circle reached the end, reset
    if(counter > 5){ reset(); }
    // update the final and initial positions and the hue of the travelling
    initX = diag[counter].x;
    initY = diag[counter].y;
    initHue = hue[counter];
    counter ++;
    finalX = diag[counter].x;
    finalY = diag[counter].y;
    destHue = hue[counter];
    // update current time for diagonal travelling
    diagTime = millis();
  }
 }

// method to initialize the destinations for the diagonal travelling
void initDiag(PVector[] pts, int size){
  for (int i = 0; i < size; i++ ){
    pts[i] = new PVector();
    pts[i].x = 70*i*cos(PI/4);
    pts[i].y = 70*i*sin(PI/4);
  }
}

// method for initialzie the circles on the arcs
void initPts(PVector[] sec, int size, float radius){
  // calculate angles so all the circles are evenly distributed on the arc
  float angle = (PI/2)/(size-1); 
  for (int i = 0; i < size; i++){
    sec[i] = new PVector(); 
    sec[i].x = radius * cos(angle*i);
    sec[i].y = radius * sin(angle*i);
  }
}

// method for drawing each circle on arcs
void drawPts(PVector[] pts, int size, int current){
  for (int i = 0; i < size; i++ ){
    // set color to preset hue value
    strokeWeight(0.1);
    stroke(hue[current+1],saturation,bright,20);
    // draw a line from the origin to each circle
    line(0,0,pts[i].x,pts[i].y);
    strokeWeight(1);
    fill(hue[current+1],saturation,bright,20);
    stroke(hue[current+1],saturation,bright,40);
    // draw the circle
    ellipse(pts[i].x,pts[i].y,7,7);
  }
}

// method for drawing each arc
void drawClock(){
  drawPts(sec10,11,0);
  drawPts(sec20,21,1);
  drawPts(sec30,31,2);
  drawPts(sec40,41,3);
  drawPts(sec50,51,4);
  drawPts(sec60,61,5);
}

// method for updating the brighten circle on each arc
// the index number records the brightened circle's index
void updateClock(){
  stroke(hue[1],saturation,bright,90);
  fill(hue[1],saturation,bright,85);
  ellipse(sec10[index[0]].x,sec10[index[0]].y,7,7);
  stroke(hue[2],saturation,bright,90);
  fill(hue[2],saturation,bright,85);
  ellipse(sec20[index[1]].x,sec20[index[1]].y,7,7);
  stroke(hue[3],saturation,bright,90);
  fill(hue[3],saturation,bright,85);
  ellipse(sec30[index[2]].x,sec30[index[2]].y,7,7);
  stroke(hue[4],saturation,bright,90);
  fill(hue[4],saturation,bright,85);
  ellipse(sec40[index[3]].x,sec40[index[3]].y,7,7);
  stroke(hue[5],saturation,bright,90);
  fill(hue[5],saturation,bright,85);
  ellipse(sec50[index[4]].x,sec50[index[4]].y,7,7);
  stroke(hue[6],saturation,bright,90);
  fill(hue[6],saturation,bright,85);
  ellipse(sec60[index[5]].x,sec60[index[5]].y,7,7);
}

// reset the counter and index counter
void reset(){
  counter = 0;
  for(int i = 0; i < 6; i++){
    if( i%2==0 ){ index[i] = 0; }
    else{ index[i] = (i+1)*10; }
  }
}




