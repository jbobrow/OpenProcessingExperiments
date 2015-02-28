
// Clock

float sizeBall= 300; //Size of Ball of seconds
float sizeBall2= 400; // Size of Ball of minutes
float sizeBall3= 500; // Size of Ball of hours

void setup() {
size(500, 500); // Size of canvas
}
float d; // new variable for a
float e; // new variable for b
float f; // new variable for c
  

void draw() {
  background(255);
  
float a = map(second(), 0, 59, 0, width-100);
fill(50, 50, 200, 50);
ellipse(50, 250, sizeBall, sizeBall);

float b = map(minute(), 0, 59, 0, width-100);
fill(0, 200, 100, 50);
ellipse(50, 250, sizeBall2, sizeBall2);

float c = map(hour(), 0, 23, 0, width-100);
fill(0, 200, 200, 50);
ellipse(50, 250, sizeBall3, sizeBall3);

if (d!=a){
  sizeBall++;
}
d=a;

if (e!=b){
  sizeBall2++;
}
e=b;

if (f!=c){
  sizeBall3++;
}
f=c;

}
