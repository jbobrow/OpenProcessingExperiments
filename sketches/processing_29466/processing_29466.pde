
//Vertical Random Pattern
//Owaun Scantlebury
//May 26th 2011
int wd =256;
int ht = 256;
int rectwidth = 10;
int sectwidth=rectwidth ;
PImage a = createImage(int(wd/rectwidth)+1,int(ht/rectwidth)+1,ARGB);
float cthru = 33;
void setup(){
  size(256,256);
  color paw = color(random(255),random(255),random(255),cthru);
  for (int x=0;x<a.pixels.length;x++){
    if(x%int(random(2,10))==0)paw = color(random(255),random(255),random(255),cthru);
    a.pixels[x]= paw;
  }
  smooth();
  background(-1);  
  makepoints(karl,-10,10);
  stroke(1);
  boolean vuhint =false;
  if (vuhint){
    for (int x=0;x<wd;x+=sectwidth){
      int place = int(x/sectwidth);
      println(karl[place]);
      float y= karl[place];
      //y=(ht/2)+y;
      line(x,ht/2-y,lx,ht/2-ly);
      lx=x;
      ly=y;
    }
  }
  stroke(random(255),random(255),random(255),cthru);
}
float by=1;
float downy=0;
void draw(){
  // stroke(1,11);
  downy+=by;

  for (int x=0;x<wd;x+=sectwidth){
    int place = int(x/sectwidth);

    float y= karl[place];
    stroke(a.get(int((downy-y))/rectwidth,int(x/rectwidth)));    
    //y=(ht/2)+y;
    if(lx>0 && x>0 && x<wd && lx<wd)line(x,downy-y,lx,downy-ly);
    stroke(1,11);    
    //y=(ht/2)+y;
    if(lx>0 && x>0 && x<wd && lx<wd)line(x,downy-y,lx,downy-ly);

    lx=x;
    ly=y;

    if(downy>ht){
      downy=0;
      stroke(random(255),random(255),random(255),cthru);
    }
  }

}

float lx;
float ly;
void makepoints( float [] pass,float lo,float hi){

  for (int x=0;x<pass.length;x++){
    pass[x]=random(lo,hi); 

  }
}

public float [] karl= new float[int(wd/sectwidth)+2];




