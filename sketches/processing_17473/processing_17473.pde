
//Nick Myette
//Project 1: Avatar
//IXD Winter 2011

int eyeColor; // every click makes monkeys eyes more red

void setup() {
  size(200, 200);
  background(90, 200, 200);
  tint(180, 50, 75);
}

void draw() {
  noStroke();
  smooth();
  
  /*monkey*/
  
  //brown body
  fill(147, 59, 0);
  tint(24, 99, 57);
  rectMode(CENTER);
  rect(width - width/2, height, width/2, height/2);
  rect(width/2, height - height/4, width/4, height/2);
  
  //ears
  fill(255, 190, 10);
  tint(44, 95, 99);
  ellipse(width/2 - width/4, height/2, width/3, height/3);
  ellipse(width/2 + width/4, height/2, width/3, height/3);
  fill(255, 226, 0);
  tint(50, 99, 99);
  ellipse(width/2 - width/4, height/2, width/5, height/5);
  ellipse(width/2 + width/4, height/2, width/5, height/5);
  
  //head
  fill(147, 59, 0);
  tint(24, 99, 57);
  ellipse(width/2, height/2, width/2, height/2);
  
  //mouth (ellipse)  
  fill(255, 190, 10);
  tint(44, 95, 99);
  ellipse(width/2, height/2 + height/10, width/3, height/3);
  
  //eyes
  fill(eyeColor, 0, 0);
  ellipse(width/2 - width/15, height/2 - height/8, width/20, height/10);
  ellipse(width/2 + width/15, height/2 - height/8, width/20, height/10);
  fill(255);
  ellipse(width/2 - width/15 - width/40 + (mouseX/20), height/2 - height/8 - height/40 + (mouseY/20), width/40, height/20);
  ellipse(width/2 + width/15 - width/40 + (mouseX/20), height/2 - height/8 - height/40 + (mouseY/20), width/40, height/20);
  
  //mouth (line)
  strokeWeight(width/100);
  stroke(0);
  fill(0);
  line(width/2 - width/10, height/2 + height/10, width/2 + width/10, height/2 + height/10);
  
  //unibrow
  line(width/2 - width/10, height/2 - height/5, width/2 + width/10, height/2 - height/5);
}

 void mousePressed() {
  eyeColor = eyeColor + 10;
  
  //bugs
  stroke(0);
  line(mouseX, mouseY, mouseX - 3, mouseY + 3);
  line(mouseX, mouseY, mouseX + 3, mouseY + 3);
  noStroke();
  fill(0);
  ellipse(mouseX, mouseY, 10, 5);
  fill(255);
  ellipse(mouseX + 5, mouseY - 3, 15, 5);  
 }

