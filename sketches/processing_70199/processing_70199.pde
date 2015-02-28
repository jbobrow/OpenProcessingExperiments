
float angle = 0.0;

void setup()
{
  size(500, 500);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}

void draw()

{

  if (mousePressed) {   

    background(100, mouseX, mouseX);
    fill(255);
    pushMatrix(); 
    translate(mouseX, mouseY);
    rotate(angle);
    rect(0, 0, mouseY/2, mouseX/2);
    popMatrix(); 
    angle += 0.5;

    fill(100, 80);
    ellipse(width/2, height/2, mouseY, mouseY);
  }

  else {
    fill(255, mouseY, mouseX, 80);
    ellipse(width/2, height/2, mouseY, mouseY);
  }


  fill(255, 120);
  pushMatrix(); 
  translate(mouseX, mouseY);
  rotate(angle);
  rect(0, 0, mouseY/8, mouseX/8);
  popMatrix(); 
  angle += 0.9;

  pushMatrix();
  translate(mouseX, mouseY);
  fill(100, mouseX, mouseX, 30);
  ellipse(0, 0, mouseY/5, mouseY/5);
  popMatrix();
}


void keyPressed() {

  if (key =='r') {
    background(100, mouseX, mouseY);
  }
}


