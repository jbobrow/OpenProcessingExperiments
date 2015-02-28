
//Brandan H. Computer Prog. 1 Block 7
boolean mode = true;
String answers [] = {
  "I don't think so", "Confucius say.....Yes", "Try asking again", "Magic 8-ball is out to lunch try again in 5 min.", "Definitely", "What type of question is that", "I don't know", "probability = 100%", "Don't ask me your life problems"
};
void setup()
{
  size(750, 750);
  background(255);
  textAlign(CENTER);
  textSize(25);
  smooth();
  noLoop();
}
void draw()
{
  int i = int(random(9));
  fill(0);
  ellipse(375, 375, 650, 650);
  if (mode == true)
  {
    fill(255);
    ellipse(375, 175, 300, 200);
    noFill();
    strokeWeight(6);
    ellipse(375, 125, 75, 40);
    ellipse(375, 175, 105, 55);
    strokeWeight(1);
  }
  else if (mode == false)
  {
    fill(123, 23, 142);
    translate(123,25);
    triangle(150, 90, 350, 90, 250, 150);
    translate(-123,-25);
    fill(255);
    text(answers[i], 375, 375);
    fill(255);
  }
}
void mousePressed()
{
  if (mouseX > 225 && mouseX < 450 && mouseY > 60 && mouseY < 140)
  {
    mode = !mode;
    redraw();
  }
}
