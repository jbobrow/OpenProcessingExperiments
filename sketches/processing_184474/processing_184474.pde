
void setup(){
  size(400,400);
  noStroke();
  smooth();
}

void draw(){
  float x=mouseX;
  float y=mouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;
  background(196,142,72);
  road();
  firstcar();
  secondcar();
  tumbleweed();
  cactus();
}

void road(){
  noStroke();
  fill(0);
  rect(0,250,400,100);
  for(int s=0;s<=400;s+=50){
    fill(252,220,59);
    rect(s,295,20,10);
  }
}

void firstcar(){
  noStroke();
  fill(255,0,51);
  rect(mouseY,270,30,10);
  ellipse(mouseY+10,270,20,20);
  fill(150);
  ellipse(mouseY+7,280,10,10);
  ellipse(mouseY+22,280,10,10);
}

void secondcar(){
  noStroke();
  float ix=width-mouseY;
  fill(191,239,255);
  rect(ix,320,30,10);
  ellipse(ix+20,320,20,20);
  fill(150);
  ellipse(ix+7,330,10,10);
  ellipse(ix+22,330,10,10);
}

void tumbleweed(){
  float a=random(50);
  float b=random(40);
  float c=random(40);
  float d=random(40);
  float r=random(4);
  stroke(139,71,38);
  strokeWeight(r);
  noFill();
  ellipse(mouseX,mouseY,a,b);
  ellipse(mouseX,mouseY,b,c);
  ellipse(mouseX,mouseY,c,d);
  ellipse(mouseX,mouseY,d,a);
  ellipse(mouseX,mouseY,a,c);
  ellipse(mouseX,mouseY,b,d);
}

void cactus(){
  noStroke();
  fill(162,201,58);
  rect(340,100,20,60);
  ellipse(350,100,20,20);
  rect(320,130,20,10);
  ellipse(325,130,10,10);
  rect(360,120,20,10);
  ellipse(375,120,10,10);
}
