
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
  size(800,500);
  background(0);
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
if(count > 30){
  count = 10;
  state++;
  
  if(state > 30){
    state = 10;
    x = int(random(300 - diam));
    y = int(random(300 - diam));
    background(25);
  }
  
  if(state > 50){
    state = 0;
    x = int(random(200 - diam));
    y = int(random(200 - diam));
    background(50);
  }

noStroke();
fill(r,g,b,a);

diam = state * 15;
count = count + 1;
rect(x,y,diam,diam);
}
}
