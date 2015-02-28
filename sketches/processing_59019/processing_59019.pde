
void setup() {
  size(1024, 768);
  smooth();
  background(0, 0, 0);
}

void draw() {

  if (mousePressed) {
    background(0, 0, 0);
    float f = 1;
    float durchmesser = random(100);
    fill(random(0,0),random(0,0),random(0,0));
    stroke(random(255,255),random(255,255),random(255,255));
    strokeWeight(random(10)); 
    ellipse(mouseX, mouseY, durchmesser, durchmesser);
    fill(50, 50, 50, 50); 
    strokeWeight(2);
  }   
  else {
    float f = 0.3333333;
    fill(random(80,140),random(100,90),random(20,70),20);
    stroke(random(80,140),random(100,90),random(20,70),20); 
    strokeWeight(random(10));
    variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
    fill(0, 0, 255, 50); 
    strokeWeight(2);
  }

  if (keyPressed) {
    if (key == 's') {
      saveFrame("picture-####.png");
    }
  }
}

void mouseReleased () {
  background(255, 255, 255);
  float f = 2;
  float durchmesser = random(100);
  fill(random(0), random(0), random(0), 70); 
  stroke(random(0), random(0), random(0), 50); 
  strokeWeight(random(10)); 
  ellipse(mouseX, mouseY, durchmesser, durchmesser);
  fill(0, 0, 0, 0); 
  strokeWeight(2);
}

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  ellipse(x, y, speed+20, speed+20);
}



