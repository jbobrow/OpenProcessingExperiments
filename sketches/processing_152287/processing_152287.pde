
//Rotate & jitter


float x=255;
float y=255;
float chngx=1;
float chngy=1;
int r=225;
int g=128;
int b=128;
int thick=3;
int chngg=1;
int chngb=-1;


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
  
  for(int p=255; p<510; p+=chngx) {
  
  for(int deg=chngy; deg<chngy+360; deg+=18) {
  float angle=radians(deg);
  float x=random(0.5,2)+255+(cos(angle)*(p-255));
  float y=random(0.5,2)+255+((sin(angle)*(p-255))/2);  
    //strokeWeight(thick);
  stroke(g,b,r,510-p);
  fill(r,g,b,510-p);
  ellipse(x,y,thick*3,thick*(random(2,4)));
  }
  
  chngx+=10;
  r+=10;
  thick++;
  
  }
  
g+=chngg;
   if((g<1) || (g>254)) {
     chngg=chngg*-1;
     g+=chngg;
   }
   
  b++;
   if((b<1) || (b>254)) {
     chngb=chngb*-1;
     b+=chngb;
   } 
  
 chngy++;
 if (chngy>360) {
   chngy=0;
 }
  
}
