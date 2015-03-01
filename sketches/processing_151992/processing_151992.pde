
/*
 * Creative Coding
 * I can't get my 3_03 code to run, so I am
 * tweaking this code to figure out what is awry.*/
 
int     num;    // the number of items in the array (# of circles)
int margin;
float[] x;
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
float distance;
 
float red = 120;
float green = 120;
float blue = 120;
float rowHeight = 1.3*height / (num+1); 


void setup() {
  size(500, 500);
  num = 7;
  margin = 150;
  background(0,0,0);
 
  // allocate space for each array
  x = new float [num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num];
  
 
  // calculate the gap in y based on the number of circles
rowHeight = 1.3* height / (num + .1);
 
  //setup an initial value for each item in the array
  for (int i=0; i<num+1; i++) {
   x[i] = width/3;
    y[i] = rowHeight * (i);      // y is constant for each so can be calculated once
    speed[i] = random(1)/2;
    phase[i] = random(TWO_PI);
  }
}
 
 
void draw() {

 
  for (int i=0; i<num+1; i++) {
    distance = dist(x[i], y[i], x[i+1], y[i+1]);
    
    if (mousePressed == true){
      background(0,0,0);
    }
    if (i%2 == 1) { // odd
      x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* width/2;
    }
    else {
   x[i] = width/2 + cos(radians(frameCount*speed[i] ) + phase[i])* width/2;
    }
    if (distance > rowHeight ){
    noFill();
    stroke(red, green, blue);
    strokeWeight(.5);
    //line(x[i], y[i],  x[i+1], y[i+1]);
    
    ellipse(y[i], x[i],.5*distance, .3*distance); 
  }
   
   
    if (keyPressed ==true && key == 's'){
    saveFrame("Dynamic.jpg");
    }
}
}
// change the background color with rollover
void mouseMoved() {
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

