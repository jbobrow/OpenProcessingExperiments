
PVector cent;
void setup(){
 size(255,255); 
 cent  = new PVector (width/2,height/2,0);
  smooth();
}
int w = 255;
int   h = 255;
void draw(){
  
 background(255);
// line(0,25,mouseX,mouseY);
int by = 15;
for (int i =0;i<h;i+=by){
PVector  [] karl = linev(0,i,mouseX,mouseY,10);
PVector  [] karl2 = linev(0,i+by,mouseX,mouseY,10);
//line(0,25+15,mouseX,mouseY);
 if(i>0)maketile(karl,karl2,10);
 if(i==0)maketileC(karl,karl2,10);
}

for (int i =0;i<h;i+=by){
PVector  [] karl = linev(w,i,mouseX,mouseY,10);
PVector  [] karl2 = linev(w,i+by,mouseX,mouseY,10);
//line(0,25+15,mouseX,mouseY);
 if(i>0)maketile(karl,karl2,10);
 if(i==0)maketileC(karl,karl2,10);
}

for (int i =0;i<w;i+=by){
PVector  [] karl = linev(i,0,mouseX,mouseY,10);
PVector  [] karl2 = linev(i+by,0,mouseX,mouseY,10);
//line(0,25+15,mouseX,mouseY);
 if(i>0)maketile(karl,karl2,10);
 if(i==0)maketileC(karl,karl2,10);
}

for (int i =0;i<w;i+=by){
PVector  [] karl = linev(i,h,mouseX,mouseY,10);
PVector  [] karl2 = linev(i+by,h,mouseX,mouseY,10);
//line(0,25+15,mouseX,mouseY);
 if(i>0)maketile(karl,karl2,10);
 if(i==0)maketileC(karl,karl2,10);
}


}

void maketile(PVector [] A,PVector [] B,int val){
  int j = A.length;
  for (int i =1;i<=j-val;i+=val){
    if(i<A.length-val && i <B.length-val){
    beginShape();
    vertexi(A[i].x,A[i].y);
    vertexi(B[i].x,B[i].y);
    vertexi(B[i+val].x,B[i+val].y);
    vertexi(A[i+val].x,A[i+val].y);
    endShape();
    }
    
  }
  
}

void maketileC(PVector [] A,PVector [] B,int val){
  int j = A.length;
  for (int i =1;i<=j-val;i+=val){
    if(i<A.length-val && i <B.length-val){
    beginShape();
    vertexi(A[i].x,A[i].y);
    vertexi(B[i].x,B[i].y);
    vertexi(B[i+val].x,B[i+val].y);
    vertexi(A[i+val].x,A[i+val].y);
    endShape(CLOSE);
    }
    
  }
  
}
void vertexi(float A,float B){
  noFill();
  stroke(1,111);
 // noStroke();
  float dis = dist(A,B,mouseX,mouseY);
 fill(A,B,dis,dis);
vertex(A,B); 
}
PVector mx(float Ax,float Bx,float C,float D){
  
  float A = abs(Ax-C);
  float B = abs(Bx-D);
  float retval2;
  retval2 = max(A,B);
  
  PVector retval = new PVector(A/retval2,B/retval2,retval2);
  
  return retval;
  
}
 
 
void linex(float A,float B,float C,float D){
   
  PVector q = mx(A,B,C,D);
  int  aa  = int(q.z);
    float bb=0;
    float cc = 0;
      for (int i = 0;i<aa;i+=1){
      bb+=q.x;
      cc+=q.y;
      float lx1 = A+bb;
      String k = where(A,B,C,D);
     if(k=="C")  point(lx1,B-cc);
      if(k=="A")  point(lx1,B+cc);
      if(k=="B")  point(A-bb,B+cc);
       if(k=="D")  point(A-bb,B-cc);
 
 
      }
   
}

PVector [] linev(float A,float B,float C,float D,int by){
   
  PVector q = mx(A,B,C,D);
  int  aa  = int(q.z);
  PVector  [] retval = new PVector[aa];
    float bb=0;
    float cc = 0;
      for (int i = 0;i<aa;i+=1){
      bb+=q.x;
      cc+=q.y;
      float lx1 = A+bb;
      String k = where(A,B,C,D);
     if(k=="C")  pointv(lx1,B-cc,retval,i,by);
      if(k=="A")  pointv(lx1,B+cc,retval,i,by);
      if(k=="B")  pointv(A-bb,B+cc,retval,i,by);
       if(k=="D")  pointv(A-bb,B-cc,retval,i,by);
 
 
      }
   return retval;
}

void pointv(float A,float B,PVector [] C,int val,int by){
  C[val]=new PVector(A,B,0);
 // if(val%by==0)line(A,B,A,B-15);
  
}

String where (float A,float B, float C,float D){
  String retval = "";
   
  if(A<=C && B <=D)retval = "A";
  if(A>C && B<D)retval = "B";
  if(A<C && B>D)retval = "C";
  if(A>=C & B>=D)retval = "D";
   
   
   
 return retval;
}
