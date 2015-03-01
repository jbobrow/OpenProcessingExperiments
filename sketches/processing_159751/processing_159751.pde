
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
int count;
int state;

void setup() {
  size(640,480);
  background(255);
  smooth();    
   count = 0;
  state = 0;
 
}


void draw() {
  print(state);
  // Each time through draw(), new random numbers are picked for a new ellipse.
  count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       background(random(255),random(255),random(255));
    }
    
  }
   diam = state * 20;
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  //diam = random(20);
  x = int(random(width/160))*160;
  y = int(random(height/160))*160;
  

  // Use values to draw an ellipse
 stroke(255); // noStroke();
  fill(r,g,b,a);
  ellipse(x+80,y+80,diam,diam);
}



