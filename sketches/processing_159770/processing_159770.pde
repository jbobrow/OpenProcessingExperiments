
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
  size(1200,600);
  background(237,17,17);
  smooth();    
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(255);
  g = random(250);
  b = random(255);
  a = random(255);
  diam = random (width/2);
  x = int(random(width/diam)) *3*diam;
  y = int(random(height/diam)) *2*diam;
  
  count++;
  if(count>50){
    count=20;
    state++;
    if(state>50){
      state=0;
      background(237,219,17);
    }
  }
  
   
  diam=state*50;
  stroke(255,0,0,255);
   fill(r,g,b,a);
  ellipse(x,height,diam/12,diam/2);
}

