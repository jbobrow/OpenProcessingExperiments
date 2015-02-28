

float x = 300;
 float m = 5;
 float y = 300;
 float p = 5;
 float a = 300;

 float j = 5;
 float b = 300;
 float k = 5;

 float o = 10;
 float n = 10;
 float q = 500;
 float e = 370;
 float d = 360;

 float z = 452.5;
 float i = 400;
 float l = 20;
 float w = 20;
 float v = 500;

 float c = 555;
 float f = 350;
 float g = 30;
 float h = 30;
 float r = 500;

 void setup(){
 size(600,600);
 stroke(5);
 }

 void draw(){
 
rectangleH();
 rectangleV();
 rectangleH1();
 rectangleH2();
 circle1();
 circle2();
 circle3();
 }

 void rectangleH(){

 fill(0,0,0,10); //white background with 20 opacity
 noStroke(); 
rect(0,0,width,height);
 fill(255);
 rect(x, 300, 50, 50); //creates the rectangles
 if(x==width){
 m=m*(-1);}
 if(x<0){
 m=m*(-1);}
 x-=m;
 }

 void rectangleV(){
 noStroke(); 
fill(255);
 rect(300, y, 50, 50); //creates the rectangles
 if(y==height){
 p=p*(-1);}
 if(y<0){
 p=p*(-1);}
 y+=p;
 }

 void rectangleH1(){

 fill(0,0,0,10); //white background with 20 opacity
 noStroke(); 
rect(0,0,width,height);
 fill(255);
 rect(a, 300, 50, 50); //creates the rectangles
 if(a==width){
 j=j*(-1);}
 if(a<0){
 j=j*(-1);}
 a+=j;
 }

 void rectangleH2(){
 noStroke(); 
fill(255);
 rect(300, b, 50, 50); //creates the rectangles
 if(b==height){
 k=k*(-1);}
 if(b<0){
 k=k*(-1);}
 b-=k;
 }

 void circle1(){
 noStroke();
 fill(random(256));
 ellipse(e,d,o,n);
 e+= 20*cos(radians(q)) ;
 d+= 20*sin(radians(q)); 
q+=20;
 }
 
void circle2(){
 noStroke();
 fill(random(256));
 ellipse(z,i,w,l);
 z+= 100*cos(radians(v)) ;
 i+= 100*sin(radians(v)); 
v+=400;
 }
 void circle3(){
 noStroke();
 fill(random(256));
 ellipse(c,f,g,h);
 c+= 300*cos(radians(r)) ;
 f+= 300*sin(radians(r)); 
r+=800;
 }

