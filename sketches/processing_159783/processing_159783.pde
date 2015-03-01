
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 4-7: Filling variables with random values

float r;
float g;
float b;
float a;


float x;
float y;








  // Each time through draw(), new random numbers are picked for a new ellipse.







  
  // Use values to draw an ellipse






float diam;
int count;
int state;

void setup() {
  count = 0;
  state = 0;
  
  size(200,200);
  background(255);
  smooth();    
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = 20;
  x = diam*int(random(1,10));
  y = diam*int(random(1,10));
  
  noStroke();
  fill(r,g,b,a);
  rect(x,y,diam,diam);

  count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       background(random(255), random(255), random(255), random(255));
    } 
 
  }
  rectMode(CENTER);
  fill(0);
  diam = state * 20;
  rect(width/2,height/2,diam,diam);
  
  rectMode(CENTER);
  fill(255);
  diam = state * 15;
  rect(width/2,height/2,diam,diam);
  
  rectMode(CENTER);
  fill(0);
  diam = state * 10;
  rect(width/2,height/2,diam,diam);
  
  rectMode(CENTER);
  fill(255);
  diam = state * 5;
  rect(width/2,height/2,diam,diam);
  
  rectMode(CENTER);
  fill(0);
  diam = state * 2.5;
  rect(width/2,height/2,diam,diam);
  
  rectMode(CENTER);
  fill(255);
  diam = state * 1.15;
  rect(width/2,height/2,diam,diam);
  
}


