
void setup() {
  size(800,600);
  background(0);
  smooth();
}

void draw() {
  ellipseMode(CENTER);
  noStroke();
  fill(mouseX+random(100),mouseY+random(100),random(255),random(255));
  rect(random(mouseX),random(mouseY),25,25);
  noStroke();
  fill(mouseY+random(200),random(255),mouseY+random(200),random(127));
  rect(mouseX-3,mouseY-3,25,25);
    noStroke();
  fill(random(255),mouseX+random(73),mouseY-random(300),random(127));
  rect(mouseX+10,mouseY+10,50,50);
  
}

