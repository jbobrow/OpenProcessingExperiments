
void setup (){
  size (500, 500);
}

void draw (){
  background (0);
  
  //Hintergrund
  noStroke ();
  fill(255);
  rect (5, 0, 10, 500);
  rect (25, 0, 10, 500);
  rect (45, 0, 10, 500);
  rect (65, 0, 10, 500);
  rect (85, 0, 10, 500);
  rect (105, 0, 10, 500);
  rect (125, 0, 10, 500);
  rect (145, 0, 10, 500);
  rect (165, 0, 10, 500);
  rect (185, 0, 10, 500);
  rect (205, 0, 10, 500);
  rect (225, 0, 10, 500);
  rect (245, 0, 10, 500);
  rect (265, 0, 10, 500);
  rect (285, 0, 10, 500);
  rect (305, 0, 10, 500);
  rect (325, 0, 10, 500);
  rect (345, 0, 10, 500);
  rect (365, 0, 10, 500);
  rect (385, 0, 10, 500);
  rect (405, 0, 10, 500);
  rect (425, 0, 10, 500);
  rect (445, 0, 10, 500);
  rect (465, 0, 10, 500);
  rect (485, 0, 10, 500);
  
  rect (mouseX, 0, 10, 500);
  rect (mouseX+40, 0, 10, 500);
  rect (mouseX+80, 0, 10, 500);
  rect (mouseX+120, 0, 10, 500);
  rect (mouseX+160, 0, 10, 500);
  rect (mouseX+200, 0, 10, 500);
  rect (mouseX+240, 0, 10, 500);
  rect (mouseX+280, 0, 10, 500);
  rect (mouseX+320, 0, 10, 500);
  rect (mouseX+360, 0, 10, 500);
  rect (mouseX+400, 0, 10, 500);
  
  float farbwinkel = map(mouseY, 0, 250, 250, 0);
  fill(farbwinkel, 0, 0, 150);
  
  rect (mouseX+20, mouseY, 10, 500);
  rect (mouseX+60, mouseY, 10, 500);
  rect (mouseX+100, mouseY, 10, 500);
  rect (mouseX+140, mouseY, 10, 500);
  rect (mouseX+180, mouseY, 10, 500);
  rect (mouseX+220, mouseY, 10, 500);
  rect (mouseX+260, mouseY, 10, 500);
  rect (mouseX+300, mouseY, 10, 500);
  rect (mouseX+340, mouseY, 10, 500);
  rect (mouseX+380, mouseY, 10, 500);
}
