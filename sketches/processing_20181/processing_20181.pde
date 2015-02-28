
void setup(){
  size (500,500);
  smooth();
}

void draw(){
  
  background(255, 255, 255);
   
  rectMode(CENTER);

//legs
stroke(0);
strokeWeight(2);
line(mouseX-48, mouseY+42, mouseX-37, mouseY+45);
line(mouseX-47, mouseY+50, mouseX-35, mouseY+52);
line(mouseX-46, mouseY+57, mouseX-36, mouseY+60);
line(mouseX+37, mouseY+42, mouseX+52, mouseY+39);
line(mouseX+37, mouseY+50, mouseX+49, mouseY+48);
line(mouseX+36, mouseY+57, mouseX+47, mouseY+54);

beginShape();
stroke(0);
strokeWeight(1);
fill(125, 124, 61,mouseX);
//body
vertex(mouseX-30, mouseY+115);
vertex(mouseX-40, mouseY+25);
vertex(mouseX-15, mouseY+15);
vertex(mouseX, mouseY);
vertex(mouseX+15, mouseY+15);
stroke(171, 170, 149);
vertex(mouseX+40, mouseY+25);
vertex(mouseX+30, mouseY+115);
endShape(CLOSE);

//eyes
strokeWeight(4);
stroke(232, 231, 197);
fill(0);
ellipse(mouseX-7, mouseY+20, 5+(mouseX/30),10+(mouseY/15));
ellipse(mouseX+8, mouseY+20, 5+(mouseX/30),10+(mouseY/15));

/*
//stripes
strokeWeight(4);
stroke(87, 86, 31, 20); //top
line(218, 240, 255, 250);
line(255, 250, 292, 240);
stroke(87, 86, 31, 30); //second
line(220, 247, 255, 257);
line(255, 257, 292, 247);
stroke(87, 86, 31, 40); //third
line(219, 255, 255, 265);
line(255, 265, 291, 255);
stroke(87, 86, 31, 50); //fourth
line(220, 262, 255, 272);
line(255, 272, 290, 262);
stroke(87, 86, 31, 60); //fifth
line(221, 270, 255, 280);
line(255, 280, 289, 270);
stroke(87, 86, 31, 70); //sixth
line(222, 277, 255, 287);
line(255, 287, 288, 277);
stroke(87, 86, 31, 80); //seventh
line(223, 285, 255, 295);
line(255, 295, 287, 285);
stroke(87, 86, 31, 90); //eighth
line(224, 292, 255, 302);
line(255, 302, 286, 292);
stroke(87, 86, 31, 100); //tenth
line(225, 300, 255, 309);
line(255, 309, 285, 300);
*/

}

