
int a=0,x=0, y=60, z=80, w=40,
    l=500,h=400;
void setup(){
  size(500,400);
  fill(255);
  smooth();
  noStroke();
  frameRate(10);
}
void draw(){
background(0); 
 if(a==0){
   fill(255,255,0);
   arc (x, 180, 100, 100, PI/7,PI+2.7 );
   fill(255);
   ellipse(w,180,10,10);
   fill(255);
   ellipse(y,180,10,10);
   fill(255);
   ellipse(z,180,10,10);
 a=1;}
 else{
   fill(255,255,0);
   arc (x, 180, 100, 100, 0,TWO_PI);
   fill(255);
   ellipse(y,180,10,10);
   fill(255);
   ellipse(z,180,10,10);
   a=0;
 }
 if(x>l+30){
   x=0;}
 else{
    x++;}
 if(y>l+30){
   y=0;}
 else{
    y++;}
 if(z>l+30){
   z=0;}
 else{
    z++; }
 if(w>l+30){
   w=0;}
 else{
    w++; }
 y=y+10;
 z=z+10;
 x=x+10;
 w=w+10;
 }


