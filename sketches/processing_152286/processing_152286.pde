
//Open petal
//Gary Green 2014



float x=255;
float y=255;
float chngx=1;
float chngy=1;
int r=220;
int g=50;
int b=50;
int thick=3;
float chngr=-1;
float chngg=1;
float chngb=-2;
float sze=0.1;
float chnge=0.1;


void setup() {
  size(510,520);
  smooth();
  //strokeJoin(ROUND);
}

void draw() {
  background(0);
 // strokeWeight(2);
  thick=10;
  float chngx=1;
  
  //int r=225;
  //int g=128;
  //int b=225;
  
  int r=120;
  
  for(int p=255; p<510; p+=chngx) {  // Loop for concentric circles
  
  for(int deg=chngy; deg<chngy+360; deg+=18) { // Loop for circles round radius
  float angle=radians(deg);
  float x=255+(cos(angle)*(p-255));
  float y=255+(sin(angle)*(p-255));  
  stroke(r,255,255,510-p);
  fill(r,p/10,b,510-p);
  ellipse(x,y,thick+sze,thick+sze);
 
   }
   
    r+=chngr;
  if((r<1) || (r>150)) {
     chngr=chngr*-1;
     r+=chngr;
   } 
  
  chngx+=10;
  thick+=7;
  
  sze+=chnge;
  
  if ((sze<0.1) || (sze>80)) {
    chnge=chnge*-1;
  }
  
  }
  
  
  
  g+=chngg;
   if((g<1) || (g>250)) {
     chngg=chngg*-1;
     g+=chngg;
   }
   
  b+=chngb;
   if((b<1) || (b>250)) {
     chngb=chngb*-1;
     b+=chngb;
   } 
  
 chngy+=2;
 if (chngy>360) {
   chngy=0;
 }
  
}
