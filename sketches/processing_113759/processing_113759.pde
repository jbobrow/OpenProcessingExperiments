
//try
//chiming lu

void setup () {
  size(500, 500);
  background(0);
}

void draw() {
  if (mousePressed) {
    noStroke();
    background(0);
    fill(mouseX,mouseY,200,50);
  }
  else {
    stroke(5);
    fill(mouseX+random(100),mouseY+random(255),100,50);
  }
  triangle(mouseX, mouseY, mouseX-100, mouseX-100,mouseY+100,mouseX+100);
  
  noStroke();
  ellipse(mouseY+random(100), mouseX+random(255), 100, 100);
 
}

void keyPressed(){
  saveFrame("screen-####.jpg");
}


