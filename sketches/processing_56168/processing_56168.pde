
void setup() {
  size (800,800);
}

void draw() {
  
smooth();
strokeWeight(3);
background(#E4EDBB);
ellipseMode(RADIUS);

//Neck
stroke(#D128C9);
if (mousePressed == true) {
  stroke(#2AE813);
}
line(mouseX+250, mouseY+250, mouseX+250, mouseY+390);
line(mouseX+260, mouseY+250, mouseX+260, mouseY+390);
line(mouseX+270, mouseY+250, mouseX+270, mouseY+390);
line(mouseX+280, mouseY+250, mouseX+280, mouseY+390);
line(mouseX+290, mouseY+250, mouseX+290, mouseY+390);

//Antennae
strokeWeight(6);
stroke(#1119D3);
if (mousePressed == true) {
  stroke(#F76E3C);
}
line(mouseX+240, mouseY+220, mouseX+160, mouseY+120);
line(mouseX+300, mouseY+220, mouseX+380, mouseY+120);
strokeWeight(12);
line(mouseX+270, mouseY+220, mouseX+270, mouseY+60);
strokeWeight(9);
stroke(#ED7183);
if (mousePressed == true) {
  stroke(#FAF2F0);
}
line(mouseX+255, mouseY+220, mouseX+230, mouseY+140);
line(mouseX+285, mouseY+220, mouseX+305, mouseY+140);

//Head
noStroke();
fill(#9328A0);
if (mousePressed == true) {
  fill(#FAF2F0);
}
ellipse(mouseX+270, mouseY+220, 75, 35);
fill(#D9E355);
ellipse(mouseX+240, mouseY+220, 15, 10);
ellipse(mouseX+300, mouseY+220, 15, 10);
fill(0);
ellipse(mouseX+240, mouseY+220, 5, 5);
ellipse(mouseX+300, mouseY+220, 5, 5);

//Body
noStroke();
fill(0);
rect(mouseX+255, mouseY+400, 30, 90);
fill(0);
rect(mouseX+70, mouseY+400, 400, 9);
fill(#5296E8);
ellipse(mouseX+70, mouseY+404, 15, 15);
ellipse(mouseX+470, mouseY+404, 15, 15);
fill(#E52C17);
if (mousePressed == true) {
  fill(#FAF2F0);
}
ellipse(mouseX+270, mouseY+400, 45, 20);
fill(0);
if (mousePressed == true) {
  fill(#FAF2F0);
}
rect(mouseX+210, mouseY+490, 120, 20);
rect(mouseX+210, mouseY+490, 20, 200);
rect(mouseX+310, mouseY+490, 20, 200);
}

