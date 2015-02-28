
void setup() {
  size(600, 600);
}
 
void draw() {
  if (mousePressed) {
    fill(103,35,84,9);
  }
  else {
    fill(103,35,84);
  }
  rect(0,0,width,height);
 
  if (mousePressed) {
    stroke(201,12,157,50);
    strokeWeight(9);
    fill(random(240), 114, 162);
 ellipse(mouseX, mouseY, 520, 520);
  }
  else {
    fill(23,119,113);
    ellipse(mouseX, mouseY, 520, 520);
    stroke(240, 114, 162);
    strokeWeight(5);  
    fill(240, 114, 162);
  }
  if (mousePressed) {
    stroke(162,21,132);
    fill(random(250),250,172);
 
    ellipse(mouseX, mouseY, 440, 440);
  }
  else {
    fill(12,201,190);
    ellipse(mouseX, mouseY, 440, 440);
  }
  if (mousePressed) {
    stroke(162,21,132);
    fill(113, 224, 218);
 
    ellipse(mouseX, mouseY, 360, 360);
  }
  else {
    fill(10,158,162);
    ellipse(mouseX, mouseY, 360, 360);
  }
  if (mousePressed) {
    stroke(162,21,132);
    fill(192,231,250);
 
    ellipse(mouseX, mouseY, 280, 280);
  }
  else {
    fill(113, 224, 218);
    ellipse(mouseX, mouseY, 280, 280);
  }
  if (mousePressed) {
    stroke(162,21,132);
    fill(234,159,66);
 
    ellipse(mouseX, mouseY, 200, 200);
  }
  else {
    fill(152,206,203);
    ellipse(mouseX, mouseY, 200,200);
  }
  if (mousePressed) {
    stroke(162,21,132);
    fill(160,19,130);
 
    ellipse(mouseX, mouseY, 120, 120 );
  }
  else {
    fill(17,77,74);
    ellipse(mouseX, mouseY, 120,120);
  }
  if (mousePressed) {
    stroke(162,21,132);
    fill(240,150,241,50);
 
    ellipse(mouseX, mouseY, 40, 40);
  }
  else {
    fill(222,105,187);
    ellipse(mouseX, mouseY, 40,40);
  }
}


  
  
