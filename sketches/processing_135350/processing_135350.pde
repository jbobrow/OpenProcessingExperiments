
//Mady Dean 02/17/14 Creative Computing: Section B//

void setup() {
  size(500, 500);
  background(#000000);
}

void draw() {
  int variable= round( map(200,70,20,100,80) );
  smooth();
  noStroke();
  
  fill(15, mouseY+180, 78, 79);
  ellipse(mouseX+20, mouseY-80, 60, variable);
  stroke(mouseX, mouseX, mouseX, 40);
  strokeWeight(1);
  line(mouseY, mouseX, mouseX-30, mouseY+300);
  strokeWeight(1);
  stroke(mouseY, mouseY, mouseY);
  fill(#F660AB, 20);
  triangle(mouseX-20, mouseX, 60, mouseX-50, 100, mouseY);  
  noFill();
  triangle(mouseY+370, mouseY-400, 600, mouseY+600, mouseX+160, mouseX+600);
  fill(#00FFFF, 10);
  quad(mouseX+138, mouseY+91, mouseY+86, 620, mouseX+669, mouseX+563, mouseY/3, 76);
  noStroke();
  stroke(12, 118, 84);
  fill(12, 118, 84, 6);
  triangle(mouseY-20, mouseY, -60, mouseY-50, -100, mouseX);  
  strokeWeight(4);
  stroke(random(2,100), random(180,255), random(100,190));
}


void mouseClicked() {
rect( random(200), random(200), mouseY,mouseY );
}


