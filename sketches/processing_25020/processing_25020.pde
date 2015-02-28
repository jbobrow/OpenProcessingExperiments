
void setup(){
  size(300,300);
  background(0);
  
  noCursor();
  colorMode(HSB,255);
}

void draw(){
  draw1();
  draw2();
  draw3();
  draw4();
}

void draw1(){
  pushMatrix();
  translate(mouseX,mouseY);
  translate(20*sin(frameCount/20.),20*cos(frameCount/20.));
  rotate(frameCount/20.);
  noStroke();
  fill((frameCount/10)%255,100,100,10);
  ellipse(0,0,30*sin(frameCount/20.),40*cos(frameCount/15.));
  popMatrix();
}

void draw2(){
  pushMatrix();
  translate(mouseX,mouseY);
  translate(2*sin(frameCount/20.),3*cos(frameCount/20.));
  rotate(frameCount/20.);
  noStroke();
  fill((frameCount/10+10)%255,255,255,10);
  ellipse(0,0,10*sin(frameCount/20.),20*cos(frameCount/15.));
  popMatrix();
}

void draw3(){
  pushMatrix();
  translate(mouseX,mouseY);
  translate(50*cos(frameCount/20.),40*sin(frameCount/20.));
  rotate(frameCount/20.);
  noStroke();
  fill((frameCount/10+20)%255,255,255,10);
  ellipse(0,0,10*sin(frameCount/20.+1),4*cos(frameCount/15.));
  popMatrix();
}

void draw4(){
  pushMatrix();
  translate(mouseX,mouseY);
  translate(50*cos(frameCount/20.+2),40*sin(frameCount/20.+2));
  rotate(frameCount/20.);
  noStroke();
  fill((frameCount/10+30)%255,255,255,10);
  ellipse(0,0,10*sin(frameCount/20.+0.4),4*cos(frameCount/15.+0.4));
  popMatrix();
}

