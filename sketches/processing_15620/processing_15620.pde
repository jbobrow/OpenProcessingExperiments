
float[] x = new float[3000];
PImage a, b, c;
 
int wCen, hCen,yCen,cloCir, halfCir1,myCir, myR1, myR2, myR3;
void setup() {
  size (360,600);
  stroke(255);
  smooth();
  a= loadImage("yi1.jpg");
  b= loadImage("yi2.png");
  c= loadImage("yi3.png");
  
  noStroke();
fill(255,200);
for (int i = 0; i < x . length; i ++) {
  x[i] = random(-1000,200);
}
}
 
void draw () {
 
 a=loadImage("yi1.jpg");

image(a,0,0,360,600);
   
 fill(198,143,172);
noStroke();
  for (int i = 0 ; i < x.length ; i++){
    x[i]+=1;
    float y = i * 10;
    image(b, x[i],y);
}
  
 wCen  = width/2;
  hCen = height/2-10;
  wCen=200;
  cloCir = 200;
  myCir=250;
  halfCir1 = cloCir/2 - 2 ;
  myR1= myCir/2-2;
myR2= myCir/2-20;
myR3= myCir;
  
PImage  c;

c = loadImage("yi3.png");

  float j = map(second(), 0, 60, 0, TWO_PI) -  HALF_PI;
   float p = map(minute(), 0, 60, 0, TWO_PI) -  HALF_PI;
    float b = map(hour()% 12, 0, 12, 0, TWO_PI) -  HALF_PI;
     
 
    image( c, cos(j) * myR1 + 360, sin(j) *  myR1+hCen,120,120);
    line( 360, hCen, cos(p) * myR2 + 360, sin(p) * myR2+hCen);
    line( 360, hCen, cos(b) * myR3 + 360, sin(b) * myR3+hCen);
 
   float s = map(second(), 0, 60, 0, TWO_PI) -  HALF_PI;
   float m = map(minute(), 0, 60, 0, TWO_PI) -  HALF_PI;
    float h = map(hour()% 12, 0, 12, 0, TWO_PI) -  HALF_PI;
     
   
    image(c, cos(s) * myR1+ 0, sin(s) *  myR1+hCen,120,120);
    line( 0, hCen, cos(m) * myR2 + 0, sin(m) * myR2+hCen);
    line(0, hCen, cos(h) * myR3 + 0, sin(h) * myR3+hCen);
   
 
   

   
 
  
}  


