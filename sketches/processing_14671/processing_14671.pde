
int variable;

void setup() {
  variable = 430;
  size(variable,variable);
  background(0);
}

void draw() {
  if (variable > 0){
  variable = variable-1;
}
fill(0,random(150,250),random(100,200));
ellipse(mouseX,mouseY,variable/2,variable/2);
}
void mouseClicked() {
  variable = 300;
}               
