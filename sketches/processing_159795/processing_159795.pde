
int r;
int g;
int b;

float diam;
int x;
int y;
int count;
int state;

void setup() {
   count = 0;
  state = 8;
  size(600,600);
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();    
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = (int) random(200);
  g =(int) random(200);
  b = (int)random(200);
  diam = 60;
  x = (int) random(11);
  y = (int) random(11);
     
     
  if(( r < 50 ) && ( g < 50) && (b < 50)){
    diam = state * 16;
  }
  count = count + 1;
 if(count > 50){
    count = 12;
    state = state + 2;
    if(state > 35){
       state = 6;
    }
    if (state > 25 ) {
      fill(255);
     rect(width/2,height/2, state*18, state*18);
    }
 }
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b);
  ellipse(x*60,y*60,diam,diam);
}
