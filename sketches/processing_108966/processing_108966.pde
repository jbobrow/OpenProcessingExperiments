
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
float countx;
float county;
float state;

float hiRange;
float midRange;
float loRange;

void setup() {
  size(400,200);
  background(255);
  smooth();
  countx = 0; 
  county = 0;
  state = 1; 
  hiRange = random(100,255);
  midRange = random(50,200);
  loRange = random(0,100);
  frameRate(10);
}

void draw() {

  county++;
  if (county == 10){
  countx++;
  county = 0;
  }
  if (countx == 20){
    countx = 0;
  }
  
  //Changes dot color to red
  if(state == 1){
    r = hiRange;
    g = loRange;
    b = loRange;
    a = random(255);
  }else if(state == 2){
    r = hiRange;
    g = midRange;
    b = loRange;
    a = random(255);
  }else if(state == 3){
    r = hiRange;
    g = hiRange;
    b = loRange;
    a = random(255);
  }else if(state == 4){
    r = midRange;
    g = hiRange;
    b = loRange;
    a = random(255);
  }else if(state == 5){
    r = loRange;
    g = hiRange;
    b = hiRange;
    a = random(255);
  }else if(state == 6){
    r = midRange;
    g = loRange;
    b = hiRange;
    a = random(255);
  }
    
  diam = (20);
  x = int(countx)*diam+10;
  y = int(county)*diam+10;
 
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  
}

void mousePressed(){
  if (mousePressed = true){
  state++;
  }
  if(state > 6){
    state = 1;
  }
}


