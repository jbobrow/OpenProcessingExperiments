
boolean mode = false;
void setup()
{
  size(600, 600);
  noLoop();
  textSize(13);
}
void draw()
{
  String[] answers = {
    "YES.", 
    "NO.", 
    "MAYBE.", 
    "I DON'T KNOW.", 
    "CAN YOU REPEAT THE QUESTION?", 
    "YOU'RE NOT THE BOSS OF ME.", 
    "SURE.", 
    "CONTACT YOUR LOCAL AUTHORITIES.", 
    "OUT OF STOCK.", 
    "idk lol XD", 
    "NOT MY JURISDICTION", 
    "IDGAF YOLO", "MEH.", 
    "WHOA THAT QUESTION WAS AWK.", 
    "OH GOD YES YES SO MUCH YES", 
    "shhhhhhhhhhhh stop crying"
  };
  background(255);
  if (mode == true)
  {
    fill(0);
    ellipse(300, 300, 500, 500);
    fill(173, 64, 203);    
    triangle(100, 250, 500, 250, 300, 400);
    textAlign(CENTER);
    fill(0);
    text(answers[int(random(answers.length))], 305, 305);
  }
  else
  {
    fill(0);
    ellipse(300, 300, 500, 500);
    fill(255);
    ellipse(300, 200, 50, 50);
    ellipse(300, 250, 60, 60);
    fill(173, 64, 203);    
    triangle(200, 525, 300, 550, 400, 525);
    fill(255);
    translate(250, 250);
    rotate(-.9);
    ellipse(-0, -150, 100, 30);
    rotate(.9);
    translate(-250, -250);
    fill(0);
    ellipse(300, 200, 40, 40);
    ellipse(300, 250, 50, 50);
  }
}
void mousePressed()
{
  if (mouseX > 150 && mouseY > 150 && mouseX < 450 && mouseY < 450)
  {
    mode = !mode;
    redraw();
  }
}
