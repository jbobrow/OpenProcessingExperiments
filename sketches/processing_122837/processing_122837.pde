

void setup() {
  size(700, 700);
}

void draw() {
  background(255, 255, 255);
  stroke(0);
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX+350,mouseY+ 350, 50, 50);

  strokeWeight(5);
  line(mouseX+470,mouseY+ 400, mouseX+220,mouseY+ 400);//armen
  line(mouseX+335,mouseY+ 520, mouseX+335,mouseY+ 570);//rechterbeen
  line(mouseX+365,mouseY+ 520, mouseX+365,mouseY+ 570);//linkerbeen
  strokeWeight(2);
  rect(mouseX +325, mouseY + 370, 50, 150);//lichaam  mouseX +120, mouseY
  fill(255, 255, 255);//kleur ogen
  ellipse(mouseX+340,mouseY+ 340, 10, 10);//ogen
  ellipse(mouseX+360,mouseY+ 340, 10, 10);//ogen
  fill(0, 0, 0);//kleur binnenkant ogen
  ellipse(mouseX+342,mouseY+ 342, 5, 5);//binnenkant ogen
  ellipse(mouseX+362,mouseY+ 342, 5, 5);//binnenkant ogen
}

