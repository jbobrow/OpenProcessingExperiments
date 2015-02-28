
int w = 255;
int h = 255;
PVector [] karl;

void setup(){
 size(512,512);
smooth(); 
  
  dx=w;
  dy=h;
}
boolean don = true;
float dx;
float dy;
void mousePressed(){
  
 //don = true;
 if (don==true){
  dx=mouseX;
 dy=mouseY; 
 }
don = false; 
}


void mouseReleased(){
  
 don = true; 
}
void draw(){
 background(255);
linex(dx,dy,mouseX,mouseY); 
  
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


String where (float A,float B, float C,float D){
  String retval = "";
   
  if(A<=C && B <=D)retval = "A";
  if(A>C && B<D)retval = "B";
  if(A<C && B>D)retval = "C";
  if(A>=C & B>=D)retval = "D";
   
   
   
 return retval;
}
