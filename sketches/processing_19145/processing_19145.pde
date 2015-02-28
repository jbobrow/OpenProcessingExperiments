
PFont bob;
String louise = "P1L 0A1"; 

void setup(){
  size(250,250);
  smooth();
  background(0);
  bob = createFont("Garamond",50);
}

 
void draw(){
  fill(0,5);
  noStroke();
  rect(0,0,250,250);
  fill(255);
  textFont(bob, 50);
  fill(random(255),random(255),random(255),random(255));
  text(louise, mouseX, mouseY);
  
}


