
void setup(){
  
  size(600, 600);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}

void draw(){
  background(217,185,128,200);
  fill(255,200);
  rect(150, 300, width/6, height/6);
  
  if((mouseX>150) && (mouseX<250)) {
    fill(46,94,94);
    rect(150,300,width/5, height/5);
  }
  
  fill(255,200);
  ellipse(450,300, width/6, height/6);
  
  if((mouseX>450) && (mouseX<550)) {
    fill(191,28,31);
    ellipse(450,300, width/5, height/5);
  }
}


