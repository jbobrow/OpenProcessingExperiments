
 
int a = 10;
int b = 0;
float c = 0;

 void setup() {
  size(900,600);
  smooth();
  background(65,67,10);
  noStroke ();
 }

 void draw() {

//rotate (c);    

if (b < 800) {
b = b + 70 ;
c = c + 0.1;
}
fill(203,random(69,154),random(21,40),150);
rect(150, b-210, 600, 170,700,200);

 }
 void mousePressed(){
 saveFrame("sutil.JPG");
}

