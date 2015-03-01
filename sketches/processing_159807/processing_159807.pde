
// Example 4-7: Filling variables with random values

float e;
float g;
float b;
float a;

float diam;
float x;
float y;
float t;
float p;

int count;
int state;
int cx = 250;
int cy = 250;
int r =100;



void setup() {
  size(600,600);
  background(125);
  count = 0;
  state = 2;
  p=0;
  //rectMode(TOP);
  ellipseMode(LEFT);
  smooth();    
}

void draw() {
  e = random(20);
  g = random(25);
  b = random(255);
  a = random(255);
  //diam = random(20);
  x = random(width);
  y = random(height);
  
  //noStroke();
  fill(e,g,b,a);
  diam = state * 2;
  //ellipse(width/2,height/2,diam,diam);
  
  noStroke();
  fill(e,g,b,a);
  ellipse(x,y,diam,diam);
     count++;
  if(count > 65){
    count = 0;
    state++;
    if(state > 150){
       state = 1;
       background(150);
     }
   }
      
  float t = millis()/1000.0f;
  int x = (int)(cx+r*cos(t));
  int y = (int)(cy+r*sin(t));
  
  p = state * 2.1;
  pushMatrix();
  fill(0,220,0,100);
  translate(x,y);
  rotate(t*10);
  rect(10,10,p,p);
  popMatrix();


}




