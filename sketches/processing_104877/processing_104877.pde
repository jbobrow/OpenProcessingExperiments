
void setup() {
  size(490, 500);
  background(245,240,235);

  noStroke();
  fill(250,224,93);
  rect(300,0,150,175);
  rect(0,362.5,50,200);
  
  fill(255,68,39);
  rect(50,50,250,250);
  rect(450,362.5,50,150);
  
  fill(43,20,139);
  rect(300,362.5,150,100);
  
  fill(31,24,59);
  rect(50,300,125,125);
  rect(175,425,125,40);
  
  stroke(0);
  strokeWeight(10);
  strokeCap(SQUARE);
  //horizontal
  line(10,50,450,50);
  line(10,175,50,175);
  line(300,175,450,175);
  line(50,300,450,300);
  line(10,362.5,50,362.5);
  line(175,362.5,500,362.5);
  line(50,425,300,425);
  line(175,462.5,450,462.5);
  //vertical
  line(50,50,50,490);
  line(100,10,100,50);
  line(175,300,175,490);
  line(300,10,300,462.5);
  line(375,175,375,300);
  line(450,10,450,490);
}

int counter = 0;

void draw() {
  counter++;
  if (counter>=255)
  {counter=0;}
  
  fill(counter,0,0);
  noStroke();
  ellipse(mouseX,mouseY,10,10);
}

