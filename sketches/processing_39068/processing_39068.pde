
//Easy Sphere v2
//Owaun Scantlebury
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
int w = 256;
int h = 256;
float xm = w/2;
float ym = h/2;
int all = w*h;
int by  = 4;//4 ,16
float  ball = xm;
boolean domove=true;
PVector [] A = new PVector [all];
PVector [] B = new PVector [all];
PVector [] C = new PVector [all];
PVector [] D = new PVector [all];
PVector [] E = new PVector [all];
PVector [] F = new PVector [all];

PImage a;
PImage b;
boolean viewimages=false;
void keyReleased(){
  color p2=0;
  if(key=='a'){
    //INSERT any picture filter function or write your own
    a.filter(BLUR,15);
    //a.blend(b,0,0,w,h,0,0,w,h,SOFT_LIGHT);

    for (int i = 0;i<all;i+=by){
      color p = a.pixels[i];
      if(i<all-by)p2=a.pixels[i+by];
      // p = blendColor(p,p2,OVERLAY);
      A[i].x=p>>16&255;
      A[i].y=p>>8&255;
      A[i].z=p&255;
    }
  }

  if(key=='b'){
    //INSERT any picture filter function or write your own
    b.filter(BLUR,15);
    //b.blend(a,0,0,w,h,0,0,w,h,SOFT_LIGHT);
    for (int i = 0;i<all;i+=by){
      color p = b.pixels[i];
      if(i<all-by)p2=b.pixels[i+by];
      // p = blendColor(p,p2,OVERLAY);

      // B[i].z=(p&255+p2&255)/1.25;
      B[i].x=p>>16&255;
      B[i].y=p>>8&255;
      B[i].z=p&255;
    }
  }
if(key=='v')viewimages=!viewimages;
}
void setup(){
  size(255,255,P3D);
  a=createImage(w,h,ARGB);
  b=createImage(w,h,ARGB);
  frameRate(3000);
  lights();
  cam = new PeasyCam (this,w);
  int i = 0;
  for (int x=0;x<w;x++){
    for (int y = 0;y<h;y++){

      // float dia = dist(x,y,0);
      //dist(x,y,xm,xm),xm,ym,xm);
      A[i]=new PVector (x,y,0);
      B[i]=new PVector (x,y,h);
      //-dist(x,y,dia,xm,ym,xm));
      //    if(x>0&& y>0){
      //        A[i]=new PVector (x,y,dist(x,y,x%y,xm,ym,xm));
      //    B[i]=new PVector (x,y,h-dist(x,y,x%y,xm,ym,xm));
      //    }

      // }
      i++;  
    } 

  }

}

float rotz;
void draw(){
  for (int i = 0;i<all;i+=1){
    a.pixels[i]=color(A[i].x,A[i].y,A[i].z); 
    b.pixels[i]=color(B[i].x,B[i].y,B[i].z); 

  }

  background(255);
  if(viewimages){
      cam.beginHUD();
      image(a,-xm,0);
      image(b,xm,0);
      cam.endHUD();
  }

  translate(-xm,-ym,xm-xm/4);
   rotateY(radians(90));
  
  for (int i= 0;i<all;i+=by){ //16
    zee=i;
    put(A,i);

    put(B,i);



  } 
  move(); 
}


void vertexi(float a,float b,float c){
  fill(255,b,c);


  noStroke();
  vertex(a,b,c); 

}
int zee=0;
PVector middle = new PVector(xm,ym,xm);
void put(PVector [] A,int i){

  if(dist1(A[i].x,A[i].y,0,xm,ym,0)<xm){

    stroke(1);
    point(A[i].x,A[i].y,A[i].z);



  }
}
PVector [] now;


float dist1(float x1,float y1,float z1,
float x2,float y2,float z2){
  // float retval=abs(x1-x2)+abs(y2-y1)+abs(z2-z1);
  float retval = dist(x1,y1,z1,x2,y2,z2);
  //retval=(retval+retval2)/2;  
  //retval=retval2;
  return retval;           
}
void move(){
  for (int i= 0;i<all;i+=1){

    if(dist(A[i].x,A[i].y,A[i].z,middle.x,middle.y,middle.z)>ball && A[i].z<w){ 
      A[i].z+=.5;
    }

    if(dist(B[i].x,B[i].y,B[i].z,middle.x,middle.y,middle.z)>ball && B[i].z>0){ 
      B[i].z-=.5;
    }


  } 

}







