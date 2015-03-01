
PVector posH, posM, posS;
int size=1000;
color colorH, colorHL, colorM, colorS;
float h, m, s, e, f, hcg, mcg, scg, hcr, mcr, scr, hcb, mcb, scb;

void setup() {
  smooth();
  size(size, size);
  background(50);
  posH=new PVector(width/2, height/2);
  posM=new PVector(width/2, height/2);
  posS=new PVector(0, 0);
}

void draw() {
  displayH();
}

void displayH() {

  pushMatrix();
  h=map(hour(), 0, 12, 0, 360);
  hcr=map(hour(), 0, 24, 0, 255);
  hcg=map(hour(), 0, 24, 0, 255);
  hcb=map(hour(), 0, 24, 0, 255);
  mcr=map(minute(), 0, 60, 80, 255);
  mcg=map(minute(), 0, 60, 80, 255);
  mcb=map(minute(), 0, 60, 80, 255);
  scr=map(second(), 0, 60, 180, 255);
  scg=map(second(), 0, 60, 180, 255);
  scb=map(second(), 0, 60, 180, 255);
  colorH=(color(hcr, hcg, hcb));
  colorHL=(color(255));
  translate(posH.x, posH.y);
  rectMode(CENTER);
  rotate(radians(h));
  noStroke();
  fill(colorH);
  ellipse(0, 0, size, size);
  noStroke();
  fill(colorHL);
  ellipse(0, -size/2+0.4*size, 0.8*size, 0.8*size);
  posM.x=0;
  posM.y=-size/2+0.4*size;


  pushMatrix();
  m=map(minute(), 0, 60, 0, 360);
  colorM=(color(mcr, mcg, mcb));
  translate(posM.x, posM.y);
  rectMode(CENTER);
  rotate(radians(m-h));
  noStroke();
  fill(colorM);
  ellipse(0, -size*0.15, size/2, size/2);
  posS.x=0;
  posS.y=-size*0.15;


  pushMatrix();
  s=map(second(), 0, 60, 0, 360);
  colorS=(color(scr, scg, 0));
  translate(posS.x, posS.y);
  rectMode(CENTER);
  e=s+1/60;
  f=e;
  rotate(radians(f-m));
  noStroke();
  fill(colorS);
  ellipse(0, -size/8, size/4, size/4);

  popMatrix();





  popMatrix();

  popMatrix();
}


