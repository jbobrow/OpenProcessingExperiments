
int i=0;
int x =200;
int y =200;
int a =600;
int b =500;
void setup(){
  size(800, 700);
background(#FF0303);

}

void draw(){
  fill(i);
  ellipse( x, y, i, i);
   ellipse(a,b,i,i);
   ellipse(x,b,i,i);
   ellipse(a,y,i,i);
 i=i+1; 
 
 if (i>600){
   noLoop();


 }}


