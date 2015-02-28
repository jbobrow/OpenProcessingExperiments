
float[] y = new float[5];  // (a) 
void setup() {
 size(400, 200);
 for (int i=0;i<y.length;i++) { // (b) 
   y[i] = random(0.3*width, width); 
 }
}

void draw() {
 background(255);
 stroke(0);
 y[y.length-1] = mouseX;  // (c) 
 int minPos = findMinPos(y); // (d) 
 for (int j=0;j<y.length; j++) { // (e) 
   fill(128);
   if (j == minPos) { // (f) 
     fill(255, 0, 0 ); // (g) , (h) , (i) 
   }
   rect(0, 40*j+10, y[j], 25); 
   }
 }
 //function
 int findMinPos(float[] x) {
  int tentativePos = 0 ; //(j)
  for (int i=1;i<x.length;i++) { //(k) 
   println("for i="+i+" tentativePos="+
       tentativePos+" x[tentativePos]="
       + x[tentativePos] +"x[i]="+x[i]);
   if(x[tentativePos]>x[i]){  // (l) 
     tentativePos = i;
     println("i="+i+" x[i]="+x[i]);
   }
 }
 return tentativePos;  // (m)
}
