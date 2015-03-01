
// Variables
int num;
float x[],y[];      // centre of element0
float dx[],dy[];    // change in centre of element0
float rad[];        // radius of element0
int i,j;            // counters

// Setup
void setup(){
//  size(displayWidth,displayHeight);  // Use this when running directly in Processing
  size(500,500);  // Use this when running in JavaScript mode - js doesn't like variable display width/height values
  background(255);
  stroke(0);
  strokeWeight(0);
  
// Allocate array size
  num = 20;
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  rad = new float[num];
  
//  Initialise variables
  for (i=0;i<num;i++){
    x[i] = width/2;
    y[i] = height/2;
    dx[i] = random(-1.0,1.0);
    dy[i] = random(-1.0,1.0);
    rad[i] = random(20,100);
  }    
}

void draw(){
//  background(255);
//  Slow background fade
  fill(255,6);
  rect(0,0,width,height);

  for (int i=0;i<num;i++){
//  Test for edge of window and reverse direction
    if (x[i]-rad[i]<0 || x[i]+rad[i]>width){
      dx[i] = -dx[i];}
    if (y[i]-rad[i]<0 || y[i]+rad[i]>height){
      dy[i] = -dy[i];}

//  Normal motion of element
    x[i] = x[i] + dx[i];
    y[i] = y[i] + dy[i];

//    ellipse(x[i],y[i],rad[i]*2,rad[i]*2);
    
//  Test for intersection with other elements
      for (j=0;j<num;j++){
        if (i != j && dist(x[i],y[i],x[j],y[j])<(rad[i]+rad[j])){
          if ((i+j)%2==1){
            stroke(255,0,0);}
          else {
            stroke(0,255,0);}
          line(x[i],y[i],x[j],y[j]);}
          stroke(0);
     }
  }
}

void keyPressed(){
  if (key=='s') save(frameCount + ".jpg");
}


