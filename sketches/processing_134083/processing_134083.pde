
int aumento =0;
void setup() {
  size(600, 600);
  background(120,5,253);
}
void draw() {
fill(aumento/3,0,255-aumento);
ellipse(aumento+300, height/2, 10, aumento/2);
stroke(50,76,3);
ellipse(aumento, height/2, 8, aumento);
stroke(98,63,97);
ellipse(width/4, aumento,aumento/4, 40);
stroke(5,76,24);
ellipse(aumento,aumento/3, 9, aumento);
stroke(148,5,89);
ellipse(aumento/3,aumento, 20, aumento);
stroke(148,5,89);
ellipse(aumento, height*(3.0/4.0), 9, aumento);
stroke(148,5,89);
aumento+=10;
}

