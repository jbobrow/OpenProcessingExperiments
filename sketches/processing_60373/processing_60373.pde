
int w = 255;
int h = 255;
float dia = w*0.75;
int diam= int(dia/2);
void setup(){
  size(255,255);
  a=createImage(w,h,ARGB);
area = getdis(a);

  
}
int xstart=0;
int ystart = 0;
void draw(){
  background(255);
//  xstart = mouseX-diam;
//   ystart = mouseY-diam;
    a=createImage(w,h,ARGB);
 for (int x=mouseX-diam;x<mouseX+diam;x++){
  for (int y = mouseY-diam;y<mouseY+diam;y++){
  //  PVector dis = distx2(x,y,mouseX,mouseY,a);
   float dis = dist(x,y,mouseX,mouseY);
   if(dis<diam){
     //  println(dis.z);
   // if(dis.z<diam){
   
     String wh = where(x,y,mouseX,mouseY);
     if(wh=="A")a.set(x,y,color(255,0,0));
       if(wh=="B")a.set(x,y,color(0,255,0));
      if(wh=="C")a.set(x,y,color(0,0,255));
       if(wh=="D")a.set(x,y,color(0,255,255));
    }
  } 
 }

image(a,0,0); 
  //noLoop();
}
String where (float A,float B, float C,float D){
  String retval = "";
  
  if(A<C && B <D)retval = "A";
  if(A>C && B<D)retval = "B";
  if(A<C && B>D)retval = "C";
  if(A>C & B>D)retval = "D";
  
  
  
 return retval; 
}


////////


PVector [] area;
PImage a;
PVector distx2(int x1,int y1,int x2,int y2,PImage src){
   PVector retval  = new PVector (0,0,0);
 
 int X = x1-x2;
 if(X<0)X=-X;
 

 int Y = y1-y2;
 if(Y<0)Y=-Y;

int loc = X+src.width*Y;
if(loc>0 && loc <width*height) retval = new PVector(area[loc].x,area[loc].y,area[loc].z);
 //area[X+src.width*Y].z;
 
 
   
 return retval; 
//}
  
}
float distx(int x1,int y1,int x2,int y2,PImage src){
 float retval  = 0;
 
 int X = x1-x2;
 if(X<0)X=-X;
 

 int Y = y1-y2;
 if(Y<0)Y=-Y;

int pick = X+src.width*Y;
if (pick>0 && pick<width*height){
 retval = area[pick].z;
}
 
 
   
 return retval; 
}

PVector [] getdis(PImage a){
  int _w = a.width;
  int _h= a.height;
  int _all = _w*_h;
  PVector [] retval = new PVector[_all];
  
  for (int i =0;i<_all;i++){
    int y = int(i/a.width);
    int x = i-(y*a.width);
    float dis = dist(0,0,x,y);
//    float xx =((log((dis*35.0)/80.1+1.01)*(7.8)));
//    float yy=((log((dis*35.0)/100.0+1.01)*(10.0)));
 
 //mode A
    float xx = ((log(dis/10.0+1.01)*(2.0)));
    float yy=((log(dis/30.0+1.01)*(3.0)));
    
//        float xx = ((log(dis/9.0+1.01)*(2.0)));
//    float yy=((log(dis/25.0+1.01)*(3.0)));
    
   retval [i]=new PVector(xx,yy,dis);

    
  }
  
  return retval;
}
