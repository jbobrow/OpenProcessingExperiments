
float b;float a;
float diam;
float x;float y;
float x2;float y2;
float r2;
int count;
int state;

void setup() {
  size(800,600);
  background(255);
  smooth();
  noStroke();
}

void draw() {
  b = random(255);
  a = random(255);
  x = random(width/2);
  y = random(height);
  r2 = random(255);
  x2 = random(width/2)+(width/2);
count++;
if(count > 10){
  count = 0;
  state++;
  if(state > 20){
    state = 0;
    background(255);
  }
}
diam = state *10;
  fill(0,0,b,a);
  ellipse(x,y,diam,diam);
  fill(r2,0,0,a);
  ellipse(x2,y,diam,diam);
}


