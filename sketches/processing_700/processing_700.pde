
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



float pi=4*atan(1);

int stars=10000; // only ...
int Rmax=200; // galaxy radius
float speed=0.02;  // rotation speed

// stars follow elliptic orbits around the center
float eratio=.85; // ellipse ratio
float etwist=8.0/Rmax; // twisting factor (orbit axes depend on radius)

float []angle=new float[stars];
float []radius=new float[stars];

float cx; float cy; //center

PImage img;

void setup(){
  size(int(Rmax*3), int(Rmax*2),P3D);
  background(0); // back to black
  speed=speed/frameRate;

  // begin in the center
  cx = width/2;
  cy = height/2;
  // itit stars
  for (int i=0; i< stars; i++){
    angle[i]= random(0,2*pi);
    //radius[i]=random(1,Rmax);
    radius[i]=((abs(randomGauss())))*Rmax*0.6+0.0;
  }
  // gifExport = new gifAnimation.GifMaker(this, "galaxy.gif");
  // gifExport.setRepeat(0);
}

void draw(){
  //smooth();
  noSmooth();
  img=get();
  img.resize(round(width*0.5),round(height*0.5));
  img.resize(width-2,height-2);
  tint(245,250,255);
  image(img,0,0);
  //fill(0,8); rect(0,0,width,height);
  noStroke();
  float r,a,x,y,b,s,c,xx,yy,dd;
  for (int i=0; i< stars; i++){
    r=radius[i];
    a=angle[i]+speed*(Rmax/r)*3.0; // increment angle
    angle[i]=a;
    x=r*sin(a);
    y=r*eratio*cos(a);
    b=r*etwist;
    s=sin(b);
    c=cos(b);
    xx=cx + s*x + c*y; // a bit of trigo
    yy=cy + c*x - s*y;
    //dd=(r-50.0)*7.0;
    dd=40000.0/r;
    fill(color(dd,dd,dd*0.9,32));
    rect(xx-1.5,yy-1.5,3.0,3.0);
  }
  // gifExport.setDelay(1); gifExport.addFrame();
}

void keyPressed() {
  if(keyCode == UP) { eratio=eratio*1.02; }
  if(keyCode == DOWN) { eratio=eratio/1.02; }
  if(keyCode == LEFT) { etwist=etwist+0.001; }
  if(keyCode == RIGHT) { etwist=etwist-0.001; } 
  //println("eratio="+eratio+" etwist="+etwist);
}

