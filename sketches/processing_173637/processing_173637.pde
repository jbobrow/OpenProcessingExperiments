
//import processing.pdf.*;


size(800, 600);
//beginRecord(PDF,"ojo.pdf");
smooth();
background (#C59DFF);
noFill();
 
int a;
int b;
int c;
int d;
int e;
int f;

 
for(a=100; a<width; a=a+100){
for(b=100; b<height; b=b+100){
  stroke(random(0),random(255),random(0));
  strokeWeight(1);
  fill(random(255),random(0),random(0),random(100));
ellipse(a, b, 60, 60);
}
}
 
for(a=30; a< width; a=a+60){
 for(b=30; b<height; b=b+60){
   stroke(random(255),random(0),random(0));
  strokeWeight(2);
 fill(random(255),random(255),random(255),random(100));
 ellipse(a, b, 50, 50);
}
}
 
for(c=0; c<=width; c=c+60){
for(d=0; d<=height; d=d+60){
  stroke(random(0),random(0),random(250));
  strokeWeight(1);
 //fill(random(100),random(100),random(100),random(50));
ellipse(c, d, 80, 80);
}
}
 
for(e=60; e<width; e=e+60) {
for(f=30; f< height; f=f+60) {
  stroke(random(255));
  strokeWeight(1);
  fill(random(155),random(255),random(175),random(80));
    ellipse(e, f, 20, 20);
  }
float g=0.01;
strokeWeight(1+g);
 
for(int i=0;i<=width;i=i+6){
stroke(0,70);
line(0,i,i-10,height);
line(i,0,width,i-10);

}

}
//endRecord ();
