
float r;
float g; 
float b;
float a;
float x;
float y;
float diam;
int count;
int state;

void setup(){
  size(500,500);
  background(50);
}

void draw(){
r = random(255);
g = random(255);
b = random(255);
a = random(255);

diam = random(15);

x = random(width);
y = random(height);

count++;
if(count > 50){
  count = 10;
  state++;
  if(state > 30){
    state = 0;
    background(0);
  }

noStroke();
fill(r,g,b,a);

diam = state * 15;

rect(x,y,diam,diam);
}
}
