
color blu = color(0,0,255);
color redd = color(255,0,0);
color greenn= color(0,255,0);
PImage a;
float rr;
float gg;
float bb;
PVector []c1= new PVector[2];
PVector[] c2= new PVector [2];
PVector []c3= new PVector [2];
int w = 255;
int h = 255;
int all = w*h;
PVector now = new PVector(0,0,0);
int r(){
 int retval = int(random(w));
 return retval;
}
public color fresh;
void strokex(color col){
 fresh = col;
}
void pointx(int x,int y){
// a.set(x,y,fresh);
stroke(fresh);
noFill();
//ellipse(x,y,30,30);
 
}
String [] mode = {"top_down","left_right","all_inclusive"};
String nowmode=mode[2];
PImage b;

void setup(){
 if(nowmode==mode[0])setup1();
  if(nowmode==mode[1])setup2();
    if(nowmode==mode[2])setup3();
}


public boolean firstrun=true;
String fn = "shapes3.png";
//"scl.png";"
//"promo_698.jpg";
float rz1=0;
float rz2=0;
float rz3=0;
PImage loadImagex(String what){
  rz1+=.01;
  rz2+=.01;
  rz3+=.01;
 // PImage retval = loadImage(what);
  PImage retval = createImage(450,450,ARGB);
 PGraphics A = createGraphics(450,450,P2D)  ; 
   A.loadPixels();
   A.beginDraw();
   A.background(128,128,128);
   A.translate(150,100);
   A.fill(greenn);
   A.smooth();
   A.stroke(greenn);
   A.rectMode(CENTER);
    A.rotate(30+rz3);
    A.translate(100,100);
  // A.translate(A.width/2,A.height/2);
  
   A.rect(0,0,100,100);
       A.translate(-100,-100);
        A.rotate(-(3+rz3));
   A.fill(redd);
   A.smooth();
   A.stroke(redd);
   A.rectMode(CENTER);
    A.rotate(5+rz1);
    A.translate(200,200);
  // A.translate(A.width/2,A.height/2);
  
   A.rect(0,0,100,100);
       A.translate(-200,-200);
       A.rotate(-(45+rz1));
   A.fill(blu);
   A.smooth();
   A.stroke(blu);
   A.rectMode(CENTER);
//    A.translate(200,200);
  A.rotate(6+rz2);
   A.translate(A.width/2,A.height-100);
 
   A.rect(0,0,100,100);
      A.translate(-A.width/2,-A.height-100);
    A.rotate(-(60+rz2));
  // A.rect(A.width/2,A.height/2,100,100);
  A.endDraw();
   A.updatePixels();
 
// arraycopy(A.pixels,retval.pixels);
for (int i = 0;i<A.pixels.length;i++){
retval.pixels[i]=A.pixels[i];
}
 return retval; 
 
}
void setup1(){
  if(firstrun){ a = loadImagex(fn);
   w=a.width;
   h=a.height;
  for (int i =0;i<2;i++){
   c1[i]=new PVector (0,0,0);
     c2[i]=new PVector (0,0,0);
       c3[i]=new PVector (0,0,0);
  }
  }
  if(firstrun)size(w,h);

  smooth();
 if(firstrun)  background(128,128,128);
//  a=get();
b=get();
//  strokex(blu);
//  pointx(int(random(w)),int(random(h)));
// 
//   strokex(redd);
//  pointx(int(random(w)),int(random(h)));
// 
//   strokex(greenn);
//  pointx(int(random(w)),int(random(h)));
//a=get();

 //fishlady.jpg");
 //aroma2.png");
// a.resize(w,h);
if(firstrun) image(a,0,0);
  rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 
  for (int i =0;i<w*h;i++){
   color c = a.pixels[i];
  
    rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr){
     
     maxr=rr;
    now.x=i;
    }
   
        if(gg>maxg){
     
     maxg=gg;
    now.y=i;
    }
        if(bb>maxb){
     
     maxb=bb;
    now.z=i;
    }
  }
  c1[0] = shapx(int(now.x));
   c2[0] = shapx(int(now.y));
    c3[0] = shapx(int(now.z));
  //  a.updatePixels();
//    background(128,128,128);
//    a=get();
//   a.set(r(),r(),redd);
//a.set(r(),r(),blu);
//a.set(r(),r(),greenn);
 // image(a,0,0);
  noFill();
 
  ellipse(c1[0].x,c1[0].y,10,10);
  ellipse(c2[0].x,c2[0].y,10,10);
  ellipse(c3[0].x,c3[0].y,10,10);
 
  now = new PVector(0,0,0);
  maxr=0;
 maxg=0;
 maxb=0;
  rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 
  //for (int i =0;i<w*h;i++){
    for (int i =w*h-1;i>0;i--){
   color c = a.pixels[i];
       rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr){
     
     maxr=rr;
    now.x=i;
    }
   
        if(gg>maxg){
     
     maxg=gg;
    now.y=i;
    }
        if(bb>maxb){
     
     maxb=bb;
    now.z=i;
    }
  }
  c1[1] = shapx(int(now.x));
   c2[1] = shapx(int(now.y));
    c3[1] = shapx(int(now.z));
 // image(a,0,0);
  noFill();
  ellipse(c1[1].x,c1[1].y,10,10);
  ellipse(c2[1].x,c2[1].y,10,10);
  ellipse(c3[1].x,c3[1].y,10,10);
  stroke(100,200,255,125);
 
  rect(min(c1[0].x,c1[1].x),min(c1[0].y,c1[1].y),abs(c1[0].x-c1[1].x),abs(c1[0].y-c1[1].y));
rect(min(c2[0].x,c2[1].x),min(c2[0].y,c2[1].y),abs(c2[0].x-c2[1].x),abs(c2[0].y-c2[1].y));

rect(min(c3[0].x,c3[1].x),min(c3[0].y,c3[1].y),abs(c3[0].x-c3[1].x),abs(c3[0].y-c3[1].y));
 
    a.updatePixels();
//  println(maxr);
//  println(maxg);
//  println(maxb); 
  firstrun = false;
}


float maxr=0;
float maxg=0;
float maxb=0;

PVector shapx(int val){
  int y  = int(val/w);
  int x = val - (y*w);
  int z=0;
  PVector retval = new PVector (x,y,z);
 return retval;
}
void draw(){
 a=loadImagex(fn);
 setup3();
}

//s2
PVector [] nowb ;
//= new PVector[6];
void setup2(){
   nowb = new PVector[6];
  if(firstrun){  
    a = loadImagex(fn);
   w=a.width;
   h=a.height;
  }
  for (int i =0;i<2;i++){
   c1[i]=new PVector (0,0,0);
     c2[i]=new PVector (0,0,0);
       c3[i]=new PVector (0,0,0);
     
  }
  for (int i =0;i<6;i++){
     nowb [i]=new PVector (0,0,0);
  }
 if(firstrun) size(w,h);

  smooth();
  if(firstrun) background(128,128,128);
//  a=get();
b=get();
//  strokex(blu);
//  pointx(int(random(w)),int(random(h)));
// 
//   strokex(redd);
//  pointx(int(random(w)),int(random(h)));
// 
//   strokex(greenn);
//  pointx(int(random(w)),int(random(h)));
////a=get();
 //a = loadImagex("c:\\data\\shapes3.png");
 //fishlady.jpg");
 //aroma2.png");
 //a.resize(w,h);
 image(a,0,0);
  rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 
 // for (int i =0;i<w*h;i++){
   for (int x = 0;x<w;x++){
     for (int y=0;y<h;y++){
   color c = a.get(x,y);
  
    rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr){
     
     maxr=rr;
    nowb[0]=new PVector(x,y,0); 
    }
   
        if(gg>maxg){
     
     maxg=gg;
    nowb[1]=new PVector(x,y,0);
    }
        if(bb>maxb){
     
     maxb=bb;
    nowb[2]=new PVector(x,y,0);
    }
   }
  }
  c1[0] = nowb[0];
   c2[0] = nowb[1];
    c3[0] =nowb[2];
    a.updatePixels();
//    background(128,128,128);
//    a=get();
//   a.set(r(),r(),redd);
//a.set(r(),r(),blu);
//a.set(r(),r(),greenn);
 // image(a,0,0);
  noFill();
  ellipse(c1[0].x,c1[0].y,10,10);
  ellipse(c2[0].x,c2[0].y,10,10);
  ellipse(c3[0].x,c3[0].y,10,10);
  now = new PVector(0,0,0);
  maxr=0;
 maxg=0;
 maxb=0;
  rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 
  //for (int i =0;i<w*h;i++){
   // for (int i =w*h-1;i>0;i--){
     for (int x = w-1;x>0;x--){
       for (int y=h-1;y>0;y--){
   color c = a.get(x,y);
       rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr){
     
     maxr=rr;
    nowb[3]=new PVector (x,y,0); 
    }
   
        if(gg>maxg){
     
     maxg=gg;
    nowb[4]=new PVector (x,y,0);
    }
        if(bb>maxb){
     
     maxb=bb;
    nowb[5]=new PVector (x,y,0);
    }
   }
  }
  c1[1] =nowb[3];
   c2[1] = nowb[4];;
    c3[1] = nowb[5];
 // image(a,0,0);
  noFill();
  ellipse(c1[1].x,c1[1].y,10,10);
  ellipse(c2[1].x,c2[1].y,10,10);
  ellipse(c3[1].x,c3[1].y,10,10);
  stroke(100,200,255,125);
  rect(min(c1[0].x,c1[1].x),min(c1[0].y,c1[1].y),abs(c1[0].x-c1[1].x),abs(c1[0].y-c1[1].y));
rect(min(c2[0].x,c2[1].x),min(c2[0].y,c2[1].y),abs(c2[0].x-c2[1].x),abs(c2[0].y-c2[1].y));

rect(min(c3[0].x,c3[1].x),min(c3[0].y,c3[1].y),abs(c3[0].x-c3[1].x),abs(c3[0].y-c3[1].y));
a.updatePixels();
//  println(maxr);
//  println(maxg);
//  println(maxb); 
 firstrun = false;
}


//s3

void setup3(){

 nowb = new PVector[6];
  if(firstrun){  
    a = loadImagex(fn);
   w=a.width;
   h=a.height;
  }
  for (int i =0;i<2;i++){
   c1[i]=new PVector (0,0,0);
     c2[i]=new PVector (0,0,0);
       c3[i]=new PVector (0,0,0);
     
  }
  for (int i =0;i<6;i++){
     nowb [i]=new PVector (0,0,0);
  }
 if(firstrun) size(w,h);

  smooth();
  if(firstrun) background(128,128,128);
//  a=get();
//b=get();
//  strokex(blu);
//  pointx(int(random(w)),int(random(h)));
// 
//   strokex(redd);
//  pointx(int(random(w)),int(random(h)));
// 
//   strokex(greenn);
//  pointx(int(random(w)),int(random(h)));
////a=get();
 //a = loadImagex("c:\\data\\shapes3.png");
 //fishlady.jpg");
 //aroma2.png");
 //a.resize(w,h);
 image(a,0,0);
  rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 
 // for (int i =0;i<w*h;i++){
   for (int x = 0;x<w;x++){
     for (int y=0;y<h;y++){
   color c = a.get(x,y);
  
    rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr){
     
     maxr=rr;
    nowb[0]=new PVector(x,y,0); 
    }
   
        if(gg>maxg){
     
     maxg=gg;
    nowb[1]=new PVector(x,y,0);
    }
        if(bb>maxb){
     
     maxb=bb;
    nowb[2]=new PVector(x,y,0);
    }
   }
  }
  c1[0] = nowb[0];
   c2[0] = nowb[1];
    c3[0] =nowb[2];
    a.updatePixels();
//    background(128,128,128);
//    a=get();
//   a.set(r(),r(),redd);
//a.set(r(),r(),blu);
//a.set(r(),r(),greenn);
 // image(a,0,0);
  noFill();
  ellipse(c1[0].x,c1[0].y,10,10);
  ellipse(c2[0].x,c2[0].y,10,10);
  ellipse(c3[0].x,c3[0].y,10,10);
  now = new PVector(0,0,0);
  maxr=0;
 maxg=0;
 maxb=0;
  rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 
  //for (int i =0;i<w*h;i++){
   // for (int i =w*h-1;i>0;i--){
     for (int x = w-1;x>0;x--){
       for (int y=h-1;y>0;y--){
   color c = a.get(x,y);
       rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr){
     
     maxr=rr;
    nowb[3]=new PVector (x,y,0); 
    }
   
        if(gg>maxg){
     
     maxg=gg;
    nowb[4]=new PVector (x,y,0);
    }
        if(bb>maxb){
     
     maxb=bb;
    nowb[5]=new PVector (x,y,0);
    }
   }
  }
  c1[1] =nowb[3];
   c2[1] = nowb[4];;
    c3[1] = nowb[5];
 // image(a,0,0);
  noFill();
  ellipse(c1[1].x,c1[1].y,10,10);
  ellipse(c2[1].x,c2[1].y,10,10);
  ellipse(c3[1].x,c3[1].y,10,10);
  stroke(100,200,255,125);
  rect(min(c1[0].x,c1[1].x),min(c1[0].y,c1[1].y),abs(c1[0].x-c1[1].x),abs(c1[0].y-c1[1].y));
rect(min(c2[0].x,c2[1].x),min(c2[0].y,c2[1].y),abs(c2[0].x-c2[1].x),abs(c2[0].y-c2[1].y));

rect(min(c3[0].x,c3[1].x),min(c3[0].y,c3[1].y),abs(c3[0].x-c3[1].x),abs(c3[0].y-c3[1].y));
a.updatePixels();
//  println(maxr);
//  println(maxg);
//  println(maxb); 
 firstrun = false;
///



// S E T U P 1 -------------------------------------------------------


PVector [] c4 = new PVector [2];
PVector [] c5 = new PVector [2];
PVector [] c6 = new PVector [2];
 for (int i =0;i<2;i++){
   c1[i]=new PVector (0,0,0);
     c2[i]=new PVector (0,0,0);
       c3[i]=new PVector (0,0,0);
       c4[i]=new PVector (0,0,0);
     c5[i]=new PVector (0,0,0);
       c6[i]=new PVector (0,0,0);
     
  }
  for (int i =0;i<6;i++){
     nowb [i]=new PVector (0,0,0);
  }
  PVector now2  = new PVector (0,0,0);
 rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 float  rr1 = red(a.pixels[0]);
 float gg1 = green(a.pixels[0]);
  float bb1 = blue(a.pixels[0]);
boolean maxrfound = false;
boolean maxgfound = false;
boolean maxbfound = false;
  for (int i =0;i<w*h;i++){
   color c = a.pixels[i];
  
    rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr && rr!=rr1 || maxrfound == false){
      maxrfound = true;
     maxr=rr;
    now2.x=i;
    }
   
        if(gg>maxg && gg!=gg1 || maxgfound == false){
      maxgfound = true;
     maxg=gg;
    now2.y=i;
    }
        if(bb>maxb && bb!=bb1 || maxbfound == false){
      maxbfound = true;
     maxb=bb;
    now2.z=i;
    }
  }
 
  c4[0] = shapx(int(now2.x));
   c5[0] = shapx(int(now2.y));
    c6[0] = shapx(int(now2.z));
 
  //  a.updatePixels();
//    background(128,128,128);
//    a=get();
//   a.set(r(),r(),redd);
//a.set(r(),r(),blu);
//a.set(r(),r(),greenn);
 // image(a,0,0);
  noFill();

  ellipse(c4[0].x,c4[0].y,10,10);
  ellipse(c5[0].x,c5[0].y,10,10);
  ellipse(c6[0].x,c6[0].y,10,10);

//println(c4[0].x);
  now2 = new PVector(0,0,0);
  maxr=0;
 maxg=0;
 maxb=0;
  rr = red(a.pixels[0]);
  gg = green(a.pixels[0]);
  bb = blue(a.pixels[0]);
 
  //for (int i =0;i<w*h;i++){
    for (int i =w*h-1;i>0;i--){
   color c = a.pixels[i];
       rr = c>>16&255;
    gg  = c>>8&255;
    bb = c&255;
    if(rr>maxr && rr !=rr1){
     
     maxr=rr;
    now2.x=i;
    }
   
        if(gg>maxg &&gg!=gg1){
     
     maxg=gg;
    now2.y=i;
    }
        if(bb>maxb && bb!=bb1){
     
     maxb=bb;
    now2.z=i;
    }
  }
  c1[1] = shapx(int(now2.x));
   c2[1] = shapx(int(now2.y));
    c3[1] = shapx(int(now2.z));
 // image(a,0,0);
  noFill();
 
  ellipse(c1[1].x,c1[1].y,10,10);
  ellipse(c2[1].x,c2[1].y,10,10);
  ellipse(c3[1].x,c3[1].y,10,10);
 
  stroke(255,0,0,125);
 
  rect(min(c1[1].x,c4[0].x),min(c1[1].y,c4[0].y),abs(c1[1].x-c4[0].x),abs(c1[1].y-c4[0].y));
  rect(min(c2[1].x,c5[0].x),min(c2[1].y,c5[0].y),abs(c2[1].x-c5[0].x),abs(c2[1].y-c5[0].y));

  rect(min(c3[1].x,c6[0].x),min(c3[1].y,c6[0].y),abs(c3[1].x-c6[0].x),abs(c3[1].y-c6[0].y));
 

}
