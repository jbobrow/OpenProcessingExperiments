
int value = 0;

void setup(){
  size(600,600);
  smooth();
  background(214,211,205);
}


void draw(){
background(214,211,205);
noStroke();
  fill(random(0,255),random(0,255),random(0,255));
beginShape();
vertex(373,0);
vertex(230,164);
vertex(539,256);
vertex(482,0);
endShape();
stroke(1);
fill(104,85,148);
ellipseMode(CENTER);
ellipse(72,131,210,210);
fill(108,110,109,210);
  float circleDiameter = 349;
  if (dist(mouseX,mouseY,496,319) <= circleDiameter/2)
ellipse(496,319,349,349);
stroke(value);
strokeWeight(6);
line(30,0,195,539);
strokeWeight(4);
line(0,128,391,128);
line(0,411,431,403);
strokeWeight(10);
line(203,0,474,286);
line(576,0,600,39);
}

void mousePressed(){
  if (value==0) {
    value = 255;
  } else {
    value = 0;
  }
}



