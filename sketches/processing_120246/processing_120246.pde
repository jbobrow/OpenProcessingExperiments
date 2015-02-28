
void setup() {
  size(200, 200);            //grootte van het document
  background(255);           //een witte achtergrond
}

void draw() {
  background(255);
  rectMode(CENTER);          //teken rechthoek van het midden uit
  stroke(0);                 //zwarte omranding
  fill(150);                 //grijze vulkleur
  rect(mouseX, mouseY, 20, 100);   //teken een rechthoek met voorgaande specificaties
  fill(255);                 //verander vulkleur naar wit
  ellipse(mouseX, mouseY-30, 60, 60);  //teken een ellips
  fill(0);                   //vulkeur zwart
  ellipse(mouseX-19, mouseY-30, 16, 32);   //teken een ellipse
  ellipse(mouseX+19, mouseY-30, 16, 32);  //teken een ellipse
  stroke(0);                 //zwarte omlijning
  line(mouseX-10, mouseY+50, mouseX-20, mouseY+60);  //teken een lijn
  line(mouseX+10, mouseY+50, mouseX+20, mouseY+60);  //teken een lijn
}
