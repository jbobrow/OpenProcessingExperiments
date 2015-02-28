
void setup () {
  size (500, 300);
  noStroke();
  
color maccas = color(255, 255, 0);
color road = color(0, 0, 0);
color oval = color(0, 255, 0);
color pathway = color(100, 100, 100);
color redcentre = color(255, 0, 0);
color mainwalkway = color(200, 100, 100);
color sciencetheatre = color(255, 255, 255);

fill(maccas);
rect(0, 25, 100, 100);
fill(pathway);
rect(50, 125, 200, 50);
fill(road);
rect(50, 0, 50, 300);
fill(oval);
ellipse(150, 50, 100, 100);
fill(pathway);
rect(200, 0, 50, 300);
fill(redcentre);
rect(250, 170, 100, 100);
fill(mainwalkway);
rect(325, 0, 75, 300);
fill(sciencetheatre);
rect(400, 190, 100, 100);
}

void draw() {
  if(mousePressed) {
    stroke(255);
  } else {
    stroke(0);
  }
  line(mouseX, mouseY-10, mouseX-10, mouseY+10);
  line(mouseX, mouseY-10, mouseX+10, mouseY+10);
  
color value = color(255, 0, 0);

  fill(value);
  rect(250, 170, 75, 100);
}

