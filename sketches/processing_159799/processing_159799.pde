
int count;
int state;

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  count = 0;
  state = 0;
  
  size(400,600);
  background(0);
  smooth();    
}

void draw() {
  
  r = random(235);
  g = random(20);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  

  count++;
  if(count > 80){
    count = 0;
    state++;
    if(state > 10){
       state = 0;
       background(0);
    } 
 
  }
  fill(r,g,b,a);
  diam = random (state * 60);
  ellipse(x,y,diam,diam);
}


