
int numElem=10;
myArc[] myArcs=new myArc [numElem];
myArc[] myArcs2=new myArc [numElem];

color bg=#202020;
color[] palette={#322536,#8D2B38,#E53448,#FC6C63,#EFD79B};
float org_x,org_y,diam,a;

void setup(){
  size(300,300);
  background(bg);
  noFill();
  strokeCap(SQUARE);
  
  org_x=width/2;
  org_y=height/2;
  float end=0;
  float start=0;
  float theta=0;
  
  for(int i=0;i<numElem;i++){
    color s=palette[i%palette.length];
    start=end;
    end=start+TAU/numElem;
    myArcs[i]=new myArc(s,start,end,theta,1);
    myArcs2[i]=new myArc(s,start,end,theta,2);
    theta+=TAU/numElem;
  }
}
void draw(){
  background(bg);
  for(int i=0;i<numElem;i++){
    myArcs[i].run();
    myArcs2[i].run();
  }
}
class myArc{
  float start,end,theta,sw,a;
  color s;
  int type;
  
  myArc(color _s, float _start,float _end, float _theta, int _type){
    s=_s;
    start=_start;
    end=_end+radians(.9);
    theta=_theta;
    type=_type;
  }
  void run(){
    move();
    display();
  }
  void move(){
    sw=map((sin(theta*2)),-1,1,-10,60);
    if (type==1){
      diam=width*.2;
      theta+=0.0523*1;
    }
    else if(type==2){
      diam=width*.7;
      theta-=0.0523*1.5;
    }
  }
  void display(){
    if(sw<1){
      sw=1;
      a=0;
    }else{
      a=255;
    }
      stroke(s,a);
      strokeWeight(sw);
      arc(org_x,org_y,diam,diam,start,end);
  }
}


