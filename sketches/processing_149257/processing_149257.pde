
int x = mouseX;
int y = mouseX;
PImage fly;
 
void setup() {
  size(400, 400);
  fly = loadImage("fly.png");
  smooth();
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
  imageMode(CENTER);
}
 
 void draw() {
background(255);

//body
rect(140, 230, 120, 170);
 
//color
fill(0);
rect(139, 300, 122, 25);
 
//head
fill(255);
ellipse(200, 200, 100, 100);
ellipse(140, 150, 50, 50);
ellipse(260, 150, 50, 50);
//eyeballs
 
//ellipse(mouseX, mouseY, 3, 3);
//line( 140, 150, mouseX, mouseY );
ellipse(140 + (mouseX-140)/8, 150 + (mouseY-150)/8, 3, 3);
ellipse(260 + (mouseX-260)/8, 150 + (mouseY-150)/8, 3, 3);
ellipse(140 + (mouseX-140)/8, 150 + (mouseY-150)/8, 6, 6);
ellipse(260 + (mouseX-260)/8, 150 + (mouseY-150)/8, 6, 6);
 
//nose
line(200, 180, 190, 170);
line(190, 170, 210, 170);
line(210, 170, 200, 180);
line(200, 180, 200, 210);
line(200, 210, 190, 220);
line(200, 210, 210, 220);

//table
rect(0, 330, 400, 400);

//paws(left)
smooth();
beginShape();
vertex(70, 300);
bezierVertex(70, 270, 130, 270, 130, 300);
bezierVertex(180, 260, 180, 390, 130, 350);
bezierVertex(130, 380, 70, 380, 70, 350);
bezierVertex(20, 390, 20, 260, 70, 300);
endShape();

pushMatrix();
translate( mouseX, mouseY );
//paws(right)
smooth();
beginShape();
vertex(270, 300);
bezierVertex(270, 270, 330, 270, 330, 300);
bezierVertex(380, 260, 380, 390, 330, 350);
bezierVertex(330, 380, 270, 380, 270, 350);
bezierVertex(220, 390, 220, 260, 270, 300);
endShape();
popMatrix();


//fly
image(fly, mouseX, mouseY, 50, 50);
}




