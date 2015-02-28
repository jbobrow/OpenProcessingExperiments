
int edgey=350;
int edgex=40;
int value=255;
float valueX;
float valueY;
float trans;

void setup() {
  size(400, 400, P2D);
  smooth();
  background(120);
}

void draw() {
  background(valueY, 0, 255-valueY,valueX);
  fill(0,255-trans);
  rect(0,0,width,height);
  stroke(0);
  strokeWeight(2);
  line(20,height/2,40,height/2);
  line(width-40, height/2,width-20,height/2);
  line(width-30, height/2-10, width-30, height/2+10);
  
  
  float mx= mouseX/20;

  float offsetA=0;
  float offsetB=0;

  if (mouseY>180) {
    offsetA=random(-mx, mx);
  }

  if (mouseY<210) {
    offsetB=random(-mx/10, mx/10);
  }

  for (int c=30;c<100; c +=40) {
    for (int d=60; d<360; d+=40) {
      fill(0);
      noStroke();
      ellipse(d+5-offsetB, c+5+offsetB, 20, 20);
      fill(255);
      ellipse(d-offsetB, c+offsetB, 20, 20);
    }
  }



  for (int l=30; l<360; l=l+20) {
    edgex=l+10;
    fill(255);
    noStroke();
    beginShape();
    vertex(l, height);
    vertex(l+40, height);
    vertex(edgex-offsetA, edgey);
    endShape();
  }



  for (int i=30; i<370; i +=20) {


    edgex=i+10;
    fill(0);
    noStroke();  
    beginShape();
    vertex(i, height);
    vertex(i+20, height);
    vertex(edgex-offsetA, height-50);
    endShape();
  }

  valueY = mouseY*255/400;
  if (mouseY>height) {
    mouseY=width;
  }
  
  valueX= mouseX*100/400;
  if (mouseX>width){
    mouseX=width;
  }
  
  trans=((mouseX+150)*255/400);
  /*if (trans<100){
    trans=100;
  }*/
}


