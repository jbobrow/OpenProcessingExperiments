
//coffee and icecream
//YY

void setup() {
  size(800,450);
  background(#FFFFFF);
  smooth();
}

void draw() {
  translate(width/2, height/2);
  smooth();
  fill(#000000);
  strokeWeight(2);
  strokeJoin(ROUND);
  line(-75,50,-75,65); //draw front right leg
  noStroke();
  ellipse(-85,67,25,9);//draw front right foot
  //strokeWeight(2);
  //draw body
  fill(124,50,8);
  stroke(0);
  strokeWeight(2);
  strokeJoin(ROUND);rect(-100,-50,175,100);
  translate(-100,-50);
  noStroke();
  fill(229,115,172);
  ellipse(-7,45,27,45); //draw tongue
  stroke(0);
  strokeWeight(2);
  strokeJoin(ROUND);
  fill(124,50,8);
  quad(-50,-50,50,-50,30,50,-30,50); //draw head
  fill(#000000);
  ellipse(-10,35,45,15); //draw nose
  fill(#FFFFFF);
  ellipse(-20,-20,37,37);
  ellipse(7,-15,37,37);
  fill(#000000);
  ellipse(-20,-10,5,5);
  ellipse(7,-5,5,5);
  
}
