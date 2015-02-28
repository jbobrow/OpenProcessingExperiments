
//PS_2 Question 2
//Milton Sukhabut

void setup(){
  size(500,500);
  background(50);
  noStroke();
}

void draw (){
  if (mousePressed && (mouseButton == LEFT)){
    brush(mouseX,mouseY);
  }
}

void brush (int x, int y){
  fill(mouseX, mouseY, 140, 120);
  ellipse(mouseX, mouseY, 120, 55);
  ellipse(mouseX, mouseY, 85, 100);
  ellipse(mouseX, mouseY, 40, 150);
}

