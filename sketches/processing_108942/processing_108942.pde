
int x;
int y;
float diam;
float state;
float red;
float green;
float blue;

void setup(){
  size(600,600);
  background(255);
  noStroke();
  state = 0;
  x = 0;
  y = 0;
  diam = 1;
}

void draw(){
  red = random(255);
  green = random(255);
  blue = random(255);
  diam = state * 10;
    state = state + .005;
    if (state >1){
      x = int(random(600));
      y = int(random(200));
    }
    if (state >2){
      x = int(random(600));
      y = int(random(200)+200);
    }
    if (state >3){
      x = int(random(600));
      y = int(random(200)+400);
    } 
    fill(red,250,blue);
    ellipse(x,y,diam,diam);

    if (state>4){
      state = 0;
      background (255);
    }
}


