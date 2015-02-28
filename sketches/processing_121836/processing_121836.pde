
void setup() {
  size(200, 200);

}

void draw() {
  background(255);
  
  fill(159, 138, 125);
   rect(mouseX +45, mouseY +50, 25, 8, 2);//rechteram 120, 120
  rect(mouseX, mouseY, 50, 80, 10); //body//x75 y70

  line(mouseX +12, mouseY+65, mouseX+40, mouseY+65); //mond//85,135 //115, 135
 
  line(mouseX +19, mouseY +65, mouseX +22, mouseY +70); //links tand, 94, 135, 97, 140
   ellipseMode(CENTER);
  line(mouseX +22, mouseY +70, mouseX +25, mouseY +65); //rechts tand 97, 140, 100, 135
 ellipseMode(CENTER);
 
  fill(227, 156, 18);
  line(mouseX +35, mouseY, mouseX+35, mouseY -25);//antenne 110, 70, 110, 50
   
  ellipse(mouseX +35, mouseY -25, 8, 8);//antennebol 110, 50


  fill(159, 138, 125);
  rect(mouseX +4, mouseY +79, 20, 12, 2);//linkerbeen 79 149
  rect(mouseX +26, mouseY +79, 20, 12, 2);//rechterbeen 101 149

  fill(159, 138, 125);
  rect(mouseX -20, mouseY +50, 25, 8, 2);//linkerarm 55, 120

  fill(0);

  ellipse(mouseX +25, mouseY+40, 15, 15);//oog links
  ellipse(mouseX +47, mouseY+40, 15, 15);//oog rechts

}

