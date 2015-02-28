
float mod(float v, float m){ v=v/m; return (v-floor(v))*m; }

PImage img;
int pa[]; //point array
int pal;  //point array length
int xa[]; //array of x positions
int ya[]; //array of y positions
float sa[]; //speed array = array of random speed of each star
float t,ts,td;
void setup(){
  size(900,759,P3D);
  background(0);
  img=loadImage("garfield_star.gif");
  img.loadPixels();
  pa=new int[img.width*img.height];
  int l=pa.length;
  pal=0;
  for(int i=0;i<l;i++){
    int c=img.pixels[i];
    if(brightness(c)>0){
      pa[pal]=i;
      pal++;
    }
  }
  sa=new float[pal+1];
  xa=new int[pal];
  ya=new int[pal];
  for(int pi=0;pi<pal;pi++){
    int i=pa[pi]; //get original image pixel[] position
    sa[pi]=random(0.1,1f)*random(0.1,1f)*random(0.1,1f)*random(0.1,1f)*random(0.1,1f)*5f;
    xa[pi]=i%img.width;
    ya[pi]=i/img.width;
  }
  td=+1;
  ts=5;
  t=-td*ts*300;
}

void draw(){
  noSmooth();
  background(0);
  for(int pi=0;pi<pal;pi++){
    int i=pa[pi]; //get original image pixel[] position
    stroke(img.pixels[i]);
    point(mod(1f*xa[pi]  +t*sa[pi]  +10f*sa[pi+1] ,width),ya[pi]);
  }
  t+=ts*td;
}

void keyPressed() {
  if(key==CODED){
    if(1==2){
    }else if(keyCode==LEFT ){ td=-1;
    }else if(keyCode==RIGHT){ td=+1;
    } 
  }else if(key==' '){ td=td*0.1;
  }
}

