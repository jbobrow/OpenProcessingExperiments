
//Eric Trinh, EightBall, CP1 mods 16-17

String answers[] = {
  "Not happening", "Come again", "NOPE", "Ha I WISH!", "Today's your lucky day", "Dunno...", "Maybe?", "PRODUCT BROKEN", "GO AWAY", "FONDLE THIS BUTTON", "Gewddddd", "Say what now?", "WHAT THE..."
};
boolean transform = false;
void setup()
{
  size(400, 400);
  background(0);
  noLoop();
}
void draw()
{
  transform = !transform;
  background(0);
  mousePressed();
  int a = int(random(13));
  if (transform == true);
  {
    fill(234, 205, 33);
    ellipse(200, 200, 325, 325);
    fill(255);
    strokeWeight(3);
    ellipse(200, 71, 130, 60);
    strokeWeight(6);
    ellipse(200, 60, 70, 17);
    ellipse(200, 78, 80, 17);
    textAlign(CENTER);
    textSize(15);
    fill(121, 9, 9);
    text("Touch the 8 to reveal your outcome:", 200, 130);
  }
  if ( transform == false)
  {
    fill(234, 205, 33);
    ellipse(200, 200, 330, 330);
    fill(255);
    strokeWeight(3);
    ellipse(200, 71, 130, 60);
    strokeWeight(6);
    ellipse(200, 60, 70, 17);
    ellipse(200, 78, 80, 17);
    textSize(15);
    fill(121, 9, 9);
    text("Touch the 8 to reveal your outcome:", 200, 130);
    textSize(36);
    textAlign(CENTER);
    fill(10, 59, 162);
    text(answers[a], 200, 200);
    println(answers);
  }
}
void mousePressed()
{
  if (dist(mouseX, mouseY, 200, 71) < 31)
  {
    transform = !transform;
    redraw();
  }
}
