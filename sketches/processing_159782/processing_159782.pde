
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
  count = 0;
  state = 0;
  
  size(1000,1000);
  background(255);
  smooth();    
  noStroke();
}

void draw() {
  r = 0;
  g = random(255);
  b = random(255);
  a = 1;
  x = random(width);
  y = random(height);
 

  count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 10){
       state = 0;
       background(255);
    } 
 
  }
  if(state == 1){
  a = state * 10;
  fill(r,g,b,a);
  diam = state * 30;
  rect(x,y,diam,diam);
  }
   else if(state == 3){
  a = state * 10;
  fill(r,g,b,a);
  diam = state * 30;
  rect(x,y,diam,diam);
  }
   else if(state == 5){
  a = state * 10;
  fill(r,g,b,a);
  diam = state * 30;
  rect(x,y,diam,diam);
  }
   else if(state == 7){
  a = state * 10;
  fill(r,g,b,a);
  diam = state * 30;
  rect(x,y,diam,diam);
  }
   else if(state == 9){
  a = state * 10;
  fill(r,g,b, a);
  diam = state * 30;
  rect(x,y,diam,diam);
  }
  else{
  a = state * 20;
  fill(0,g/5,b, a);
  diam = state * 30;
  ellipse(x,y,diam,diam);
  }
}


