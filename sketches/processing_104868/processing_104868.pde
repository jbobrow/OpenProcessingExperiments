
//Random function does not work on site
int w = (int) random(100,500);
float armY;


void setup(){
  size(400,400);
  smooth();
  
}

void draw(){
  background(255);
  armY = map(mouseY,0,height,width/8,0);
  
  noStroke();
  fill(131,72,12);
  //ear LHS
  ellipse(width/3, height/5, width/4, width/4);
  //ear RHS
  ellipse(width/1.5,height/5,width/4,width/4);
  //body
  fill(131,72,12);
  ellipse(width/2, height/1.5, width/2, height/1.9);
  //head
  fill(185,112,37);
  ellipse(width/2,height/3,width/2,height/2);
  //LHS eye
  fill(0);
  ellipse(width/2.8,height/3,width/9,height/9);
  //RHS eye
  ellipse(width/2.8+(width/2-width/4.5),height/3,width/9,height/9);
  //nose
  ellipse(width/2, height/2.5, width/15, height/17);
  //mouth
  //ellipse(width/2, height/2, width/6, width/14);
  //hands
  fill(77,43,8);
  ellipse(width/3, (height/1.5-armY), width/8, width/8);
  //hands
  ellipse(width/1.5, (height/1.5-armY), width/8, width/8);
  //feet
  ellipse(width/3, height/1.2, width/8, width/8);
  //feet
  ellipse(width/1.5, height/1.2, width/8, width/8);
  
  
}
