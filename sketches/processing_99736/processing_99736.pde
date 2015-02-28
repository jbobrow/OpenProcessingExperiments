
//Creative Computing
//Fervido Frias
//Clock
//April 14, 2013.

int seconds = 0;
PFont dig;

void setup() {
  size(400, 400);
  dig = loadFont("DS-Digital-BoldItalic-72.vlw");
  textFont(dig, 72);
}
void draw() {  
  
float p = map(second(), 0, 59, 0, 800);
rect(11,128,50,50);
  fill (p);
  background(255,255,0);
  
  
fill(390, random(198), p);
  ellipse(250, random(250), p, p);
  ellipse(50, random(50), p, p);
  ellipse(330, random(330), p, p);
  ellipse(150, random(150), p, p);
  ellipse(80, 80, p, p);
  ellipse(98, 98, p, p);
  ellipse(250, 250, p, p);
  ellipse(350, 350, p, p);
  ellipse(329, 355, p, p);
  
  ellipse(90, 345, p, p);
  ellipse(50, 50, p, p);
fill(random(255));
text(nf((millis()/1000), 0), 11, 390);
}



