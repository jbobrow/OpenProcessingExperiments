
int w = 105;
int h = 100;
PImage mark;
float A,B,C,D;
void setup() {
  size(105, 100, P2D);
  mark=createImage(w+1,h,ARGB);
   
for (int y=0;y<h;y++){
  cnt[y] = new PVector(0,0,0);
  A= (int)random(w);
  B=(int)random(h);
  C= (int)random(w);
  D=(int)random(h);
  
  karl = Vlinex(A, B,C, D);
  mark.set(1,y,color(A,B,karl.length));
  for (int i = 0;i<karl.length;i++){
    stroke(1);
    point(karl[i].x,karl[i].y);
   mark.set(i+2,y,color(karl[i].x,karl[i].y,0)); 
  }
}
//image(mark,0,0);
  dx=w;
  dy=h;
}
PVector [] cnt= new PVector [h];

void draw(){
  fill(255);
  rect(0,0,w,h);
image(mark,0,0);
 for (int y=0;y<h;y++){
   color put = mark.get(1,y);
   float bb = put & 255;
   int b = int(bb);
    cnt[y].x++;
     if(cnt[y].x>b)cnt[y].x=0;
   for (int i = 0;i<int(cnt[y].x);i++){
     color paw = mark.get(i+1,y);
     float rr = paw>>16&255;
     float gg = paw>>8&255;
     stroke(1);
     point(rr,gg);
//    stroke(1);
//    point(karl[i].x,karl[i].y);
//  // mark.set(i+1,y,color(karl[i].x,karl[i].y,0)); 
 }
  }
}
void draw3(){
  background(255);
  for (int y=0;y<h;y++){
     int cc = mark.get(1,y);
     float bb = cc&255;
     int c = int(bb);
     cnt[y].x++;
     if(cnt[y].x>c)cnt[y].x=0;
    for (int i=0;i<c;i++){
     color ccc = mark.get(i+1,y);
    float rr = ccc>>16&255;
   float gg = ccc>>8&255;
  float bbc = ccc&255;
   stroke(rr,gg,bbc);
    point(rr,gg); 
    }
  }
  ellipse(mouseX,mouseY,20,20);
}

boolean don = true;
float dx;
float dy;
void mousePressed() {

  if (don==true) {
    dx=mouseX;
    dy=mouseY;
  }
  don = false;
}


void mouseReleased() {

  don = true;
}

PVector [] karl;
int  byx=1;
void draw1() {

  background(255);
  karl = Vlinex(dx, dy, mouseX, mouseY);
  stroke(1);
  for (int i = 0;i<karl.length;i+=byx){
// point(karl[i].x,karl[i].y);
noStroke();
fill(1,55);
 ellipse(karl[i].x,karl[i].y,4,4);
} 
}

PVector mx(float Ax, float Bx, float C, float D) {

  float A = abs(Ax-C);
  float B = abs(Bx-D);
  float retval2;
  retval2 = max(A, B);

  PVector retval = new PVector(A/retval2, B/retval2, retval2);

  return retval;
}


void linex(float A, float B, float C, float D) {

  PVector q = mx(A, B, C, D);
  int  aa  = int(q.z);
  
  float bb=0;
  float cc = 0;
  for (int i = 0;i<aa;i+=byx) {
    bb+=q.x;
    cc+=q.y;
    float lx1 = A+bb;
    String k = where(A, B, C, D);
    fill(i);
    if (k=="C")  pointx(lx1, B-cc);
    if (k=="A")  pointx(lx1, B+cc);
    if (k=="B")  pointx(A-bb, B+cc);
    if (k=="D")  pointx(A-bb, B-cc);
  }
}

void pointx(float A, float B) {
  noStroke();
  // fill(1);
  ellipse(A, B, 11, 11);
}
void pointv(float A, float B,PVector [] C,int D) {
  noStroke();
  // fill(1);
  C[D]= new PVector(A,B,0);
  //ellipse(A, B, 11, 11);
}

String where (float A, float B, float C, float D) {
  String retval = "";

  if (A<=C && B <=D)retval = "A";
  if (A>C && B<D)retval = "B";
  if (A<C && B>D)retval = "C";
  if (A>=C & B>=D)retval = "D";



  return retval;
}

PVector []  Vlinex(float A, float B, float C, float D) {

  PVector q = mx(A, B, C, D);
  int  aa  = int(q.z);
  PVector [] retval = new PVector [aa];
 
  float bb=0;
  float cc = 0;
  for (int i = 0;i<aa;i+=byx) {
    bb+=q.x;
    cc+=q.y;
    float lx1 = A+bb;
    String k = where(A, B, C, D);
    fill(i);
    if (k=="C")  pointv(lx1, B-cc,retval,i);
    if (k=="A")  pointv(lx1, B+cc,retval,i);
    if (k=="B")  pointv(A-bb, B+cc,retval,i);
    if (k=="D")  pointv(A-bb, B-cc,retval,i);
  }
  return retval;
}
