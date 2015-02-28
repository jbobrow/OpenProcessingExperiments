
int a=150;
int b=0;
int c=0;
void setup(){
  size(300,600);
  smooth();
  frameRate(25);
}
 
void draw(){
  
  background(255);
  b=b+10;
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
fill(a,0,b);
ellipse(a,b,80+b/3,80+b/3);
fill(a*2,0,b);
ellipse(a-25,b,30,30);
ellipse(a+25,b,30,30);
//ellipse(mouseX,mouseY,80,80);
fill(a*3,b/2,0);
rect(a,b+80,40,80,9);
triangle(a-5,b+10,a+5,b+10,a,b+15);
triangle(a-15,b+28,a+15,b+28,a,b+38);
strokeWeight(10);
line(a+20,b+60,a+50,b);
line(a-20,b+60,a-50,b);
line(a-5,b+120,a-40,b+95);
line(a+5,b+120,a+40,b+95);
strokeWeight(0);
if(b>=600){
  b=c;
}
}
