
// Spiral Galaxy Simulation
// author : Philippe Guglielmetti (Dr. Goulu www.goulu.net)
// 2008.04.03 PhG : my first processing program !
//                  converted from my LUA/Demoniak 3D demo V 1.0
//                  see http://3dmon.wordpress.com/2007/08/26/simulation-de-galaxie-spirale/
// 2008.04.04 PhG : much faster in P3D mode : now ok with 10'000 stars !
//                  keyboard interaction : use arrow keys to alter the galaxy

//import gifAnimation.*; // http://www.extrapixel.ch/processing/gifAnimation/

float gauss(float x){ return exp(-x*x/2.0) / sqrt(2*PI); }
float gaussI(float z){ // integrated gauss [0..1]
  if(z<-8.0) return 0.0;
  if(z> 8.0) return 1.0;
  float sum=0.0, term=z;
  for (int i=3; sum+term!=sum; i+=2){
    sum =sum+term;
    term=term*z*z/i;
  }
  return 0.5+sum*gauss(z);
}
float gaussE(float z){ return gaussI(z)*2-1; }// gauss error func==> [-1..0..1]
float randomGauss(){
 float x=0,y=0,r,c;
  do{ x=random(-1.0,1.0);
      y=random(-1.0,1.0);
      r=x*x+y*y;
  }while(r==0 || r>1);
  c=sqrt(-2.0*log(r)/r);
  return x*c; //return [x*c, y*c];
}
float randomGaussIn(float L, float H, float mul){ return constrain( randomGauss()*(H-L)*mul + (L+H)/2.0  ,L,H);  }
float randomGaussAt(float L, float H, float mul){ return            randomGauss()*(H-L)*mul + (L+H)/2.0;  }



int stars=1000; // only ...
int Rmax=150; // galaxy radius
float speed=0.02;  // rotation speed
float crossEye=1f;

// stars follow elliptic orbits around the center
//float eratio=.85; // ellipse ratio
//float etwist=8.0/Rmax; // twisting factor (orbit axes depend on radius)
float eratio=0.8;
float etwist=0.07;//rmax=200

float angle[]=new float[stars];
float radius[]=new float[stars];
float z[]=new float[stars];

float cx,cxL,cxR,cy; //center left,right,y

PImage img;

void setup(){
  size(int(Rmax*3*2), int(Rmax*2),P3D);
  background(0); // back to black
  speed=speed/frameRate;

  // begin in the center
  cx = width/2;
  cxL = width/4;
  cxR = width/4*3;
  cy = height/2;
  // itit stars
  for (int i=0; i< stars; i++){
    angle[i]= random(0,2*PI);
    radius[i]=((abs(randomGauss())))*Rmax*0.6+0.0;    //radius[i]=random(1,Rmax);
    z[i]=randomGauss()*gauss(radius[i]/Rmax*0.2)*Rmax*0.04;
    z[i]=abs(z[i]);
  }
  // gifExport = new gifAnimation.GifMaker(this, "galaxy.gif");
  // gifExport.setRepeat(0);
}

void draw(){
  //smooth(); // doesn't work for unknown reasons
  noSmooth();

//   img=get();
//   img.resize(round(width*0.5),round(height*0.5));
//   img.resize(width-2,height-2);
//   tint(245,250,255);
//   image(img,0,0);

  //fastSmallShittyBlurDiamond(g);
  //fastSmallShittyBlurCorners(g);
  fastSmallShittyBlurGauss(g);

  //fill(0,8); rect(0,0,width,height);
  noStroke();
  float r,a,x,y,b,s,c,xx,yy,dd,x3,y3,xParallax;
  for (int i=0; i< stars; i++){
    r=radius[i];
    a=angle[i]+speed*(Rmax/r)*3.0; // increment angle
    angle[i]=a;
    x=r*sin(a);
    y=r*eratio*cos(a);
    b=r*etwist;
    s=sin(b+frameCount/30f);
    c=cos(b+frameCount/30f);
    //dd=(r-50.0)*7.0;
    dd=40000.0/r;
    x3=(s*x + c*y);
    y3=(c*x - s*y);

    yy=cy*1.2 + (y3/3.0 -z[i]*20.0)*(1f+y3/1000f);
    xParallax=crossEye*y3/10f;

    xx=cxL+ x3 +xParallax; // a bit of trigo
    fill(color(dd,dd,dd*0.9,32));
    if(z[i]>0.2){
      if(z[i]>9.0){
        fill(color(255,255,255,255));
        ellipse(xx,yy,7.0,7.0);
        fill(color(255,255,255,32));
      }else if(z[i]>4.5){
        fill(color(255,32,32,64));
        ellipse(xx,yy,7.0,7.0);
        fill(color(255,255,255,32));
      }else if(z[i]>4.1){
        fill(color(255,255,255,255));
        ellipse(xx,yy,7.0,7.0);
        fill(color(255,255,255,32));
      }else{
        fill(color(40,128,20,64));
        if((i%50)==0){
          fill(color(255,255,255,255));
          ellipse(xx,yy,7.0,7.0);
          fill(color(255,255,255,32));
        }
      }
    }
    rect(xx-1.5,yy-1.5,3.0,3.0);

    xx=cxR+ x3 -xParallax; // a bit of trigo
    fill(color(dd,dd,dd*0.9,32));
    if(z[i]>0.2){
      if(z[i]>9.0){
        fill(color(255,255,255,255));
        ellipse(xx,yy,7.0,7.0);
        fill(color(255,255,255,32));
      }else if(z[i]>4.5){
        fill(color(255,32,32,64));
        ellipse(xx,yy,7.0,7.0);
        fill(color(255,255,255,32));
      }else if(z[i]>4.1){
        fill(color(255,255,255,255));
        ellipse(xx,yy,7.0,7.0);
        fill(color(255,255,255,32));
      }else{
        fill(color(40,128,20,64));
        if((i%50)==0){
          fill(color(255,255,255,255));
          ellipse(xx,yy,7.0,7.0);
          fill(color(255,255,255,32));
        }
      }
    }
    rect(xx-1.5,yy-1.5,3.0,3.0);


  }
  // gifExport.setDelay(1); gifExport.addFrame();
}

void keyPressed() {
  if(key==CODED){ if(1==2){
    if(keyCode == UP) { eratio=eratio*1.02; }
    if(keyCode == DOWN) { eratio=eratio/1.02; }
    if(keyCode == LEFT) { etwist=etwist+0.001; }
    if(keyCode == RIGHT) { etwist=etwist-0.001; }
    } 
  }else{
    crossEye=-crossEye;
  }
  //println("eratio="+eratio+" etwist="+etwist);
}


void fastSmallBetterBlurGauss(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask02=(0xFF)*0x00010001;
  final int mask1 =(0xFF)*0x00000100;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ((( 
            (pa[i-w]&mask02) //   1
           +(pa[i+w]&mask02) // 1 4 1
           +(pa[i+1]&mask02) //   1
           +(pa[i-1]&mask02)
           +((pa[i]&mask02)<<2)
          )>>3)&mask02)
          |
        ((( 
            (pa[i-w]&mask1) //   1
           +(pa[i+w]&mask1) // 1 4 1
           +(pa[i+1]&mask1) //   1
           +(pa[i-1]&mask1)
           +((pa[i]&mask1)<<2)
          )>>3)&mask1)
        )
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}

void fastSmallShittyBlurGauss(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask=(0xFF&(0xFF<<3))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i-w]&mask) //   1
         +(pa[i+w]&mask) // 1 4 1
         +(pa[i+1]&mask) //   1
         +(pa[i-1]&mask)
         +((pa[i]&mask)<<2)
        )>>3)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}

void fastSmallShittyBlurDiamond(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i-w]&mask) //   o
         +(pa[i+w]&mask) // o   o
         +(pa[i+1]&mask) //   o
         +(pa[i-1]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}
void fastSmallShittyBlurCorners(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i-w-1]&mask) // o . o
         +(pa[i+w-1]&mask) // . . .
         +(pa[i-w+1]&mask) // o . o
         +(pa[i+w+1]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}


void fastSmallShittyBlur1(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
// x o
// o . x
//   x o

      pb[i]=(
        ( (pa[i-w-1]&mask)
         +(pa[i+w]&mask)
         +(pa[i+1]&mask)
         +(pa[i  ]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}

void fastSmallShittyBlur2(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i+w+1]&mask)
         +(pa[i-w]&mask)
         +(pa[i-1]&mask)
         +(pa[i  ]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}

void fastSmallShittyBlurH(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i+1]&mask)
         +(pa[i-1]&mask)
         +(pa[i  ]&mask)*2
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}
void fastSmallShittyBlurV(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pb[]=a.pixels;
  int pa[]=new int[pb.length];
  arrayCopy(pb,pa);
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i+w]&mask)
         +(pa[i-w]&mask)
         +(pa[i  ]&mask)*2
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}

void fastSmallShittyBlurTL(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pa[]=a.pixels;
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=h-1;y>0;y--){ // top, left edge pixels ignored
    int rowStart=y*w    +1;
    int rowEnd  =y*w+(w-1);
    for(int i=rowEnd;i>rowStart;i--){
      pa[i]=(
        ( (pa[i-w]&mask)
         +(pa[i-1]&mask)
         +(pa[i  ]&mask)
         +(pa[i-1-w]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}
void fastSmallShittyBlurBR(PImage a){ //a=src, b=dest img
  int h=a.height;
  int w=a.width;
  int pa[]=a.pixels;
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
// • o
// o

  for(int y=0;y<h-1;y++){ // bottom, right edge pixels ignored
    int rowStart=y*w      ; //no +1
    int rowEnd  =y*w+(w-1);
    for(int i=rowStart;i<rowEnd;i++){
      pa[i]=(
        ( (pa[i+w]&mask)
         +(pa[i+1]&mask)
         +(pa[i  ]&mask)
         +(pa[i+1+w]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}


