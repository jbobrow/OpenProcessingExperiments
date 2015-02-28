
//Pvector middle
//Owaun Scantlebury
//August 3rd 2011


//main

int w = 255;
int h = 255;

public boolean forward = true;
public boolean up = false;


int pNum = 13;
public PVector []  px = new PVector [pNum];



void setup(){
  size(255,255,JAVA2D); 
  for (int i =0;i<pNum;i++){
    direction[i]=new PVector(1,0,0);
    px[i] = new PVector(random(width),random(height),0);
    velocity[i]=int(random(5));
  }
}
int [] velocity = new int [pNum];
void draw(){
  background(-1);
 fill(255);
  for (int i=0;i<pNum;i++){
    bounce(true,velocity[i],1,1,i);
    ellipse(px[i].x,px[i].y,10,10); 
  }
  now = midv(px);
  fill(255,0,0);
  ellipse(now.x,now.y,10,10);
}


// PVector (forward ==1|| !forward = 0, up == 1 || !up ==0);
PVector direction [] = new PVector[pNum]; //(1,0,0);

PVector midv(PVector [] paw){
  float totx=0;
  float toty=0;
  float totz=0;
  float by  =paw.length;
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
