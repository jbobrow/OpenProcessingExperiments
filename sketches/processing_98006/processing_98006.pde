


//Variable for radians!
int deg;


void setup() {
  size(600, 600);
}

void draw() {
  background(70);
  if (mouseX>250 && mouseX<350 && mouseY>250 && mouseY<350 && deg<180) {
    deg+=6;
  }

  if ((mouseX<250 || mouseX>350 || mouseY<250 || mouseY>350) && deg>0) {
    deg-=6;
  }

  //Anitmate!
  pushMatrix();
  translate(200, 200);
  rotate(radians(deg));
  fill(255);
  triangle(0, 0, -100, 100, -200, 0);
  popMatrix();


  //Target box!
  rectMode(CENTER);
  fill(random(100, 255), random(100, 255), random(100, 255));
  rect(300, 300, 100, 100);

  //Ball
  ellipseMode(CENTER);
  fill(255);
  ellipse(mouseX, mouseY, 50, 50);

  //Ball's home!
  rectMode(CENTER);
  stroke(255);
  strokeWeight(7);
  noFill();
  line(200, 200, 200, 400);
  line(400, 200, 400, 400);
  line(200, 400, 400, 400);
}



