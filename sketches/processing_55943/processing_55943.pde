
void setup () {
size (400,400);
background (55,2,125);
noCursor();
}
  
void draw() {
  
  noStroke();
  fill(55,2,125,10);
  rect(0,0,width,height);

  
stroke (180,190,0,50);
line (mouseX,mouseY,width, height);
line (mouseX,mouseY,0, 0);
line (mouseX,mouseY,width, 0);
line (mouseX,mouseY,0, height);
ellipse(mouseX, mouseY, 10 ,10);
ellipse(mouseX, mouseY, 20 ,20);

}
