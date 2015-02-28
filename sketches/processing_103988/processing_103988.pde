
int r=20;
int cx1,cx2,cx3,cx4,cx5,cx6,cx7,cy1,cy2,cy3,cy4,cy5,cy6,cy7, s0, n;
int [][] expiration = new int[3][7];

void setup() {  //setup function called initially, only once
  size(120, 120);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  ellipseMode(RADIUS);
  smooth();
  noStroke();
  
  
  for (int c=0; c<6; c++) {
  expiration[0][c]=c+1;
  }
  
  fill(random(360),255,255);
  cx1=r;
  expiration [1][0]=cx1;
  cy1=int(r+sqrt(3*sq(r)));
  expiration [2][0]=cy1;
  ellipse(r, int(r+sqrt(3*sq(r))), r-1, r-1);
  
  fill(random(360),255,255);
  cx2=2*r;
  expiration [1][1]=cx2;
  cy2=r;
  expiration [2][1]=cy2;
  ellipse(2*r, r, r-1, r-1);
  
  fill(random(360),255,255);
  cx3=4*r;
  expiration [1][2]=cx3;
  cy3=r;
  expiration [2][2]=cy3;
  ellipse(4*r, r, r-1, r-1);
  
  fill(random(360),255,255);
  cx4=5*r;
  expiration [1][3]=cx4;
  cy4=int(r+sqrt(3*sq(r)));
  expiration [2][3]=cy4;
  ellipse(5*r, int(r+sqrt(3*sq(r))), r-1, r-1);
  
  fill(random(360),255,255);
  cx5=4*r;
  expiration [1][4]=cx5;
  cy5=int(r+2*sqrt(3*sq(r)));
  expiration [2][4]=cy5;
  ellipse(4*r, int(r+2*sqrt(3*sq(r))), r-1, r-1);
  
  fill(random(360),255,255);
  cx6=2*r;
  expiration [1][5]=cx6;
  cy6=int(r+2*sqrt(3*sq(r)));
  expiration [2][5]=cy6;
  ellipse(2*r, int(r+2*sqrt(3*sq(r))), r-1, r-1);
  
  fill(random(360),255,255);
  cx7=3*r;
  expiration [1][6]=cx7;
  cy7=int(r+sqrt(3*sq(r)));
  expiration [2][6]=cy7;
  ellipse(3*r, int(r+sqrt(3*sq(r))), r-1, r-1); 
  n=0;
  s0=second();
}

void draw() {  //draw function loops 
  int s=second();
  
  if (s!=s0) {
  fill(255);
  smooth();
  noStroke();
  ellipse(expiration[1][n], expiration[2][n], r, r);   
  n=n+1;
  s0=s;
  }
}
