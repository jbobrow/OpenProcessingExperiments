
int num;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);
  noFill();
  if (mousePressed == true) {
    for (int x = -400; x < 500; x = x + 50) {
      strokeWeight(2);
      stroke(x+0, 218, 174, 200);
      beginShape();
      vertex(x+329, 250);
      vertex(x+471, 250);
      vertex(x+471, 300);
      vertex(x+436, 300);
      vertex(x+436, 478);
      bezierVertex(x+435, 539, x+399, 550, x+344, 550);
      vertex(x+329, 550);
      vertex(x+329, 485);
      bezierVertex(x+350, 485, x+364, 482, x+364, 460);
      vertex(x+364, 300);
      vertex(x+329, 300);
      vertex(x+329, 250);
      endShape(CLOSE);
    }
  }
  else {
    frameRate(20);
    fill(0);
    noStroke();
    float num = constrain(5, 0, 5);
    beginShape();
    vertex(329+random(-num, num), 250+random(-num, num));
    vertex(471+random(-num, num), 250+random(-num, num));
    vertex(471+random(-num, num), 300+random(-num, num));
    vertex(436+random(-num, num), 300+random(-num, num));
    vertex(436+random(-num, num), 478+random(-num, num));
    bezierVertex(435+random(-num, num), 539+random(-num, num), 399+random(-num, num), 550+random(-num, num), 344+random(-num, num), 550+random(-num, num));
    vertex(329+random(-num, num), 550+random(-num, num));
    vertex(329+random(-num, num), 485+random(-num, num));
    bezierVertex(350+random(-num, num), 485+random(-num, num), 364+random(-num, num), 482+random(-num, num), 364+random(-num, num), 460+random(-num, num));
    vertex(364+random(-num, num), 300+random(-num, num));
    vertex(329+random(-num, num), 300+random(-num, num));
    vertex(329+random(-num, num), 250+random(-num, num));
    endShape(CLOSE);
  } 
}

