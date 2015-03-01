
// Dandelion touch
// Gary Green 2014

float [] x1=new float [10]; // centre x point of circle
float [] x2=new float [10]; // x point on edge
float [] y1=new float [10]; // y point centre
float [] y2=new float [10]; // y point edge
float [] chngx = new float[10];
float [] chngy = new float[10];

int r=255;
int g=255;
int b=255;
int deg=6;
int thick=3;
float sze=60; // circle size
float csze=1; // change in circle size
float trn=255;

// SETUP

void setup() {
  for (a=0; a<6; a++) {
   x1[a]=random(50,460); // assign x,y
   x2[a]=x1[a]+30;
   y1[a]=random(50,460);
   y2[a]=y1[a]+30;
   int rn=int(random(0,2));
    if(rn==0) { chngx[a]=-2; } else {chngx[a]=2; }
   int rn=int(random(0,2));
    if(rn==0) { chngy[a]=-2; } else {chngy[a]=2; }
}
  // Calculate random background color based on mouse and rgb limits
  
  r=180+random(0,50);
  g=110+random(0,50);
  b=60+random(0,100);
  
   size(510,510);
  background(r,g,b);
 
  smooth();
  strokeCap(ROUND);
}

// DRAW LOOP

void draw() {
    
  //move circle centre x1 & y1
  
  for(a=0; a<6; a++) {
  
  x1[a]+=chngx[a];
  if ((x1[a]<20) || (x1[a]>490)) {
    chngx[a]=chngx[a]*-1.01;
  }
  
  y1[a]+=chngy[a];
  if ((y1[a]<20) || (y1[a]>490)) {
    chngy[a]=chngy[a]*-1.01;
  }
  
  // Change radius of circle
  
  sze+=csze;
  if((sze<60) || (sze>140)) {
    csze=csze*-1;
  }
  
  //Calculate x,y point on circle edge
  
  deg+=9;
  if(deg>360) {
    deg=0;
  }
  
  float angle=radians(deg);
  x2[a]=x1[a]+(cos(angle)*sze);
  y2[a]=y1[a]+(sin(angle)*sze);
  strokeWeight(random(1,3));  
  stroke(random(210,255),random(210,255),random(210,255),trn);
  line(x1[a],y1[a],x2[a],y2[a]);
 
  }
  
 //change transparency
 
  trn+=0.3;
  if(trn>200) {
    trn=1;
    r=180+random(0,50); // change background if almost opaque
    g=110+random(0,50);
    b=60+random(0,100);
    background(r,g,b);
  }
    
  
}
