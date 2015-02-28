
     int variable;

void setup() {
  variable = 400;
  size(variable,variable);
  background(0);
}

void draw() {
  if (variable > 0){
  variable = variable-1;
}
stroke(random(200,255),0,random(100));
line(mouseX,variable,mouseY,variable);
}
void mouseClicked() {
  background(0);
variable = 400;
}               
