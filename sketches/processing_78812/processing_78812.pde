
int triX=350;
int triY=-20;
int tri2X=-350;
int tri2Y=-20;
int lastSecond=0;
int xx,yy,cc=300,dd=400;
int trans=80;
int aa=(triX+300);
void setup() {
  size(920,890);
  smooth();
  background(0, 151, 121);
  frameRate(100);
}
 
void draw() {
 
 
  SS();

  bg();
}
 
void SS() {
 
  noStroke();
 
  xx+=1;

  translate(310, 230);
 
  /////second/////
  if(xx>30) {
 
    float s=map(second(),-40,100,0,TWO_PI)-HALF_PI;
    rotate(s);
    fill(random(6),random(234),50,trans);
    triangle(triX,triY,aa-=30,triY,(triX+25),(triY-40));
 
    xx=0;
  }
 }
void bg() {
  fill(255);
 
  ellipse(310,230,5,5);
  for (int k = 0; k < width; k+=70) {
    for (int l = 0; l< height+100; l+=70) {
      noStroke();
 
      fill(255,255,255,100);
      ellipse(k,l,3,3);
    }
  }
}




