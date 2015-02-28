
float a= 1.5;
float b =10;
void setup () {
  size (800,600);
  background (0);
}

void draw () {
  noFill();
  smooth();
  strokeWeight (3);
  stroke (a,a++,a++);
  bezier (0,a/b,b/2*a,30,300,300,650,600);
//a = a+50;
 if(a>=600 || a<=0) {
b= b *2;}

}

   


