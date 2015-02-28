
/* @pjs globalKeyEvents= "true"; */

boolean mode= false;
String[] answers= {
  "too early to determine", "yes", "most definitely", "you wish", "cannot determine at the moment", "you know the answer already", "no way"
};

void setup()
{
  size(500, 500);
  noLoop();
  text("", 0, 0);
}

void draw()
{
  background(255);
  fill(0);
  ellipse(250, 250, 350, 350);
  if (mode== false)
  {
    textSize(20);
    textAlign(CENTER);
    text("Ask the magic eight ball a 'yes' or 'no' question \nand click for an answer", 250, 450); 
    fill(255);
    ellipse(250, 130, 135, 85);
    noFill();
    stroke(0);
    strokeWeight(5);
    ellipse(250, 110, 40, 23);
    ellipse(250, 140, 70, 40);
  }
  if (mode==true)
  {
    fill(133, 64, 245);
    triangle(200, 135, 300, 135, 250, 220);
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text(answers[int(random(0, 7))], 250, 175);
    redraw();
  }
}

void mousePressed()
{
  mode=!mode;
  redraw();
}

void mouseReleased()
{
  mode=false;
  redraw();
}



