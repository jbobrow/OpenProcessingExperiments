
float dim = 60;

void setup() {
  size(400,400);
  fill(81,126,185);
  noStroke();
  rect(0,0,width,height);
  noStroke();
  fill(55,129,0);
  ellipse(30,height,400,500);
  ellipse(300,height,500,400);
  
}

void draw(){
}

void mousePressed() {
  fill(#855723);
  noStroke();
  rect(mouseX-15,mouseY,dim/2,dim);
  noStroke();
  fill(#9acd32);
  ellipse (mouseX,mouseY,dim,dim);
  
}

void keyPressed() {
  if (key =='s') {
    noStroke();
    fill(255,206,0);
  ellipse(mouseX,mouseY,dim,dim);
  } if (key =='w') {
    noStroke();
    fill(#6495ed);
  ellipse(mouseX,mouseY,dim+30,dim/2);
  
  }
}

