
//Alina V, CP1 mods 16, 17, Magic 8 Ball
String reply[] = {
  "No", "Yes", "It is unlikely", "Please try again", "Chances are low", "Absolutely", "I don't think so", "My sources say yes", "It is certain", "Don't count on it"
};
boolean mode = false;
void setup()
{
  noLoop();
  size(400, 425);
}
void draw()
{
  int i = int(random(reply.length)); 
  String answer = reply[i];
  background(41, 193, 237);
  fill(255, 0, 0);
  rect(0, 350, 400, 75);
  if (mode == true)
  {
    fill(0);
    ellipse(200, 200, 300, 300);
    fill(154, 40, 237);
    rect(135, 140, 130, 120);
    fill(255);
    textAlign(CENTER);
    textSize(14);
    text(answer, 200, 200);
    fill(0);
    textSize(18);
    textAlign(CENTER);
    text("Click again to reset", 215, 375);
  }
  else
  {
    fill(0);
    ellipse(200, 200, 300, 300);
    fill(255);
    ellipse(200, 200, 150, 150);
    noFill();
    strokeWeight(3);
    ellipse(200, 175, 50, 50);
    ellipse(200, 225, 50, 50);
    fill(0);
    textSize(18);
    textAlign(CENTER);
    text("Ask a yes or no question and \nclick here for your answer", 215, 375);
  }
}
void mouseClicked()
{
  if (mouseX > 0 && mouseY > 350 && mouseX < 400 && mouseY < 425)
  {
    mode = !mode;
    redraw();
  }
}
