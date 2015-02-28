
void setup()
{
 size (500,500);
 smooth();
 fill(255,255,0);
 ellipse(250, 250, 450, 450); 
  noFill();
  strokeWeight(5);
  stroke(255, 102, 0);
  stroke(0, 0, 0);
  bezier(400, 325, 425, 400, 100, 75, 75, 350);
  fill(0);
  ellipse(150, 150, 100, 150);
  ellipse(350, 150, 100, 150);
  strokeWeight(15);
  stroke (255);
  line (390, 330, 450, 450);
  stroke(142,99,69);
  line (390, 330, 405,360);
}

