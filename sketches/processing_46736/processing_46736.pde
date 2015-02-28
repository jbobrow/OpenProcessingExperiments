


void setup() {
  size(500, 500);
  fill(random(255));
  background(0);
}

void draw() {
  if(mousePressed) {
    stroke(255);
  } else {
    stroke(random(255), random(255), random(255));
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  //line(mouseX, mouseY-66, mouseX, mouseY+66); 
  
}

 void keyPressed() {
   if (key == ' ') {
     background (0);
   } 
 }

