
float diam;
float r; 
float g;
float b;
float a;

int count;
int state;

float x;
float y;

void setup() {
  count = 0;
  state = 0;
  
  size(400,400);
  background(255);
  smooth();    
}

void draw() {

  r = random(255);
  g = random(255);
  b = random(255);
  a = 45;
  diam = 30;
  x = random(width);
  y = random(height);
  
  noStroke();
  fill (r,g,b,a);
  ellipse(x,y,diam,diam);
  
  

  count++;
  if(count > 50){
    count = 0;
    state++;
    if(state > 5){
       state = 0;
       background(random(255),random(255),random(255));
    } 
 
  }

fill(r,g,b,a);
diam = state * 20;
  ellipse(width/2,height/2,diam,diam);
}


