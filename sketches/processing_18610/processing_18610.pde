
//drawing program
//by maria fang
//week1 jan18 2010

void setup() {
  size(600,600);
  smooth();
  background(#62FFFB);
}

void draw() {

  fill(225,50);
  stroke(255,255,255);
  line(mouseX,mouseY,300,300);

  stroke(0); 
  fill(116,0,0,5);
  arc(300, 300, mouseX, mouseY, 0, PI/2);
  arc(300, 300, mouseX, mouseY, PI/2, PI);
  arc(300, 300, mouseX, mouseY, PI, TWO_PI-PI/2);
  arc(300, 300, mouseX, mouseY, TWO_PI-PI/2, TWO_PI);

  fill(252, 248, 161);
  noStroke();
  ellipse(mouseX,mouseY, 10, 10);
}


