
// bulbasaur!

void setup() {
  size(200,200);
  smooth();
  frameRate(45);
}

void draw() {
  colorMode(RGB,255,255,255);
  background(237,211,168);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  
  //body
  stroke(0);
  strokeWeight(1.75);
  fill(0,175,158);
  ellipse(93,116,76,61);

  //bulb
  stroke(0);
  strokeWeight(1.75);
  fill(0,142,75);
  ellipse(72,81,33,40);
  ellipse(105,76,32,38);
  ellipse(88,72,33,48);
  
  //ears
  fill(0,175,158);
  triangle(78,75,108,77,84,104);
  triangle(138,83,162,82,150,107);
  
  //head
  strokeWeight(1.75);
  ellipse(119,109,70,64);
  
  //eyes
  fill(0);
  noStroke();
  ellipse(116,110,6,11);
  ellipse(142,113,6,11);
  //pupils
  fill(255);
  noStroke();
  ellipse(117+mouseX/100,109+mouseY/70,3,5);
  ellipse(143+mouseX/100,112+mouseY/70,3,5);
  
  //mouth
  fill(0);
  stroke(0);
  line(119,124,138,125);
  
  //spots
  fill(1,104,90);
  stroke(0);
  triangle(119,90,131,89,125,101);
  triangle(136,94,133,100,141,99);
  triangle(130,101,127,103,130,106);
  triangle(61,108,71,115,60,122);
  triangle(66,122,70,122,68,125);
  triangle(73,130,79,130,76,137);
  
  //legs
  fill(0,175,158);
  strokeWeight(.75);
  triangle(64,136,67,138,63,140);
  triangle(77,145,81,146,78,149);
  triangle(107,146,111,145,110,148);
  
  //pokeball
  fill(255);
  strokeWeight(.75);
  ellipse(mouseX,mouseY,31.5,31.5);
  fill(237,28,36);
  ellipse(mouseX,mouseY-2.75,29.88,26.01);
  fill(255);
  strokeWeight(1);
  ellipse(mouseX,mouseY+10.26,6.85,6.85);
  strokeWeight(.75);
  ellipse(mouseX,mouseY+10.26,3.28,3.28);
  
}

void mousePressed() {
  println("Bulba! Bulba!");
}


