

float r; 
float a ;
float b ;
float p ;
float q ;

void setup(){
  
  size(400,400);
  background(255);
  smooth();
   r = random(10,30);
   a = random(r, width-r);
   b = random(r, height-r);
   p = random(-20,20);
   q = random(-10,10);
            }

void draw(){
  background(255);
  ellipse(a,b,r,r);
  
  a+=p;
  b+=q;

if (a<=r){
  p = -p;}

if (b<=r){
  q=-q;}
if(a>=width+r){
  p=-p;}
if(b>=height+r){
  q=-q;}
}
  
  





