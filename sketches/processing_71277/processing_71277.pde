
void setup ()
{
  size(500, 500);
  stroke (0);
  rect ( 0, 0, 500, 500);
}

void draw ()
{
  textAlign(CENTER);
  textSize(25);
  text("Free Draw", 250, 40);
}

void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    noStroke();
    fill(0); //black
    ellipse(mouseX, mouseY, 10, 10);
  }
  if (mouseButton == RIGHT)
  {
    noStroke();
    fill(0, 255, 0); // neon green
    ellipse(mouseX, mouseY, 15, 15);
  } 
  if (keyPressed == true && key == 'r')
  {
    noStroke();
    fill(255, 0, 0); // red
    ellipse(mouseX, mouseY, 15, 15);
  }
  if (keyPressed == true && key == 'y')
  {
    noStroke();
    fill(255, 237, 100); // yellow
    ellipse(mouseX, mouseY, 15, 15);
  }
  if (keyPressed == true && key == 'b')
  {
    noStroke();
    fill(0, 0, 255); // blue
    ellipse (mouseX, mouseY, 10, 10);
  }
  if (keyPressed == true && key == 'p')
  {
    noStroke();
    fill(198, 58, 214); // neon purple
    ellipse(mouseX, mouseY, 15, 15);
  }

  if (keyPressed == true && key == 'm')
  {
    noStroke();
    fill(197, 239, 250); //black(right) and light blue (left)
    ellipse( 500-mouseX, mouseY, 15, 15);
  }
}
void mousePressed()
{
  if (keyPressed == true && key == 'f') //smiley face
  {
    stroke(0);
    fill (255, 237, 100);
    ellipse(mouseX, mouseY, 50, 50);
    arc(mouseX, mouseY + 10, 15, 15, 0, PI);
    fill(0);
    ellipse(mouseX + 7, mouseY, 8, 8);
    ellipse(mouseX - 7, mouseY, 8, 8);
  }
  if (keyPressed == true && key =='z') //clear screen
  {
    fill(255);
    rect(0, 0, 500, 500);
  }
}


/**
 Right click the mouse for green<br>
 Left click the mouse for black<br>
 Hold ' m ' and click the mouse for mirror ellipses<br>
 Hold ' b ' and click the mouse for blue <br>
 Hold ' w ' and click the mouse for white <br>
 Hold ' y ' and click teh mouse for yellow <br>
 Hold ' r ' and click the mouse for red <br>
 Hold ' p ' and click the mouse for purple<br>
 Press mouse and ' f ' for smiley face <br>
 Press mouse and ' z ' to reset screen <br>
 */
