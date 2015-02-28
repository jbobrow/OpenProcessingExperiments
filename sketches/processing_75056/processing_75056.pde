
int i;
void setup() {
  frameRate(10);
  size(800, 600);
  background(0);
}

void draw() {
  if (mouseX>450) {
    background(90);
  }
  else {
    background(0);
  }
  if (mouseX>400) {
    fill(0);
//    fill(245, 215, 120);
  }

  else {
    for (int i=0; i<10; i++) {
      fill(random(50), random(50), random(50));
    }
  noStroke();
  triangle(i+155, -147, 250, 600, 55, 600);
    }
  fill(50);
  stroke(250);
  rect(130, 0, 50, 20);
  fill(50);
  arc(155, 47, 65, 65, PI, TWO_PI);
  stroke(200);
  fill(83, 134, 139);
  ellipse(150, 400, 150, 120);
  fill(40);
  ellipse(220, 400, 40, 40);
  ellipse(120, 400, 40, 40);
  line(161, 560, 161, 595);
  line(152, 560, 152, 595);
  fill(83, 134, 150);
  rect(106, 458, 90, 120);
  noFill();
  curve(323, 405, 253, 476, 195, 490, 195, 490);
  curve(283, 405, 213, 476, 155, 490, 155, 490);
  stroke(40);
  line(161, 425, 182, 425);

  if (mouseX>400) {
    stroke(83, 134, 139);
  }
  else {
    stroke(40);
  }
  line(182, 425, 187, 420);
  line(161, 425, 155, 420);
  noStroke();
  fill(46,46, 46);
  if(mouseX>340){
    fill(100,50,40);
  }
    else{
      fill(100,50,80);
  }
  ellipse(mouseX,455,65,57);
}



