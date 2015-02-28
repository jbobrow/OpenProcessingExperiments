
// Lucky Wen, EIGHT BALL, CP1 mods 16-17

boolean mode;
String letters []= { 
  "Signs point to yes.", "           Yes.", "     Reply hazy", "     try again.", "   Without a doubt.", "My sources say no.", "   As I see it, yes.", " You may rely on it.", "Concentrate and ask again.", " Outlook not so good.", "  It is decidedly so.", "Better not tell you now.", "    Very doubtful.", "   Yes - definitely.", "     It is certain.", "Cannot predict now.", "     Most likely.", "   Ask again later.", "  My reply is no.", "     Outlook good.", "  Don't count on it."
};
void setup()
{
  mode = false;
  noLoop();
  size(600, 650);
}

void draw()
{
  fill(255, 0, 0);
  rect(50, 500, 500, 100);
  int i = int(random(20));
  if (mode==false)
  {
    fill(0);
    ellipse(280+20, 250, 400, 400);  // fat outer circle
    fill(255);
    ellipse(280+20, 250, 220, 220);  // inner circle
    fill(0);
    textSize(150);
    text("8", 230+20, 300);

    textSize(19);
    strokeWeight(7);
    text("Think of a question then click on the eight", 70, 530);
  }
  else 
  {
    fill(255);
    ellipse(280+20, 250, 220, 220);  // another inner circle

    fill(119, 14, 227);
    triangle(190+20, 200, 370+20, 200, 280+20, 350);  // purple triangle

    fill(0);
    textSize(20);
    text(" Click on the purple triangle and start over.", 70, 530);

    fill(0);
    textSize(30);

    text(letters[i], 140, 570);
  }
}

void mousePressed()
{

  {
    if (dist(mouseX, mouseY, 280, 250)<110)
    { 

      mode=!mode;
      redraw();
    }
  }
}
