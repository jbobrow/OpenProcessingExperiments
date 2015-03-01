
// Combination of in-class example and Example 4-7

float r;
float g;
float b;
float a;
float diam;
float x;
float y;
int state;
int count;

void setup() {
  state = 0;
  size(200,200);
  background(255);
  smooth();    
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
 
   count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       background(255);
    } 
  }
  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = state * 20;
  x = random(width);
  y = random(height);
  
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}


