
//Eric K, CP1 mods 4-5, Magic Eight Ball
//url: http://ericsprogrammingsite.webs.com/Eight_Ball.html

String [] answers = {
  "It is\ncertain.", "It is\ndecidedly\nso.", "Without\na doubt.", "Yes -\ndefinitely.", "You may rely\non it.", "As I see it,\nyes.", "Most likely", "Outlook good.", "Yes.", "Signs point\nto yes.", "Reply hazy,\ntry again.", "Ask again\nlater.", "Better not\ntell you\nnow.", "Cannot predict\nnow.", "Concentrate\nand ask\nagain.", "Don't count\non it.", "My reply\nis no.", "My sources\nsay no.", "Outlook not\nso good.", "Very doubtful."
};
boolean mode = false;
void setup()
{
  size(300, 300);
  noLoop();
  textAlign(CENTER, CENTER);
  textSize(13);
}
void draw()
{
  background(204);
  if (mode == true)
  {
    fill(0);
    ellipse(150, 120, 220, 220);
    fill(127, 0, 255);
    triangle(80, 80, 220, 80, 150, 200);
    fill(255);
    text(answers[int(random(answers.length))], 150, 115);
    rect(-1, 240, 301, 301);
    fill(127);
    text("Click the ball again\nto ask another question.", 150, 270);
  }
  else
  {
    fill(0);
    ellipse(150, 120, 220, 220);
    fill(255);
    ellipse(150, 45, 80, 50);
    ellipse(150, 35, 35, 10);
    ellipse(150, 50, 50, 20);
    rect(-1, 240, 301, 301);
    fill(127);
    text("Think of a yes/no question\nand click on the ball.", 150, 270);
  }
}
void mousePressed()
{
  if (dist(mouseX, mouseY, 150, 120) < 110)
  {
    mode = !mode;
    redraw();
  }
}
