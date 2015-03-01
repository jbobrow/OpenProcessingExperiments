
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

float xPosition;
float yPosition = 0;

int count;
int state;

void setup() {
  count = 0;
  state = 0; 
 
  size(800,800);
  background(0);
  smooth();   
  
}

void draw() {
  
  //right eyeball
  count++;
  if(count > 20){
    count = 0;
    state++;
    if(state > 8){
       state = 8;
    } 
    
    fill(0,0,0);
  diam = state * 10;
  ellipse(500, 300,diam,diam);
  
  //left eyeball
count++;
  if(count > 20){
    count = 0;
    state++;
    if(state > 8){
       state = 8;
    } 
  }
  fill(0,0,0);
  diam = state * 10;
  ellipse(300, 300,diam,diam);
  
  }
  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = (500);
  x = random(width);
  y = random(height);
  xPosition = random(width);
  yPosition = random(height);
  
    noStroke();
  fill(r,g,b,a);
  ellipse(xPosition,yPosition,diam,diam);
  
}





