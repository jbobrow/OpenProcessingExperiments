
void setup() {
  int Screen = (screen.width);
  size(screen.width/2, screen.width/2);
  background(255);
  //colorMode(HSB, Screen/2);
  //fill(Screen/200, Screen, Screen, 20);
  //stroke(Screen/50, Screen, Screen, 100);
}
void draw() {
  colorMode(HSB, random(100));
  fill(random(100), random(100), random(100), random(100));
  stroke(random(100),random(100),random(100),random(100));
  println(abs(mouseY-pmouseY)+"_"+abs(mouseX-pmouseX));

  //stroke weight determined by the difference in mouse X
  strokeWeight(abs(mouseX-pmouseX));  

  //Draw around mouse
  /*
  line(mouseX, mouseY-OrbitRadius, mouseX-OrbitRadius, mouseY);
  line(mouseX-OrbitRadius , mouseY, mouseX, mouseY+OrbitRadius);
  line(mouseX, mouseY+OrbitRadius, mouseX+OrbitRadius, mouseY);
  line(mouseX+OrbitRadius, mouseY, mouseX, mouseY-OrbitRadius);
  */
  ellipse(mouseX, mouseY, OrbitRadius+20, OrbitRadius+20); 
}

void mousePressed() {
  saveFrame("CC_pic_##");
  colorMode (RGB, 225);
  background (225);
}

int OrbitRadius = (abs(mouseY-pmouseY));
//int OrbitRadius = (25);


