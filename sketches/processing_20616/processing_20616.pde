
int triX=-10;
int triY=-20;
int tri2X=-10;
int tri2Y=-20;
int lastSecond=0;
int xx,yy,cc=30,dd=30;
int trans=80;
int aa=(triX+300);
void setup() {
  size(640,480);
  smooth();
  background(255);
  frameRate(30);
}

void draw() {


  SS();
  MM();
  bg();
}

void SS() {

  noStroke();

  xx+=1; 
  pushMatrix();
  translate(310, 230);

  /////second/////
  if(xx>30) {

    float s=map(second(),0,60,0,TWO_PI)-HALF_PI;
    rotate(s);
    fill(random(255),random(255),10,trans);
    triangle(triX,triY,aa-=3,triY,(triX+275),(triY-40));

    xx=0;
  }

  popMatrix();
}
void MM() {

  pushMatrix();
  translate(310, 230);
  float m=map(minute(),0,60,0,TWO_PI)-HALF_PI;
  rotate(m);
  fill(255);
  ellipse(0, 0, cc+20,dd+20);
  fill(150,0,100,140);
  arc(0, 0, cc,dd, 0, PI*2-PI/20);

  popMatrix();
  /////////////   
  pushMatrix();
  translate(310, 230);
  float h=map(hour(),0,60,0,TWO_PI)-HALF_PI;
  rotate(h);
  fill(250,100,0,80);
  arc(0, 0, cc+20,dd+20, radians(-30), radians(-10));
  fill(255);
  ellipse(310,230,5,5);
  popMatrix();
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



