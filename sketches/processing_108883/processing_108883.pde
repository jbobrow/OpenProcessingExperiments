
float r;
float g;
float b;
float a;
float x;
float y;

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
  diam = 10;
  x = int(random(40))*diam;
  y = int(random(40))*diam;

  count = count + 1;
  if(count > 200){
    count = 0;
    state=state + 1;
    if(state > 50){
       state = 0;
       background(255);
    } 
 
  }
  noStroke();
  fill(r,g,b,a);
  diam = state;
  ellipse(x,y,diam,diam);
}


