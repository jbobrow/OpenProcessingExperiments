
float r;
float g;
float b;
float a;
float x;
float y;

float diam;
int count;
int state;

void setup() {
  count = 0;
  state = 0;
  
  size(500,500);
  background(255);
  smooth();    
}

void draw() {

  count++;
  if(count > 1){
    count = 0;
    state++;
    if(state > 25){
       state = 0;
       r=random(255);
       g=random(255);
       b=random(255);
       a=random(255);
       x=random(width);
       y=random(height);
       
    }
  }
       noStroke();
       fill(r,g,b,a);
       diam = state + x + y;
       ellipse(x,y,diam,diam); 
}
