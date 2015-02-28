
float a= 1.5;
float b =10;
void setup () {
  size (800,600);
  background (186,255,15);
}

void draw () {
  noFill();
  smooth();
  strokeWeight (3);
  stroke (a/b,b--,a++);
  bezier (0,a/b,100/b*a,30,300,300,650,600);
  stroke (a,b,a++);
  bezier (800,b/a,b,30/a,b,300,b/10,600);
  noFill();

smooth();
strokeWeight(10);
beginShape();
vertex(300-b,600);
vertex(100,b);

endShape();
//a = a+50;
 if(a>=600 || a<=0) {
b= b *2;}

}
/*void mousePressed() {
  //saveFrame("psico-####.png");
  
}*/
   


