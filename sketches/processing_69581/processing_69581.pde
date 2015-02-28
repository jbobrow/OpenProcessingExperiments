
int x=25;
int bandera=1;
void setup () {
size (800,400);
fill (0,255,255);
}
void draw () {
  background (255);
ellipse(x,height-25,50,50);
if(x< width-25){
  if(bandera==1){
  x=x+1;
}
}
else{
bandera=0;
}
if( bandera==0) {
x=x-1;
if (x<=25){
  bandera=1;
  }
}
}
