
int wd = 255;
int ht = 255;

void setup(){
 size(wd,ht);
 float xm = wd/2;
 float ym = ht/2;
for (int x=0;x<wd;x++){
 for (int y=0;y<ht;y++){
   float k = distx(x,y,xm,ym);
 float R = distx(x,y,0,0);
  float G = distx(x,y,wd-1,0);
  float B = distx(x,y,wd-1,ht-1);   
  float A = distx(x,y,0,ym-1);   
   //set(x,y,color(x,y,k));
   set(x,y,color(R,G,B,A));
   
 }
} 
  
}

//////////////

boolean fr = true;

PVector [] ka;

int _y1;
int _x1;
float distx(float ax,float b, float c,float d){

  if(fr){
//    wd = width;
//    ht = height;
    ka= new PVector [wd*ht];

    for (int i =0;i<wd*ht;i++){
      _y1 = int(i/wd);
      //ly = y;
      _x1  = i-(_y1*wd);
      float dis =dist(_x1,_y1,0,0);
//      float disR =dist(_x1,_y1,wd,0);
//      float disG =dist(_x1,_y1,wd,ht);
//      float disB =dist(_x1,_y1,0,ht);
      ka[i]=new PVector(dis,_x1,_y1);
    }
  }
  c =(c-ax);
  if (c<0)c=-c;
  d = (d-b);
  if (d<0)d=-d;

  ax=0;
  b=0;
  //    int dx=int(abs(c-ax));
  //    int dy=int(abs(d-b));
  //    c=c-dx;
  //    d=d-dy;
  float retval = 0;
  int pos = int(c)+wd*int(d);
  // retval = a.get(int(c),int(d))>>16&255;
  retval = ka[pos].x;
  fr = false;
  return retval;
}


//////////////////

