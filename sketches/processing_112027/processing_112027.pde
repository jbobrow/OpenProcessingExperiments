
//import processing.pdf.*;

PImage hand;
float x,angle;
float y = 0;//0;what mean?
float r =100; 
float rr=90;
float a =10;
void setup(){
  size(673,600);
  background(255);
  hand = loadImage("hand.png");
  
//beginRecord(PDF, "lalal");
} 

void draw(){
 beginShape();
 vertex(243,549);
 bezierVertex(243,50,266,122,300,109);
 endShape();
  image(hand,60,60);
  translate(0,0);
 
  x = r*sin(angle);
  y = r*sin(angle);
  r=r-a;
  noFill();
  stroke(0.1,25);
  
ellipse(299,161,x,y);
ellipse(414,115,x,y);
ellipse(523,145,x,y);
ellipse(630,300,x-10,y-10);
ellipse(112,475,x,y);

//ellipse(x/2,y/2,20,20);

angle = angle+0.1;
println(mouseX+","+mouseY);

if(r == 0||r==100){
  a = a*-1;
}
}
/*
void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
*/
