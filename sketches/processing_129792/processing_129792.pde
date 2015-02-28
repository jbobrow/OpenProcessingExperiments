
void setup() {
  size(500, 500);
}

void draw() {
  println(mouseX + "," + mouseY);
  background(#176DC1);
  
  //ground
  fill(#06539D);
  rect(0, 350, width, 150, 7);
  
  //claws on hands
  fill(#FFFFFF);
  triangle(93, 125, 100, 168, 128, 168);
  
  fill(#FFFFFF);
  triangle(57, 150, 102, 170, 86, 188);
  
  fill(#FFFFFF);
  triangle(42, 195, 86, 188, 83, 215);
  
  fill(#FFFFFF);
  triangle(407, 125, 400, 168, 372, 168);
  
  fill(#FFFFFF);
  triangle(443, 150, 398, 170, 414, 188);
  
  fill(#FFFFFF);
  triangle(458, 195, 414, 188, 417, 215);
  
  //hands
  fill(#85F029);
  ellipse(120, 200, 90, 90);
  
  fill(#85F029);
  ellipse(380, 200, 90, 90);
  
  //body
  fill(#85F029);
  ellipse(width/2, 280, 265, 265);
  
  //head
  fill(#85F029);
  quad(180, 72, 320, 72, 370, 182, 130, 182);
  
  //horns
  fill(#E7F5DC);
  triangle(206, 33, 180, 72, 206, 72);
  fill(#E7F5DC);
  triangle(294, 33, 320, 72, 294, 72);
  
  //eyes
  fill(#000000);
  ellipse(210, 102, 12, 20);
  fill(#000000);
  ellipse(290, 102, 12, 20);
  
  //nose
  fill(#199B27);
  triangle(width/2, 125, 235, 135, 265, 135);
  
  //mouth
  fill(#000000);
  quad(210, 147, 290, 147, 279, 182, 221, 182);
  fill(#F2ABF1);
  quad(216, 166, 284, 166, 279, 182, 221, 182);
  
  //fangs
  fill(#FFFFFF);
  triangle(230, 160, 221, 182, 240, 182);
  fill(#FFFFFF);
  triangle(270, 160, 279, 182, 260, 182);
  
  
  //feet
  fill(#85F029);
  quad(110, 315, 220, 315, 200, 410, 150, 410);
  
  fill(#85F029);
  quad(390, 315, 280, 315, 300, 410, 350, 410);
  
  //claws on feet
  fill(#FFFFFF);
  triangle(125, 275, 110, 315, 140, 315);
  
  fill(#FFFFFF);
  triangle(157, 275, 140, 315, 180, 315);
  
  fill(#FFFFFF);
  triangle(200, 275, 180, 315, 220, 315);
  
  fill(#FFFFFF);
  triangle(375, 275, 390, 315, 360, 315);
  
  fill(#FFFFFF);
  triangle(343, 275, 360, 315, 320, 315);
  
  fill(#FFFFFF);
  triangle(300, 275, 320, 315, 280, 315);
  
  
  
}


