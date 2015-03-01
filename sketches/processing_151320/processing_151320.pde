
// Sprouts
// Code with explanation

// speed of noise spave traversing
float rad = 0.03;
PVector tr, vel;
float ang = 0;
float n;
float x,y;
// width of sprout's bottom
float w=5;
int alpha=10;

void setup() {
  size(500,500);
  background(29,36,27);
  noStroke();
  smooth();
  init();
}

// init sprout
void init() {
   // position in the noise space
   tr = new PVector(random(0,1), random(0,1), random(0,1));
   // speed of noise space traverse
   vel = new PVector(random(-rad,rad),random(-rad,rad),random(-rad,rad));
   // initial angle (up)
   ang = 0;
   // initial sprout position
   y=1;
   x=random(0,width-100)+50;
   // convolution factor, changes range of the noise
   n = random(0.35,0.6);
   // every 5 sprouts blur image
   if(alpha%50==0) filter(BLUR,2);
}

void draw() {
 
 if(alpha<255) {
  // draw sprouts progressively (from darkest to brightest)
  fill(170,254,1,alpha);
  
  // speed up a little bit, draw five points every frame
  for(int i=0;i<5;i++) { 
    // since we keep current translating/rotate in x,y and ang reset position to initial
    pushMatrix();
    // key part here: take change of the angle from noise space, use 'n' to choose which direction will be preffered to have more left or more right convolution
    ang += (noise(tr.x,tr.y,tr.z)-n)*0.9;
    // change the noise space coordinates
    tr.add(vel);
    // set drawing position
    translate(x,height-y);
    // rotate plane
    rotate(ang);
    // get new x, wrap drawing window
    x+=cos(ang);
     if(x<0) x=width-1;
     if(x>=width) x=0;
    // get new y and keep moving up (+0.55)
    y+=sin(ang)+0.55;
    // draw point, thicker at beginning, thinner at the end
    ellipse(0,0,w*((height-y)/height),2);
    // restore start position
    popMatrix();
  }
   
  // if sprout is done 
  if(y>height) {
    // next will be more visible
    alpha+=10;
    // do not init last sprout (avoid accidental blur)
    if(alpha<255) init();
  }
 }
}

void mouseClicked() {
    background(29,36,27);
    alpha = 10;
    init();
}
