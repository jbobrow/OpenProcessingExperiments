
boolean mode = true;
String[] answers = {
  "Yes", "No", "Maybe", "Unclear, ask again.", "Of course", "Definitely not.", "Very doubtful", "Most likely"
};
void setup()
{
  noLoop();
  size(400, 400);
  background(255);


  smooth();
}
void draw()
{
  if (mode== true)
  {
    background(255);
    fill(0);
    ellipse(200, 200, 200, 200);
    fill(255);
    ellipse(200, 140, 85, 50);
    noFill();
    ellipse(200, 130, 30, 10);
    ellipse(200, 144, 40, 15);
    fill(0);
    textSize(20);
    textAlign(LEFT);
    text("Think of a yes-or-no question and \n        click to ask the 8-ball.", 30, 350);
  }
  else 
  {
    background(255);
    fill(0);
    ellipse(200, 200, 200, 200);
    fill(255);
    ellipse(200, 140, 85, 50);
    noFill();
    ellipse(200, 130, 30, 10);
    ellipse(200, 144, 40, 15);
    fill(0);
    textSize(20);
    textAlign(LEFT);
    text("Click to ask another question.", 50, 350);
    stroke(255);
    textAlign(CENTER);
    fill(255);
    textSize(20);
    text(answers[int(random(0, 8))], 200, 200);
    redraw();
  }
}
void mousePressed()
{
  mode = !mode;
  fill(0);
  ellipse(200, 200, 200, 200);
  fill(255);
  ellipse(200, 140, 85, 50);
  noFill();
  stroke(0);
  ellipse(200, 130, 30, 10);
  ellipse(200, 144, 40, 15);
  redraw();
}


