
void setup() {
  size(200, 200);
  colorMode(RGB);
  frameRate(30);
  smooth(4);
}

void draw() {
  background(255);
  stroke(0);


  stroke(60, 100, 10); // green wings
  for (int av = 30; av<=120; av+=30) {
    strokeWeight(7);
    beginShape();
    vertex(width/2 -50, height/2 + av/2);
    vertex (width/2, height/2-30 );
    vertex(width/2 +50, height/2 + av/2);
    endShape();
  }

  stroke(0);
  strokeWeight(5);
  fill(232, 16, 211);
  ellipse(100, 120, 50, 80); // torso


  strokeWeight(20);
  line(100, 90, 100, 150); // body stripe

  strokeWeight(0);

  fill(mouseX+150, mouseY+100, 0); // dot color
  ellipse(100, 110, 5, 15); // body dot


  fill(62, 9, 155);
  ellipse (110, 160, 20, 20); // feet
  ellipse(90, 160, 20, 20);
  fill(255);
  ellipse(85, 165, 10, 10);
  ellipse(115, 165, 10, 10);

  strokeWeight(1); 
  noFill();
  arc(120, 50, 12, 50, HALF_PI, PI+HALF_PI);// eye stalks
  arc(80, 50, 12, 50, PI+HALF_PI, TWO_PI+HALF_PI); 

  strokeWeight(2);
  fill(255, 255-mouseX, 255-mouseX);
  ellipse(100, 80, 45, 55); // head

  arc(100, 92, 40, 45, PI+QUARTER_PI, TWO_PI-QUARTER_PI); // mouth

  fill(255);
  ellipse(75, 30, 20+mouseX*.05, 20+mouseY*.05); // left eye
  ellipse(125, 30, 20+mouseY*.05, 20+mouseX*.05); // right eye
  fill(255, 0, 0);
  ellipse(123, 32, mouseX*.05, mouseX*.05); // right pupil
  ellipse(77, 32, mouseX*.05, mouseX*.05); // left pupil

  noFill();
  arc(75, 30, 30, 30, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  arc(125, 30, 30, 30, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
}
