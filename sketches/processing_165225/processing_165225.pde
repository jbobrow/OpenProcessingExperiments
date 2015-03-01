

int xpos;
int ypos;

int fsize =100;

float angle=0;
float step=0;


void setup() {
  
  size(300,300);
  
  rectMode(CENTER);
  
  strokeWeight(1);
  xpos=width/2;
  ypos = height/2;

  fsize =150;
 
  fill(100,255,125);
}

void draw() {
stroke(0);
  background(25,75,0);  
  fill(100,255,125);
  if (mousePressed) {
    step +=0.1;
    angle= cos(step);
  }
 
  float offsetX = map(mouseX, 0, width, -10, 10);
  float offsetY = map(mouseY, 0, width, -10, 10);

  // BODY
  rect(xpos, ypos, fsize, fsize/2, fsize/3);
  // HEAD
  ellipse(xpos, ypos-fsize/3, fsize, fsize/2);
  // MOUTH  
  curve(xpos-fsize/3, ypos + fsize/3 -fsize/2, 
  xpos-fsize/4, ypos+fsize/5-fsize/2, 
  xpos+fsize/4, ypos+fsize/5-fsize/2, 
  xpos+fsize/3, ypos+fsize/3-fsize/2);
  
  //EYES
  fill(255,255,200);
  ellipse(xpos-fsize/3, ypos-fsize/2, fsize/3, fsize/3);
  ellipse(xpos+fsize/3, ypos-fsize/2, fsize/3, fsize/3);
  fill(100,255,125);
  // RETINA
  strokeWeight(7);
  point(xpos+fsize/3+offsetX, ypos-fsize/2+offsetY);
  point(xpos-fsize/3+offsetX, ypos-fsize/2+offsetY);
  strokeWeight(2);
  // LEFT LEG
  pushMatrix();
  translate(xpos-fsize/3, ypos+fsize/4);
  rotate(angle);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  -fsize*1/12, fsize*3/10);
  ellipse(-fsize*1/12, fsize*3/10, 5, 5);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  0, fsize*7/20);
  ellipse(0, fsize*7/20, 5, 5);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  +fsize*1/12, fsize*3/10);
  ellipse(fsize*1/12, fsize*3/10, 5, 5);
  popMatrix();
  // RIGHT LEG
  pushMatrix();
  translate(xpos+fsize/3, ypos+fsize/4);
  rotate(-angle);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  -fsize*1/12, fsize*3/10);
  ellipse(-fsize*1/12, fsize*3/10, 5, 5);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  0, fsize*7/20);
  ellipse(0, fsize*7/20, 5, 5);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  +fsize*1/12, fsize*3/10);
  ellipse(fsize*1/12, fsize*3/10, 5, 5);
  popMatrix();
  
  // crown 
  //rect(xpos, ypos-50, fsize/2, fsize/2,);
  pushMatrix();
  fill(255,255,0);
  stroke(255,255,0);
  translate(xpos, ypos-fsize*5/8);
  rotate(PI);
  //rotate(-angle);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  -fsize*1/12, fsize*2/10);
  ellipse(-fsize*1/12, fsize*2/10, 5, 5);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  0, fsize*5/20);
  ellipse(0, fsize*5/20, 5, 5);
  bezier(0, 0, 
  0, fsize/10, 
  0, fsize*2/10, 
  +fsize*1/12, fsize*2/10);
  ellipse(fsize*1/12, fsize*2/10, 5, 5);
  noStroke();
  rect(0,0,30,20);
  popMatrix();
  
}
