
void setup() {
  size(1024, 768);
  frameRate(200);
  smooth();
  background(252, 0, 133);
}

void draw() {

  if (mousePressed) {
    background(0, 0, 0);
    float f = 0.3333333;
    float durchmesser = random(100);
    fill(random(255), random(255), random(255), 70);
    stroke(random(255), random(255), random(255), 50);
    strokeWeight(random(10)); //strichdicke
    ellipse(mouseX, mouseY, durchmesser, durchmesser);
    fill(255, 255, 255, 100); 
    strokeWeight(2);
    quad(mouseX, mouseY, 0, 0, 0, 0, 0, 5);
  }   
  else {
    float f = 0.3333333;
    fill(random(255), random(255), random(255), 70);
    stroke(random(255), random(255), random(255), 50); 
    strokeWeight(random(10));
    variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
    fill(0, 0, 255, 50); 
    strokeWeight(2);
    quad(mouseX, mouseY, 0, 0, 0, 0, 0, 5);
  }

  if (keyPressed) {
    if (key == 's') {
      saveFrame("picture-####.png");
    }
  }
}

void mouseReleased () {
  background(252, 0, 133);
  float f = 0.3333333;
  float durchmesser = random(100);
  fill(random(255), random(255), random(255), 70); //flache füllen - 70 dahinter - 70% deckkraft
  stroke(random(255), random(255), random(255), 50); //strichfarbe
  strokeWeight(random(10)); //strichdicke
  ellipse(mouseX, mouseY, durchmesser, durchmesser);
  fill(0, 0, 255, 50); //flache füllen - 70 dahinter - 70% deckkraft
  strokeWeight(2);
  quad(mouseX, mouseY, 0, 0, 0, 0, 0, 5);
}

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  ellipse(x, y, speed+20, speed+20);
}



