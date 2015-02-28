
float sin108=sin(2*PI*108/360);
float cos108=cos(2*PI*108/360);
float rad108=radians(108);

float sin36=sin(2*PI*36/360);
float cos36=cos(2*PI*36/360);
float rad36=radians(36);

float ln;
int c01=0;
int[] tt=new int[2];
BorderA b01=new BorderA();
TriangA t01=new TriangA();
TriangA t02=new TriangA();

void setup(){
  size (400,400);
  ln=40;
}

void draw(){                

}

void mousePressed(){
  BorderA b01=new BorderA();
  if (c01==0){
    background(180);
    float xw=width/2; float yw=height/2;
    float r=random(2*PI);
    int tb;
    if (random(2)>1) {tb=1;} else {tb=0;}
    b01=new BorderA((xw+360*cos(r)),(yw+360*sin(r)),(xw-360*cos(r)),(yw-360*sin(r)),tb);
    r= random(6);
    if (r<1) {tt[0]=0;tt[1]=1;} else if ((r<3) && (tb==1)) {tt[0]=0;tt[1]=2;}
    else if ((r<3) && (tb==0)) {tt[0]=0;tt[1]=3;}
    else if ((r<4) && (tb==0)) {tt[0]=1;tt[1]=2;}
    else if ((r<3) && (tb==1)) {tt[0]=1;tt[1]=3;}
    else {tt[0]=2;tt[1]=3;}
    
    t01=new TriangA(b01,tt[0]);
    t02=new TriangA(b01,tt[1]);
  }

  t01.subT(c01);
  t02.subT(c01);
  if (c01<=9){c01=c01+1;} else {c01=0;}
}

