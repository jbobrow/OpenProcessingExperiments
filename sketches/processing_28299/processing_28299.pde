
int[]xl={10,15,40,90,95};
  int[]xr={80,30,90,15,50};
  int[]yt={20,40,45,70,85};
  int[]yb={40,70,20,60,35};
  int[]c={0,0,0,0,0};
  
  int directiona=1;
  int directionb=-1;
  int directiond=1;
  int directione=-1;
  int directionc=1;
  int sw=1;

void setup() {
  size(200,200);
  strokeWeight(5);
  smooth();
    
}

void draw(){
  background(0);
  
 for(int i=0;i<xl.length;i++){
    
    
    c[i]+=directionc;
    
    if(c[i]>250){
      directionc=-1;
    }
    
    if(c[i]<1){
      directionc=1;
    }
    
    xl[i]+=directiona;
    
    if(xl[i]>150){
      directiona=-1;
    }
    
    if(xl[i]<50){
      directiona=1;
    }
    
    
    xr[i]+=directionb;
    
    if(xr[i]>150){
      directionb=-1;
    }
    
    if(xr[i]<50){
      directionb=1;
    }
    
    yt[i]+=directiond;
    
    if(yt[i]>150){
      directiond=-1;
    }
    
    if(yt[i]<50){
      directiond=1;
    }
    
    yb[i]+=directione;
    
    if(yb[i]>150){
      directione=-1;
    }
    
    if(yb[i]<50){
      directione=1;
    }
    
    
    stroke(c[i],yb[i],xl[i]);
    line(50+xl[i],50,50+xr[i],150);
    line(50,50+yt[i],150,50+yb[i]);
  }
}

