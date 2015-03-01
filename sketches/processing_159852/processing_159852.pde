
float r;
float g; 
float b; 
float a; 

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

  count = count + 1;
  if(count > 30){
    count = 0;
    state = state + 1;
    if(state > 8){
       state = 0;
       background(255);
    } 
 
  }
  fill(r,g,b, a);
  noStroke();
  diam = state * 20;
  ellipse(width/2,height/2,diam,diam);
}


