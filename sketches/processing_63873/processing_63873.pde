
// Owaun Scantlebury 
//June 11 2012
boolean viewshapes = false;
boolean viewguides = false;
int w = 255;
int  h= 255;
color nowc = color(255,0,0);
int [] path = new int[h/5]; 
PImage ipath;
void setup(){
  size(510,255);
ipath=createImage(w,h,ARGB);

  int ix = 0;
  for (int x =0;x<ipath.width;x+=5){
    for (int y=0;y<ipath.height;y+=5){
  ix++;
 int k = int(random(0,10));
 if(k>5) ipath.pixels[x+ipath.width*y]=nowc;
}
}
  for (int x =0;x<path.length;x++){
   
   if(x%5==0)path[x]=7;
  }
  A= new PVector(w/2,0,0);
  B=new PVector(w/2,0,0);
for (int i =0;i<s1.length;i++){
  s1[i]=new PVector(0,0,0);
  s2[i]=new PVector(0,0,0);
  
}
background(255); 
}
int inc=0;
PVector [] s1 = new PVector[h];
PVector [] s2 = new PVector[h];
PVector A,B;
int  mode = 0;
void draw(){
  if(mode==0){
  mouseX+=5;
  mouseY=h;
  }
  if(mode==1){
    mouseX=w;
    mouseY+=5;
  }
  if(mouseY>h&& mode==1){
    mode=0;
     mouseX=0;
 mouseY=0;
  //  setup();
  // noLoop(); 
  }
  if(mouseX>w && mode == 0){
   mode=1;
   mouseX=0;
   mouseY=0;
    
  }
  inc = 0;
  //background(255); 
//  fill(255,0,0);
//  rect(0,0,w,h);
  image(ipath,2,0);
  if(mode==0){
  A= new PVector(mouseX+2,0,0);
  B= new PVector (mouseX,int(mouseY/5)*5,0);
  makebars (A,B);
  makelines();
  }
  
//  makelines();
if(mode==1){
   A= new PVector(2,mouseY,0);
  B= new PVector (int(mouseX/5)*5,mouseY,0);
  makebarsh (A,B);
  makelines2();
}
   
}


void makelines(){
  
 for (int i = 0;i<inc;i++){
    stroke(1,75);
  line(s1[i].x,s1[i].y,s2[i].x,s2[i].y);
  
 } 
}
void makelines2(){
  
 for (int i = 0;i<inc;i++){
   
   stroke(1,75);
  line(s1[i].x+2,s1[i].y,s2[i].x+2,s2[i].y);
  
 } 
}



void makebars(PVector A,PVector B){
  rectMode(CENTER);
  noFill();
  stroke(1);
  boolean hit = false;
  float lx=A.x;
  float ly = A.y;
  float lx1=A.x;
  float ly1 = A.y;
  for (int y=0;y<B.y+3;y+=5){
    pos = y/sz;
if(viewguides){
    line(A.x-3,0,A.x-3,y);
     line(A.x+3,0,A.x+3,y);
}
//     line(0,A.x-3,y);
//     line(A.x+3,0,A.x+3,y);
    color c = ipath.get(mouseX,y);

    if(c==nowc && y>=0){
      hit=!hit;
      noSmooth();
      line(A.x-1,y-1,A.x+1,y+1);
      line(A.x-1,y+1,A.x+1,y-1);
      smooth();
      if(hit==true){
        if(viewshapes) ellipse(A.x+space,y,4,4);
        s1[inc].x=A.x+space;
       s1[inc].y=y; 
        lx1 = B.x;
        ly1=B.y;
      }
      if(hit==false){
        if(viewshapes)rect(A.x+space,y,4,4);
           s2[inc].x=A.x+space;
       s2[inc].y=y;
        inc++;

      }
    }
  }
}

int pos=0;
int sz = 6;
void makebarsh(PVector A,PVector B){
  rectMode(CENTER);
  noFill();
  stroke(1);
  boolean hit = false;
  float lx=A.x;
  float ly = A.y;
  float lx1=A.x;
  float ly1 = A.y;
  for (int x=0;x<B.x+3;x+=5){
    pos = x/sz;

//    line(A.x-3,0,A.x-3,y);
//     line(A.x+3,0,A.x+3,y);
if(viewguides){
    line(0,A.y-3,x,A.y-3);
        line(0,A.y+3,x,A.y+3);
}
//     line(A.x+3,0,A.x+3,y);
    color c = ipath.get(x,mouseY);

    if(c==nowc && x>=0){
      hit=!hit;
      noSmooth();
      line(x+1,A.y-1,x+3,A.y+1);
      line(x+1,A.y+1,x+3,A.y-1);
      smooth();
      if(hit==true){
       if(viewshapes)  ellipse(x+space,A.y,4,4);
        s1[inc].x=x+space;
       s1[inc].y=A.y; 
     
      }
      if(hit==false){
      if(viewshapes)   rect(x+space,A.y,4,4);
           s2[inc].x=x+space;
       s2[inc].y=A.y;
        inc++;

      }
    }
  }
}

int space = w;

void mousePressed(){
// loop();
// background(255);
// mouseX=w;
// mouseY=0;
setup(); 
}

