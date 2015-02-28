
float move= 10;
float move2= 10;
float flyX, flyY;
float tongue= 0.15;

  
void setup(){
  size(400,400);
  smooth();
  frameRate(40);
}


void draw() {
  background(100);
  fill(0,255,0);
  rect(50, 320, 100, 30);
  rect(125, 320, 100, 30);
  ellipse(140, 280, 100, 150);
  rect(120, 250, 30, 110);
  rect(150, 250, 30, 110);
  triangle(250, 250, 200, 175, 100, 220);
  fill(0,0,255);
  ellipse(mouseX, mouseY, 20, 20);
  fill(255);
  ellipse(190, 170, 20, 20);
  ellipse(100, 210, 20, 20);
  fill(0);
  ellipse(190, 170, 10, 10);
  ellipse(100, 210, 10, 10);
  fill(227,48, 215);
  stroke(227,48,215);
  strokeWeight(10);
  line(152, 200, move, move2);
  stroke(0);
  strokeWeight(1);
  fill(0,255,0);
  triangle(move, move, 200, 175, 100, 220);
  flyX= mouseX ;
  float flyDist= flyX-move;
  if (abs(flyDist)>1){
    move += flyDist* tongue;
  }
  flyY= mouseY ;
  float flyDist2= flyY-move2;
  if (abs(flyDist2)>1){
    move2 += flyDist2* tongue;
  }
}
