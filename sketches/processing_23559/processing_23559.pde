
void setup () {
  size(200,200);
  background(255,204,0);
  smooth();
  stroke(255);
  line(70,100,130,100);
  rectMode(CORNER);
  rect(85,70,30,70);
  /*point(111,30);
   point(89,30);*/
  stroke(255,0,0);
  strokeWeight(3);
  line(70,100,40,70);
  line(130,100,160,70);
  line(85,140,75,185);
  line(115,140,125,185);
  strokeWeight(1);
  rect(125,185,15,10);
  rect(60,185,15,10);
  noStroke();
  ellipse(100,40,70,70);
  fill(255);
  stroke(255);
  strokeWeight(3);
  line(70,100,130,100);
  rectMode(CORNER);
  noStroke();
  rect(85,70,30,70);
  stroke(200);
  strokeWeight(1);
  ellipse(111,30,15,12);
  ellipse(89,30,15,12);
  println(frameCount);
}
void draw() {
  background(255,204,0);
  smooth();
  stroke(255);
  fill(255);
  line(70,100,130,100);
  rectMode(CORNER);
  rect(85,70,30,70);
  stroke(255,0,0);
  strokeWeight(3);
  line(70,100,40,70);
  line(85,140,75,185);
  line(115,140,125,185);
  strokeWeight(1);
  rect(125,185,15,10);
  rect(60,185,15,10);
  noStroke();
  ellipse(100,40,70,70);
  fill(255);
  stroke(255);
  strokeWeight(3);
  line(70,100,130,100);
  rectMode(CORNER);
  noStroke();
  rect(85,70,30,70);
  stroke(200);
  strokeWeight(1);
  fill(mouseX,0,0);
  ellipse(111,30,15,12);
  ellipse(89,30,15,12);
  println(frameCount);

  stroke(255,0,0);
  strokeWeight(3);
  line(130,100,mouseX,mouseY);
  println(frameCount);
}



//arc(80,100,10,5,120,180);
//curve(80, 40, 5, 26, 73, 24, 73, 61);


