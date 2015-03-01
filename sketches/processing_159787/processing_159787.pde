
float diam;
int count;
int state;

void setup() {
  count = 0;
  state = 0;
  
  size(800,800);
  smooth();
  noStroke();  
}

void draw() {

  float a = random(255);
  float bkgR = random(255);
  float bkgG = random(255);
  float bkgB = random(255);
  
  float x = random(width);
  float y = random(height);
  
  count++;
  if(count > 20){
    count = 0;
    state++;
    if(state > 15){
       state = 0;
       background(bkgR,bkgG,bkgB);
    }
 
  }
  
  fill(0,0,0,a);
  diam = state * 5;
  ellipse(x,y,diam,diam);
  ellipse(x-20,y-20,diam,diam);
  ellipse(x+20,y-20,diam,diam);
}


