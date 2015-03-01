


void setup(){
   
  size(800, 1000);
  background(22,11,33);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}
 
void draw(){
  background(2,185,128);
  fill(200,200);
  rect(150, 500, width/6, height/6);
   
  if((mouseX>200) && (mouseX<250)) {
    fill(46,94,94);
    rect(150,300,width/5, height/5);
  }
   
  fill(12,200);
  ellipse(699,300, width/6, height/6);
   
  if((mouseX>450) && (mouseX<550)) {
    fill(191,28,31);
    ellipse(450,300, width/5, height/5);
  }
}


