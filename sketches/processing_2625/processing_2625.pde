
float mix(float p,float a,float b){ return a*(1.0-p)+p*b; }

int W=1920;
int H=1100;

float dt=1.0;
float a[],b[],c[];
float vzoom;
PImage failboat;
float failboatX;

void setup(){
  size(900,600,P2D);
  failboat=loadImage("titanic.gif");
  W=width;
  H=height;
  a=new float[W];
  b=new float[W];
  vzoom=1f*H/3;
  failboatX=0.40f*W;
  //for(int i=0;i<W;i++) a[i]=mix(1f*i/W,-1f,+1f);
  //for(int i=0;i<W;i++) b[i]=mix(1f*i/W,-1f,+1f);

  makeWaterBar(  0,200,-1f);
  makeWaterBar(W-1,200,+1f);
  makeWaterBar(W-100,50,1f);
}

int p=0;
void draw(){
  background(255);
  for(int i=0+2;i<W-2;i++){
    float v=(
      +(a[i-1]+a[i+1])
      -b[i]
    );
    b[i]=v-v/1000;
  }
  c=a; a=b; b=c;

  smooth();
  drawFailboat();
  stroke(255,0,0);
  for(int i=p;i<W-2;i+=2){
    line(i  ,H/2-a[i  ]*vzoom
        ,i+2,H/2-a[i+2]*vzoom);
  }
  p=1-p;
  stroke(0,0,255);
  for(int i=p;i<W-2;i+=2){
    line(i  ,H/2-a[i  ]*vzoom
        ,i+2,H/2-a[i+2]*vzoom);
  }
}

void drawFailboat(){
  pushMatrix();
  int AW=failboat.width/3*2;
  float LA=avg(a,round(failboatX-AW/2),failboat.width/4,-10)*vzoom;
  float RA=avg(a,round(failboatX+AW/2),failboat.width/4,+10)*vzoom;
  float TA=avg(a,round(failboatX     ),failboat.width/2, 0)*vzoom;
  
  float rot=atan((RA-LA)/AW);
  failboatX-=rot*5;
  failboatX=constrain(failboatX,0-failboat.width/2,(W-1)+failboat.width/2);

  translate(constrain(failboatX,0+50,(W-1)-50) ,H/2-TA);
  rotate(-rot);
  image(failboat,0-failboat.width/2,-260);
  
  popMatrix();
}

float avg(float a[], int C, int R, int correction){
  float r=0f;
  int L=constrain(C-R-correction,0,a.length-1)+correction;
  int H=constrain(C+R-correction,0,a.length-1)+correction;
      L=constrain(L,0,a.length-1);
      H=constrain(H,0,a.length-1);
  for(int i=L;i<=H;i++) r+=a[i];
  return r/(H-L+1);
}

void makeWaterBar(int x, int bw, float y){
  for(int i=0;i<W;i++){
    if((i<=x+bw)&&(i>=x-bw)){
      a[i]=y;
      b[i]=y;
    }
  }
}

void mouseMoved(){}
void mousePressed(){
  makeWaterBar(mouseX,50,(H/2-mouseY)/vzoom);
  makeWaterBar(mouseX,50,(H/2-mouseY)/vzoom);
}


