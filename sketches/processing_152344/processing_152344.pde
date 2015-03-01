
// Pastel touch
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

// Define pastel colours

color HotPink=color(255,105,180); // HotPink
color Violet=color(240,130,240); // Violet
color Fuchsia=color(255,0,255); // Fuchsia
color BlueViolet=color(140,45,225); // BlueViolet
color SlateBlue=color(105,90,205); // SlateBlue
color SkyBlue=color(135,235,205); // SkyBlue
color DarkViolet=color(150,0,210); // DarkViolet


// SETUP

void setup() {
  for (a=0; a<6; a++) {
   x1[a]=random(50,460); // assign x,y
   x2[a]=x1[a]+30;
   y1[a]=random(50,460);
   y2[a]=y1[a]+30;
   int rn=int(random(2));
    if(rn==0) { chngx[a]=-1; } else {chngx[a]=1; }
   int rn=int(random(2));
    if(rn==0) { chngy[a]=-1; } else {chngy[a]=1; }
    
}
  // Calculate random background color based on mouse and rgb limits
  
  r=180+random(0,50);
  g=110+random(0,50);
  b=60+random(0,100);
  
   size(510,510);
  background(r,g,b);
 
  smooth();
  noStroke();
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
  if((sze<30) || (sze>90)) {
    csze=csze*-1;
  }
  
  //Calculate x,y point on circle edge
  
  deg+=1;
  if(deg>360) {
    deg=0;
  }
  
  float angle=radians(deg);
  x2[a]=x1[a]+(cos(angle)*sze);
  y2[a]=y1[a]+(sin(angle)*sze);
  strokeWeight(random(2));

// Choose colour

  int col=int(random(0,7)); 
   
switch(col) {
  case 0: 
     fill(HotPink,trn); 
    break;
  case 1: 
    fill(Violet,trn);
    break;
  case 2: 
     fill(Fuchsia,trn); 
    break;
  case 3: 
    fill(BlueViolet,trn);
    break; 
  case 4: 
     fill(SlateBlue,trn); 
    break;
  case 5: 
    fill(SkyBlue,trn);
    break;  
  case 6:
    fill(DarkViolet,trn);
    break;
}

 ellipse(x2[a],y2[a],sze,sze);
 
  }
  
 //change transparency
 
  trn+=0.02;
  println(trn);
  if(trn>20) {
    trn=1;
    r=180+random(0,50); // change background if almost opaque
    g=110+random(0,50);
    b=60+random(0,100);
    background(r,g,b);
  }
    
  
}
