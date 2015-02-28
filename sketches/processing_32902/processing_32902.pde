
//Pvector middle  v2
//Owaun Scantlebury
//August 5th 2011


//main

int w = 255;
int h = 255;

public boolean forward = true;
public boolean up = false;


int pNum = 33;
int doNum =33;
PVector [] pick = new PVector [4];
public PVector []  px = new PVector [pNum];



void setup(){
  //  pick[0]=new PVector (1,0,0);
  //  pick[1]=new PVector (0,0,0);
  //  pick[2]=new PVector (0,1,0);
  //  pick[3]=new PVector (1,1,0);
  pick[0]=new PVector (1,0,0); //ok
  pick[1]=new PVector (0,0,0); //
  pick[2]=new PVector (1,0,0); //ok
  pick[3]=new PVector (1,0,0);
  size(255,255);
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
    px[i] = new PVector(random(width),random(height),0);
    }
    velocity[i]=int(random(5));
  }
 

}
int [] velocity = new int [pNum];
void draw(){
  background(-1);
  fill(255);
  for (int i=0;i<doNum;i++){
    bounce(true,velocity[i],1,velocity[i],i);
    if (i<4)fill(0,255,0);
    if (i>3)fill(255);
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

