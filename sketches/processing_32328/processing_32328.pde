
void setup() {
  size(500, 500);
}

void draw() {  

  background(200);

  fill(random(0, 255)+random(-mouseX, mouseY), random(0, 255)+random(-mouseX, pmouseX), random(0, 255)+random(-mouseY, pmouseY));

  triangle(pmouseX, pmouseY, pmouseX*0.5, pmouseY/3, pmouseY, pmouseX);

  fill(random(0, 255)+random(mouseX, mouseY), random(0, 255)+random(-mouseX, pmouseX), random(0, 255)+random(-mouseY, pmouseY));

  rect(pmouseY*0.44, pmouseX/3.2, pmouseY/4+height/4-pmouseX/5, pmouseX/5+width/5-pmouseY/4);

  if (keyPressed) {
    if (key=='a') {
      save("pic.jpg");
    }
  }
}


