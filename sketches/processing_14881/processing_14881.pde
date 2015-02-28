
int variable;
void setup() {
  variable = 1;
  size(450,450);
  background(255);
}

void draw() {
  variable= variable+1;
  frameRate (10);
  fill(random(250),0,0,random(250));
  triangle(mouseX,mouseY+variable,mouseX-15-variable,mouseY-20,mouseX+15+variable,mouseY-20);
}

void mouseClicked() {
  variable = 450;
}


