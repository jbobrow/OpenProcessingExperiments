

PFont f;
 
 void setup() {
 size(360,600);
  background(0);
 f=loadFont("AmiR-HM-100.vlw");
 textFont(f);
 }
 
 void draw() {
 background(0);
 int s=second();
 int m=minute();
 int h=hour();
 
  noStroke();
  colorMode(RGB,255);  
  fill(255,158,0);
  rect(185,40,m*3,100);
  fill(203,255,0);
  rect(130,150,100,s*7);
  fill(150,100,200);
  rect(170,40,-h*3,100);
  
 
 String time = nf(h,2)+":"+nf(m,2)+":"+nf(s,2);
 

 textAlign(CENTER);
 text(time,width/2,height/2);
 
 }

 



