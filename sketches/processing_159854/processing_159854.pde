
float r;
float g;
float b;
float a;
 
float diam;
float x;
float y;
 
int count;
int state;
 
PFont f;
 void setup() {
  count = 0;
  state = 0;
  
  f = loadFont ("AdobeHebrew-BoldItalic-12.vlw");
  size(200,200);
  background(255);
  smooth();    
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  
   textAlign(CENTER);
  textFont(f,10);
  fill(0);
  text("Sunday", width/2, 25);
  fill(0,0,255);
  text("By the Blue", width/2, 50);
  fill(125,0,125);
  text("Purple", width/2, 75);
  fill(255,255,0);
  text("Yellow", width/2, 100);
  fill(255,0,0);
  text("Red", width/2, 125);
  fill(0,125,125);
  text("Water...", width/2, 150);
  
   count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       background(255);
    } 
  
  // Use values to draw an ellipse
  }
  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,diam,diam);
}



