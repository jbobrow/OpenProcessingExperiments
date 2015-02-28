
// HW #1
// Written by Kevin Kuntz
// Andrew ID: kkuntz
// © Kevin Kuntz  January 2014 Pittsburgh, Pa 15213  All Rights reserved

//Background Lines
void drawLines() {
  int y = 12;
  while(y <= 390) {
    stroke(255);
    strokeWeight(5);
    line(25,y,375,y);
    y = y + 15;
  } 
}

void setup() {
  size(400,400);
  background(36,59,103);
  drawLines();
  
  //Initials
  fill(36,59,103);
  noStroke();
  
  //textBoundry(40,300,160,80);
  
  // First K
  //kBoundary(40,300,50,80);
  rect(40,300,15,80);
  quad(40,340,55,340,90,300,75,300);
  quad(45,330,60,330,90,380,75,380);
  
  //  D
  //dBoundary(95,300,50,80);
  rect(95,300,15,80);
  stroke(36,59,103);
  strokeWeight(15);
  noFill();
  arc(110, 340, 51, 64, -PI / 2, PI / 2);
  fill(36,59,103);
  noStroke();
  
  // Second K
  //kBoundary(150,300,50,80);
  rect(150,300,15,80);
  quad(150,340,165,340,200,300,185,300);
  quad(155,330,170,330,200,380,185,380);
  
  //saveFrame("hw1.jpg");
}



