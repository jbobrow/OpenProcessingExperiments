
void setup() {
  size(500, 500); // canvas size
  background(0); // background color
  noStroke(); // no black outlines around shapes
}

void draw() {
  
}

void mousePressed() {
  // Naruto
  fill(255, 245, 0); // hair color
  rect(mouseX+1, mouseY+0, 50, 30); // hair
  fill(0); // headband cloth color
  rect(mouseX+1, mouseY+20, 50, 10); // headband cloth
  fill(175); // headband plate color
  rect(mouseX+6, mouseY+21, 40, 7); // headband plate
  fill(240, 180, 105); // skin tone
  rect(mouseX+1, mouseY+30, 50, 40); // face
  fill(0); // top section color
  rect(mouseX+1, mouseY+60, 50, 15); // top section of jacket
  rect(mouseX+18, mouseY+75, 15, 40); // mid section of jacket
  rect(mouseX+1, mouseY+115, 50, 10); // waist section of jacket
  fill(255, 125, 0); // orange jacket color
  rect(mouseX+1, mouseY+75, 17, 40); // left third of jacket
  rect(mouseX+33, mouseY+75, 18, 40); // right third of jacket
  fill(255, 125, 0); // orange pants color
  rect(mouseX+1, mouseY+125, 50, 40); // pants
  fill(255); // white color
  rect(mouseX+1, mouseY+130, 25, 15); // tool holster holder
  fill(140, 190, 255); // blue rasengan color
  ellipse(mouseX+50, mouseY+100, 20, 20); // Rasengan
}

