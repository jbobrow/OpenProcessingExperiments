
float x;
float easing = 0.4;
float diameter = 12;

void setup() {
size(400, 400);
smooth();
}

void draw() { 
fill(2, 40);  
float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
float targetX = mouseX;
fill(250, 3);
strokeWeight(1);
ellipse(mouseX, mouseY, mouseX, pmouseY);
 if (mousePressed) {
    fill(2, 40);
    noStroke();
    ellipse(mouseX, mouseY, mouseX, pmouseY);
  };
}

