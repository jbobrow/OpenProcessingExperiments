
int maVariable;

void setup () {
  maVariable=1;
  size(800,800);
  background (255);
}

void draw () {
  maVariable = maVariable + 1;
  fill (150,150,150,1);
  ellipse(mouseX,mouseY,maVariable,maVariable);
  
  
}

void mouseClicked () {
maVariable = +1;
fill (150,150,150,1);
ellipse(mouseX,mouseY,maVariable,maVariable);

}

