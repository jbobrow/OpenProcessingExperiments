
//Eric Liu
//CTIN 101
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
  frameRate(500);
  count = 0;
  state = 0;
  size(600,600);
  background(0);
  smooth();    
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(10);
  x = random(width/2);
  y = random(height);
  noStroke();
  fill(#000000);
  ellipse(x,y,diam,diam);
  
   count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       background(255);
    } 
  }
  fill(#FF1C8E);
  diam = state * 8;
  ellipse(width-150,(height/4)*3,diam,diam);
  fill(#FEFF17);
  diam = state * 8;
  ellipse(width-150,height/4*2,diam,diam);
  fill(#0DEDFF);
  diam = state * 8;
  ellipse(width-150,height/4,diam,diam);
}


