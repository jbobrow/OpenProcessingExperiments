
//Red Yellow filter



float x=255;
float y=255;
float chngx=1;
float chngy=1;
int r=225;
int g=150;
int b=50;
int thick=3;
float chngr=0.1;
float chngg=0.2;
float chngb=-0.1;
float sze=0.1;
float chnge=0.1;


void setup() {
  size(510,520);
  smooth();
  strokeJoin(ROUND);
}

void draw() {
  background(0);
  thick=3;
  float chngx=1;
  
  //int r=225;
  //int g=128;
  //int b=225;
  
  for(int p=255; p<510; p+=chngx) {  // Loop for concentric circles
  
  for(int deg=random(9,36); deg<chngy+360; deg+=random(9,36)) { // Loop for circles round radius
  float angle=radians(deg);
  float x=random(0.5,2)+255+(cos(angle)*(p-255));
  float y=random(0.5,2)+255+((sin(angle)*(p-255))/2);  
  noStroke();
   if(mousePressed==true) {
    fill(250,p/2,p/20,(510-p));
   } else {
    fill(255,0,p/20,(510-p));
   }
  ellipse(x,y,thick+sze,thick+sze);
 
  r+=chngr;
  if((r<1) || (r>254)) {
     chngr=chngr*-1;
     r+=chngr;
   } 
  
  }
  
  chngx+=10;
  thick++;
  
  sze+=chnge;
  
  if ((sze<0.1) || (sze>60)) {
    chnge=chnge*-1;
  }
  
  }
  
  
  
  g+=chngg;
   if((g<1) || (g>254)) {
     chngg=chngg*-1;
     g+=chngg;
   }
   
  b+=chngb;
   if((b<1) || (b>254)) {
     chngb=chngb*-1;
     b+=chngb;
   } 
  
 chngy++;
 if (chngy>360) {
   chngy=random(9,36);
 }
  
}
