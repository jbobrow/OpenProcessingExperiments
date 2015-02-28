
float red;
float green;
float blue;

float diam;
float x;
float y;

int count;
float state;
int quad;

void setup(){
  count = 0;
  state = 0;
  quad = 0;
  x = 0;
  y = 0;
  size(500,500);
  background(255);
}

void draw() {
noStroke();
fill(red,green,blue);
red = random(255);
green = random(255);
blue = random(255);
diam = state * 6;
ellipse(x,y,diam,diam); 
  count = count + 1;
  if(count > 1) {
    count = 0;
    state = state + .025;
    if(state < 2){
      x = int(random(250 - diam));
      y = int(random(250 - diam));
    }
    if(state > 2){
      x = int(random(250,500 - diam));
      y = int(random(250 - diam));
    }
    if(state > 4){
      x = int(random(250,500 - diam));
      y = int(random(250,500 - diam));
    }
    if(state > 6){
      x = int(random(250 - diam));
      y = int(random(250,500 - diam));
    }
    if(state > 8){
      state = 0;
      background(255);
    }
  }
}



