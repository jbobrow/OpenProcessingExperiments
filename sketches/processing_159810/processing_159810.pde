

float r;
float g;
float b;
float a;

int count;
int state;

void setup() {
  count = 0;
  state = 0;
  
  size(200,200);
  background(255);
  smooth();    
}

float diam;
float x;
float y;

void setup() {
  size(300,300);
  background(255);
  smooth();    
}

void draw() {
  r = random(555);
  g = random(65);
  b = random(105);
  a = random(150);
  diam = random(90);
  x = random(width);
  y = random(height);

  r = random(555);
  g = random(65);
  b = random(105);
  a = random(150);
  diam = random(90);
  

  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 23){
       state = 0;
       background(255);
    } 
 
  }
  fill(100,0,0);
  diam = state * 20;
  ellipse(width/2,height/2,diam,diam);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 23){
       state = 0;
       background(255);
    } 
 
  }
  fill(155,0,0);
  diam = state * 20;
  ellipse(width/2,height/2,diam,diam);
}


