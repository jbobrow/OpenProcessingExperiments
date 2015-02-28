
float mv = 0;


void setup(){
  smooth();
  size(250, 250);
  frameRate(20);
}

void draw(){
  //
  
  float d = dist(mouseX, mouseY, pmouseX, pmouseY);

  rectMode(CENTER);
  fill(0, mouseX/12);
  noStroke();
  rect(height/2, height/2, height, width);
  //
  mv += 8;
  fill(mouseY,mouseX,150,random(50, 150));
  rect(mv, 250, 7+d/2,175+random(-100, 350));
   
if( mv >= 260 ){
  mv = -2;
}
}
