
//Jonah Abramson
//MyCreature
//8/5/13


void setup() {
  size(700, 700);
  smooth();
  strokeWeight(5);

}

//


void draw() {
  
  if (mousePressed) {
    mySadCreature();
  }
  else {
    myHappyCreature();
  }
}


//

void mySadCreature() {
  background(61);
  fill(245, 0, 0);
  ellipse(mouseX+240, mouseY+220, 220, 240);
  ellipse(mouseX+200, mouseY+165, 18, 17);
  ellipse(mouseX+275, mouseY+165, 18, 17);
  line(mouseX+237, mouseY+205, mouseX+237, mouseY+240);
  line(mouseX+133, mouseY+80, mouseX+170, mouseY+114);
  line(mouseX+360, mouseY+80, mouseX+303, mouseY+110);
  line(mouseX+200, mouseY+283, mouseX+280, mouseY+282);
  line(mouseX+198, mouseY+284, mouseX+185, mouseY+300);
  line(mouseX+282, mouseY+282, mouseX+295, mouseY+300);
}

void myHappyCreature() {
  background(255, 0, 0);
  fill(77);
  ellipse(mouseX+240, mouseY+220, 220, 240);
  ellipse(mouseX+200, mouseY+165, 18, 17);
  ellipse(mouseX+275, mouseY+165, 18, 17);
  line(mouseX+237, mouseY+205, mouseX+237, mouseY+240);
  line(mouseX+133, mouseY+80, mouseX+170, mouseY+114);
  line(mouseX+360, mouseY+80, mouseX+303, mouseY+110);
  line(mouseX+200, mouseY+283, mouseX+280, mouseY+282);
  line(mouseX+198, mouseY+282, mouseX+185, mouseY+270);
  line(mouseX+282, mouseY+282, mouseX+295, mouseY+270);
}
