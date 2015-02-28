
//Owaun Scantlebury
//August 10th 2011
//Tear Drop
 
 
//main
 
int w = 155;
int h = 155;
 
public boolean forward = true;
public boolean up = false;
 
PImage src ;
int pNum = 33;
int doNum =33;
PVector [] pick = new PVector [4];
public PVector []  px = new PVector [pNum];
 
 
PImage a;
PImage b;
void setup(){
  src = loadImage("c:\\data\\newc3.png");
 
  //  pick[0]=new PVector (1,0,0);
  //  pick[1]=new PVector (0,0,0);
  //  pick[2]=new PVector (0,1,0);
  //  pick[3]=new PVector (1,1,0);
  pick[0]=new PVector (1,0,0); //ok
  pick[1]=new PVector (0,0,0); //
  pick[2]=new PVector (1,0,0); //ok
  pick[3]=new PVector (1,0,0);
  size(155,155);
  direction[0]=pick[0];
  direction[1]=pick[1];
  direction[2]=pick[2];
  direction[3]=pick[3];
  px[0]=new PVector (0,0,0);
  px[1]=new PVector (width,0,0);
  px[2]=new PVector (width,height,0);
  px[3]=new PVector (0,height,0);
  velocity [1]= int(random(5));
  velocity [2]= int(random(5));
  velocity [3]= int(random(5));
  for (int i =4;i<pNum;i++){
    if(i>3){
      direction[i]=new PVector(1,0,0);
      px[i] = new PVector(random(w),random(h),0);
    }
    velocity[i]=int(random(5));
  }
 
  a= createImage(w,h,ARGB);
  b= createImage(w,h,ARGB);
  src= createImage(w,h,ARGB);
  // for (int x =0;x<w;x++){
  //   for (int y =0;y<h;y++){
  //    
  //    if(x>0 && y>0)src.set(x,y,color(x%y,x/y,height-y));
  //   }
  // }
  src.resize(w,h);
  frameRate(3000);
}
int [] velocity = new int [pNum];
int _x;
int _y;
void draw(){
  //background(-1);
  image(a,0,0);
  fill(-1,11);
  rect(0,0,w,h);
  //fastBlur();
 
  noStroke();
  fill(255,11);
  for (int i=0;i<doNum;i++){
    bounce(true,velocity[i],1,velocity[i],i);
    //if (i<4)fill(0,255,0);
    _x = int(px[i].x);
    _y = int(px[i].y);
    // if (i>3)fill(src.get(_x,_y));
    ellipse(px[i].x,px[i].y,10,10);
  }
  now = midv(px);
  fill(255,0,0);
  _x = int(now.x);
  _y = int(now.y);
  fill(src.get(_x,_y),10);
  // fill(random(255),random(255),random(255),12);
  ellipse(now.x,now.y,50,50);
  // a.copy(g,0,0,w,h,0,0,w,h);
  a=get(0,0,w,h);
  //a.filter(BLUR);
// a.get();
 fastBlur(a);
 
}
 
 
// PVector (forward ==1|| !forward = 0, up == 1 || !up ==0);
PVector direction [] = new PVector[pNum]; //(1,0,0);
 
PVector midv(PVector [] paw){
  float totx=0;
  float toty=0;
  float totz=0;
  float by  =doNum;
  //paw.length;
  for (int i=0;i<by;i++){
    totx=totx+paw[i].x;
    toty=toty+paw[i].y;
    totz=totz+paw[i].z;
  }
  PVector retval = new PVector(totx/by,toty/by,totz/by);
  return retval;
}
PVector now ;
 
 
//Bounce
void bounce(boolean rnd, int by, int lo, int hi,int val){
  if ( direction[val].x==1){
    if (rnd)px[val].x+=random(lo,hi);
    if (!rnd){
      px[val].x+=by;
    }
  }
 
 
  if ( direction[val].x==0){
    if(rnd)px[val].x-=random(lo,hi);
    if (!rnd){
      px[val].x-=by;
    }
  }
 
  if (direction[val].y == 1 ){
    if (rnd)px[val].y-=random(lo,hi*2);
    if (!rnd){
      px[val].y+=by;
    }
  }
 
  if ( direction[val].y ==0){
    if(rnd)px[val].y+=random(lo,hi*2);
    if (!rnd){
      px[val].y-=by;
    }
 
  }
 
 
 
 
  if (px[val].x>width)
  {
 
 
    direction[val].x=0;
 
  }
 
 
  if (px[val].x<0)   {
    direction[val].x=1;
    // forward = true;
  }
  if (px[val].y>height){
    direction[val].y = 1;
    // up     = true;
  }
  if (px[val].y<0     ){
    direction[val].y = 0;
    // up     = false;
  }
 
}
 
 
/*
Fast: 40 times faster than filter(BLUR,1);
 Small: Available only in 1 pixel radius
 Shitty: Rounding errors make image dark soon
 What happens:
 11111100 11111100 11111100 11111100 = mask
 AAAAAAAA RRRRRRRR GGGGGGGG BBBBBBBB = PImage.pixel[i]
 AAAAAA00 RRRRRR00 GGGGGG00 BBBBBB00 = masked pixel
 AA AAAAAARR RRRRRRGG GGGGGGBB BBBBBB00 = sum of four masked pixel, alpha overflows, who cares
 00AAAAAA RRRRRRRR GGGGGGGG BBBBBBBB 00 = shift results to right -> broken alpha, good RGB (rounded down) averages
 */
void fastBlur(PImage a){ //a=src, b=dest img
  a.loadPixels();
    int pa[]= new int[a.pixels.length];
  int pb[]= new int[b.pixels.length];
  for (int x=0;x<pa.length;x++){
  pa[x]=a.pixels[x];
  pb[x]=b.pixels[x];
  
  }
  
  int h=height;
  int w=width;
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  
  
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pa[i]=(
      ( (pa[i-w]&mask) // sum of neighbours only, center pixel ignored
      +(pa[i+w]&mask)
        +(pa[i-1]&mask)
        +(pa[i+1]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
  for (int x=0;x<pb.length;x++){
// pa[x]=a.pixels[x];
a.pixels[x]=pa[x];
  
  }
  a.updatePixels();
   image(a,0,0);
}               
