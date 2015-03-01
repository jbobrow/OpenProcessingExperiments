
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
  count=0;
  state=0;
  size(400,400);
  background(255);
  smooth();    
}

void draw() {
  count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 20){
       state = 1;
       background(255);
    } 
  r = random(255);
  g = random(255);
  b = random(255);
  a = 25;
  x = random(width);
  y = random(height);
  
  }
  
  noStroke();
  fill(r,g,b,a);
  diam = state * 20;
  ellipse(x,y,diam,diam);
}


