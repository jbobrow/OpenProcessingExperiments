
int w = 255;
int h = 255;
PVector [] karl;
 PImage tex;
 
void setup(){
 size(512,255);
smooth();
  tex = createImage(w,h,ARGB);
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
   //tex=get();
   linextex(dx,dy,mouseX,mouseY);
   int lx=0;
  int ly=0;
  color paw = tex.pixels[0];
  color lastcol=0;
  boolean found = false;
  for (int i =0;i<tex.pixels.length-1;i++){
    int y = int(i/w);
    int x = i - (y*w);
   color c = tex.pixels[i];
   color cx = tex.pixels[i+1];
   if(c!=paw){
     if(found && c == lastcol  ){
       stroke (c);
       line(x,y,lx,ly);
      // ellipse(x,y,10,10);
       // found = !found;
     }
     
     found = !found;
     if(lastcol!=c)found=true;
    lastcol = c;
    //if(cx!=lastcol){
     lx =x;
     ly=y;
   // }
     
   }
   
  
   if(i%w==0)found = false;
  }
 // background(255);
  image(tex,0,0);
 don = true;
}
void draw(){

rect(w,0,w,h);

linex(w+dx,dy,w+mouseX,mouseY);
   
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
  pathmax  = aa;
    float bb=0;
    float cc = 0;
      for (int i = 0;i<aa;i+=1){
        ipath=i;
      bb+=q.x;
      cc+=q.y;
      float lx1 = A+bb;
      String k = where(A,B,C,D);
     if(k=="C")  pointx(lx1,B-cc);
      if(k=="A")  pointx(lx1,B+cc);
      if(k=="B")  pointx(A-bb,B+cc);
       if(k=="D")  pointx(A-bb,B-cc);
 
 
      }
   
}
float lx=0;
float ly =0;
int ipath=0;
int pathmax=0;
void pointx(float A,float B){
  if(ipath==0 || ipath ==pathmax)point(A,B);
  if( ipath > 1 && int(A) != int(lx) && int (B) != int(ly)) {
    point (A,B);
   
  }
  lx = A;
  ly = B;
}

void pointtex(float A,float B){
  if(ipath==0 || ipath ==pathmax)point(A,B);
  if( ipath > 1 && int (B) != int(ly)) {
    point (A,B);
   tex.set(int(A),int(B),1); 
  }
  lx = A;
  ly = B;
}
 
 void linextex(float A,float B,float C,float D){
   
  PVector q = mx(A,B,C,D);
  int  aa  = int(q.z);
  pathmax  = aa;
    float bb=0;
    float cc = 0;
      for (int i = 0;i<aa;i+=1){
        ipath=i;
      bb+=q.x;
      cc+=q.y;
      float lx1 = A+bb;
      String k = where(A,B,C,D);
     if(k=="C")  pointtex(lx1,B-cc);
      if(k=="A")  pointtex(lx1,B+cc);
      if(k=="B")  pointtex(A-bb,B+cc);
       if(k=="D")  pointtex(A-bb,B-cc);
 
 
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

void keyPressed(){
 if(key=='c')background(255);
if(key=='r')setup();
}
