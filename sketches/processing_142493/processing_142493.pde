
int x = mouseX;
int y = mouseX;


void setup() {
  size(400, 400);
  smooth();
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
}

 void draw() {
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

//nose
line(200, 180, 190, 170);
line(190, 170, 210, 170);
line(210, 170, 200, 180);
line(200, 180, 200, 210);
line(200, 210, 190, 220);
line(200, 210, 210, 220);
}






