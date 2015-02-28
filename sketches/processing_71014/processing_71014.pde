
//MONSTER FACE
//by Luo
//eye movement code referenced from 
//http://www.openprocessing.org/sketch/68825

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  noStroke();
  background(255, 205, 70);
  
  fill(0, 150, 30);
  float earY = constrain(mouseY, 300, 450);
  //left ear
  beginShape();
  vertex(135, 200); 
  bezierVertex(100, 250, 0, earY, 130, 270);
  endShape();
  //right ear
  beginShape();
  vertex(365, 200); 
  bezierVertex(400, 250, 500, earY, 370, 270);
  endShape();
  fill(205, 94, 102);

  //neck
  for (int i = 0; i < 150; i+=10) {
    fill(50, i*2, i);
    ellipse(250, 500-i, 100, 20);
  }

  //face
  fill(0, 200, 0);
  ellipse(250, 250, 250, 300);
  
  //mouth
  fill(200, 0, 0);
  arc(250, 275, 165, 175, 0, PI); //lower
  fill(255, 255, 255);
  triangle(200, 300, 225, 340, 250, 300);
  triangle(250, 300, 275, 340, 300, 300);
  fill(0, 200, 0);
  arc(250, 275, 165, 90, 0, PI); //upper

  //horn
  noFill();
  for (int i = 30; i <= 105; i++) {
    color c1 = color(0);
    color c2 = color(250);
    float inter = map(i, 30, 105, 0, 3);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    strokeWeight(4);
    strokeCap(SQUARE);
    arc(250, i, i-30, i-30, PI/4, 3*PI/4);
  }
  //eye, blink
  if (mousePressed == true) {
    //spots
    noStroke();
    fill(random(100, 255), random(100, 230), 0);
    ellipse(320, 150, 20, 20);
    ellipse(270, 160, 20, 20);
    ellipse(310, 220, 20, 20);
    ellipse(210, 370, 20, 20);
    ellipse(340, 320, 20, 20);
    ellipse(300, 360, 20, 20);
    ellipse(250, 250, 20, 20);
    ellipse(160, 320, 20, 20);
    ellipse(170, 200, 20, 20);
    ellipse(200, 150, 20, 20);
    ellipse(350, 200, 20, 20);
    //blink
    noFill();
    stroke(0);
    strokeWeight(3);
    arc(250, 200, 100, 75, 0, PI);
    //LASER
    strokeWeight(1);
    for(float i = 0; i <= 2*PI; i+=(PI/120)){
      stroke(random(100, 255), random(100, 255), 50);
      line(250, 30, 250 + 150*cos(i), 30 + 150*sin(i));
    }
  }
  //no blink
  else {
    stroke(0);
    strokeWeight(1);
    fill(255, 255, 255);
    ellipse(250, 200, 100, 75);
    fill(0, 0, 0);
    //pupil movement
    float eyeX = 250;
    float eyeY = 200;
    float dx = constrain((mouseX-eyeX)/20, -5, 5);
    float dy = constrain((mouseY-eyeY)/20, -5, 5);
    ellipse(eyeX + dx, eyeY + dy, 25, 55);
    fill(255, 255, 255);
    ellipse(eyeX + dx+5, eyeY + dy-10, 10, 10);
  }

  //blush
  noStroke();
  fill(255, 100, 177);
  ellipse(155, 260, 50, 50);
  ellipse(345, 260, 50, 50);
  fill(255, 30, 157);
  ellipse(155, 260, 30, 30);
  ellipse(345, 260, 30, 30);

  //nostrils
  stroke(0);
  strokeWeight(2);
  line(225, 270, 240, 290);
  line(280, 270, 265, 290);
}
