
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 4-7: Filling variables with random values

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

int count;
int state;
int reset;

void setup() {
  size(600,600);
  background(255);
  smooth();    
  ellipseMode(CENTER);
  count = 0;
  state = 0;
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  //diam = 40;
  x = 20+40*int(random(15));
  y = 20+40*int(random(15));
  //altering the state once every 1/3 seconds
   count++;
  if(count >10){
    count = 0;
    state++;
    if(state > 10){
       state = 0;
       reset++;
       if(reset >4){
         reset = 0;
         // when the background resets, its color is based off of the mouse position. 
         background(int(mouseX*255/600),int(mouseY*255/600),int((mouseX+mouseY)*255/1200));
       }
    }
  }
  // Use values to draw an ellipse
 noStroke();
 fill(r,g,b,a);
 ellipse(x,y,diam,diam);
 diam = state* 4;
 
 //diagonal black to white; when it runs 5 times, the screen restarts; just remove the 
 /*fill(state*255/10);
 if (reset%2 ==0) {
 ellipse(state*60,state*60,reset*30,reset*30);
 } else {
   fill(state*255/10);
 ellipse(600-state*60,600-state*60,reset*30,reset*30);
 }
 */
}


