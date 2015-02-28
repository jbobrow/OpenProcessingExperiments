
void setup(){
  size(500,500);
}

void draw(){
  background(240);
  smooth();
  stroke(50,200,50);
  strokeWeight(5);
  line(110,190,300,50);
  line(260,290,300,50);
  line(300,50,330,70);
  noStroke();
  fill(50,200,50);
  ellipseMode(CORNER);
  ellipse(330,50,150,50);
  fill(255,0,0);
  noStroke();
  ellipse(50,170,100,100);
  ellipse(210,270,100,100);
  fill(255);
  ellipse(120,200,30,30);
  ellipse(280,300,30,30);
  fill(0);
  ellipse(135,210,15,15);
  ellipse(295,315,15,15);
}



