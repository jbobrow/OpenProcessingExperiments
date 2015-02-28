
//Adrianne Born
//Week 3 hw
//Creative Computing Ben Norskov
//18 Feb 2013

void setup () {
  size(500, 500);
}
//commands

void draw () {
  background(0);
  fill(255);
  rect(250, 0, 250, 250);
  rect(0, 250, 250, 250);
  stroke(255);
  fill(200, 0, 45);
  if ((mouseX < 250) && (mouseY <250)) {
    ellipse(mouseX, mouseY, 50, 50);
  }

  fill (200, 56, 111);
  if ((mouseY < 125) &&( mouseX <250)) {
    ellipse (mouseX, mouseY, 75, 75);
  }


  //DIVIDE


  if ((mouseY >250) && (mouseX >250)) {
    line(250, 250, mouseX, mouseY);
    line(width, 250, mouseX, mouseY);
    line(375, height, mouseX, mouseY);
    line(375, height/2, mouseX, mouseY);
    line(width, height, mouseX, mouseY);
    line(250, height, mouseX, mouseY);
    line(250, 375, mouseX, mouseY);
    line(width, 375, mouseX, mouseY);
  }

  //DIVIDE

    rect(250, 0, 250, 250);
    if ((mouseX>250)&&(mouseX<500))
      if ((mouseY>0)&&(mouseY<250)) {
        fill(200, 0, 45);
        rect(250, 0, 250, 250);
      }
  };



