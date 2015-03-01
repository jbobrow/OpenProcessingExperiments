
float diameter;
float angle =0;


void setup () {
  size(600, 600);
  diameter = height - 20;
}


void draw () {
  background(100);
  noStroke();
  fill(#D4F251);
  rect(50, 50, 300, 200);
  fill(#65F251);
  rect(370, 50, 200, 200);
  fill(#51F2A5);
  rect(50, 270, 200, 300);
  fill(#51F2D6);
  rect(270, 270, 200, 100);
  fill(#51CEF2);
  rect(270, 390, 200, 180);
  fill(#517AF2);
  rect(490, 270, 80, 300);


  float d1 = 10 + (cos(angle) * diameter/16);

  stroke(#BFFFEB);
  strokeWeight(4);
  noFill();
  ellipse(mouseX, mouseY, d1, d1);

  if (mouseX > 50 && mouseX < 350 && mouseY > 50 && mouseY < 250) {
    fill(#A91EBC);
    stroke(#A91EBC);
    ellipse(mouseX, mouseY, d1, d1);
  }
  
  
  if (mouseX > 370 && mouseX < 570 && mouseY > 50 && mouseY < 250) {
    fill(#F04695);
    stroke(#F04695);
    ellipse(mouseX, mouseY, d1, d1);
  }
  
  if (mouseX > 50 && mouseX < 250 && mouseY > 270 && mouseY < 570) {
    fill(#FF2949);
    stroke(#FF2949);
    ellipse(mouseX, mouseY, d1, d1);
  }
  
  if (mouseX > 270 && mouseX < 470 && mouseY > 270 && mouseY < 370) {
    fill(#FF8C1F);
    stroke(#FF8C1F);
    ellipse(mouseX, mouseY, d1, d1);
  }
  
  if (mouseX > 270 && mouseX < 470 && mouseY > 390 && mouseY < 570) {
    fill(#FBFF29);
    stroke(#FBFF29);
    ellipse(mouseX, mouseY, d1, d1);
  }
  
  if (mouseX > 490 && mouseX < 570 && mouseY > 270 && mouseY < 570) {
    fill(#CA1FFF);
    stroke(#CA1FFF);
    ellipse(mouseX, mouseY, d1, d1);
  }
  

  //  fill(#BFFFEB);
  //  ellipse(150, 150, d1, d1);
  //  fill(#BFFFEB);
  //  ellipse(400, 200, d2, d2);

  angle += .1;
}



