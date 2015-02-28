
int w=255;
int h=255;
PVector [] placesA = new PVector[w];
PVector [] placesB = new PVector[h];
PVector [] placesC = new PVector[w];
PVector [] placesD = new PVector[h];
int modecount=0;
int modeset=0;
int all = w*4;

public PVector [] nowx = new PVector [all];
public PVector [] tox = new PVector [all];
int tot=0;
PImage a;
void setup(){
    size(255,255,JAVA2D);
    String fn = "http://www.google.com/intl/en_com/images/srpr/logo3w.png";
    //"c:\\data\\knots43.png";
   // a=loadImage(fn);
   a= new PImage(w,h);
   for (int i =0;i<w*h;i++){
    a.pixels[i]=color(255,0,0); 
   }
    //"c:\\data\\manda.jpg");
     background(-1);
    for (int i=0;i<w;i++){
   placesA[i]= new PVector(i,0,0);
   tox[tot]=   placesA[i];
   tot++;
    }
    for (int i=0;i<w;i++){
    placesB[i]= new PVector(w,i,0);
       tox[tot]=   placesB[i];
       tot++;
    }
    for (int i=0;i<w;i++){
    placesC[i]= new PVector(w-i,h,0);
       tox[tot]=   placesC[i];
       tot++;
    }
    for (int i=0;i<w;i++){
    placesD[i]= new PVector(0,h-i,0);
       tox[tot]=   placesD[i];
       tot++;
    }
 
  for (int i=0;i<all;i++){
   nowx[i]=new PVector (w/2,h/2,0); 
  }

  smooth();
 
 
}
int moveby=2;
int lowx=-1;
int hix=1;
float midx=w/2;
float midy=h/2;

//int _lowy(){
//  int retval = 0;
//  
//  
// return retval; 
//}
//int _lowx(){
//    int retval =0;
//    
//  if (now.x<midx && now.y<midy){
//   retval = lowx*-1; 
//  }
// 
//  return retval;
//}
String state = "A";
PVector getlow(PVector now){
  
  PVector retval = new PVector (0,0,0);
  
  if (now.x <midx && now.y<midy)state="A";
  if (now.x >midx && now.y<midy)state="B";
  if (now.x >midx && now.y>midy)state="C";
  if (now.x <midx && now.y>midy)state="D";
  if(state=="A"){
   retval = new PVector (now.x-=random(moveby),now.y-=random(moveby),0);   
  }
  if(state=="B"){
   retval = new PVector (now.x+=random(moveby),now.y-=random(moveby),0);   
    
  }
  if(state=="C"){
       retval = new PVector (now.x+=random(moveby),now.y+=random(moveby),0);   

  }
  if(state=="D"){
       retval = new PVector (now.x-=random(moveby),now.y+=random(moveby),0);   
  }
 return retval; 
}
void go(PVector now,PVector to){
 
 //now = getlow(now);
 if (now.x<to.x)now.x+=random(lowx,hix);
if(now.x>to.x)now.x-=random(lowx,hix);
if(now.y>to.y)now.y-=random(lowx,hix);
if(now.y<to.y)now.y+=random(lowx,hix);

  if(dist(now.x,now.y,to.x,to.y)<1){
    
  //background(-1);
 // tox=new PVector(random(w),random(h),0);
// tox=new PVector(mouseX,mouseY,0);\
//tox=places[placeindex];
// if(mode =="A")tox=placesA[modecount];
// if(mode =="B")tox=placesB[modecount];
// if(mode =="C")tox=placesC[modecount];
// if(mode =="D")tox=placesD[modecount];
// if(posx>all-1)posx=0;
//tox=circlepoints[posx];
// posx++;
//
//placeindex++;
//if(placeindex>3)placeindex=0;
// for (int i=0;i<all;i++){
////   
//    nowx[i]=new PVector(w/2,h/2,0);
//  }
 }
}
void draw(){
   for (int i=0;i<all;i++){
 
//ellipse(w/2,h/2,10,10);
go(nowx[i],tox[i]);
//stroke(1,3);
color c = a.get(int(nowx[i].x),int(nowx[i].y));
stroke(c,26);
point(nowx[i].x,nowx[i].y);
   }
  
}

void keyPressed(){
 background(-1);
 tot=0;
 setup(); 
}
