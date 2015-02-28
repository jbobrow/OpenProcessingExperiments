
boolean mode = false;
void setup()
{
  size(800, 400);
  background(255);
  noStroke();
  noLoop();
}
void draw()
{
  shadows();
  ball();
  reflections();
  whiteArea();
  eight();
  words();
  button();
  if (mode == false)
  {
    subtext();
  }
  else
  {
    int per = int(random(101));
    int think = int(random(3));
    pushStyle();
    textSize(30);
    if (think == 0)
    {
      fill(180);
      text("With much self-doubt,\nit finally answers with:", 12, 97);
      fill(0);
      text("With much self-doubt,\nit finally answers with:", 10, 95);
    }
    else if (think == 1)
    {
      fill(180);
      text("Trying to scratch its head,\nit uncertainly answers with:", 12, 97);
      fill(0);
      text("Trying to scratch its head,\nit uncertainly answers with:", 10, 95);
    }
    else
    {
      fill(180);
      text("Shrugging its shoulders,\nit nervously answers with:", 12, 97);
      fill(0);
      text("Shrugging its shoulders,\nit nervously answers with:", 10, 95);
    }
    textSize(33);
    int msg = int(random(3));
    if (msg == 0)
    {
      fill(180);
      text("50% yes, 50% no?", 12, 192);
      fill(0);
      text("50% yes, 50% no?", 10, 190);
    }
    else if (msg == 1)
    {
      fill(180);
      text(+(per)+"% yes, "+(100-per)+"% no?", 12, 192);
      fill(0);
      text(+(per)+"% yes, "+(100-per)+"% no?", 10, 190);
    }
    else
    {
      fill(180);
      text(+(per)+"% yes, "+(100-per)+"% no?", 12, 192);
      fill(0);
      text(+(per)+"% yes, "+(100-per)+"% no?", 10, 190);
    }
    popStyle();
  }
  pushStyle();
  textSize(10);
  fill(140);
  text("Hello!", 766, 395);
  text("Impossibru to make the button change color when you hover over it because of noLoop( ) :(", 5, 395);
  popStyle();
}
void ball()
{
  fill(0);
  ellipse(600, 200, 350, 350);
}
void reflections()
{
  fill(180, 180, 180, 60);
  ellipse(555, 155, 190, 190);
  fill(180, 180, 180, 50);
  ellipse(560, 160, 215, 215);
  fill(180, 180, 180, 30);
  ellipse(570, 170, 260, 260);
  pushStyle();
  noFill();
  strokeWeight(3);
  stroke(180, 180, 180, 100);
  ellipse(600, 200, 343, 343);
  popStyle();
}
void whiteArea()
{
  fill(225);
  ellipse(550, 150, 165, 165);
  fill(255);
  ellipse(545, 145, 150, 150);
}
void eight()
{
  fill(90);
  textSize(110);
  text("8", 507, 184);
  textSize(90);
  text("8", 514, 176);
  fill(0);
  textSize(100);
  text("8", 510, 180);
}
void shadows()
{
  fill(180);
  ellipse(630, 373, 335, 20);
  fill(160);
  ellipse(620, 373, 275, 20);
  fill(140);
  ellipse(610, 373, 215, 20); 
  fill(120);
  ellipse(600, 373, 155, 20);
}
void words()
{
  textSize(50);
  fill(180);
  text("Indecisive 8-Ball", 13, 53);
  fill(0);
  text("Indecisive 8-Ball", 10, 50);
}
void subtext()
{
  textSize(30);
  fill(180);
  text("Ask it a yes/no question,\nthen click the button.", 12, 92);
  fill(0);
  textSize(30);
  text("Ask it a yes/no question,\nthen click the button.", 10, 90);
}
void button()
{
  pushStyle();
  strokeWeight(1);
  stroke(200);
  fill(255);
  rect(24, 274, 252, 101);
  int whiteAmount=255;
  int c=275;
  while (c<376)
  {
    stroke(whiteAmount);
    line(25, c, 275, c);
    c++;
    whiteAmount--;
  }
  textAlign(CENTER);
  textSize(25);
  fill(0);
  if (mode==false)
  {
    text("Click me!", 150, 330);
    text("_", 102, 332);
  } 
  else
  {
    text("Back", 150, 330);
    text("_", 128, 332);
  }
  popStyle();
}
void mouseReleased()
{
  if (mouseX > 25 && mouseX < 275 && mouseY > 275 && mouseY < 375)
  {
    mode = !mode;
    background(255);
    redraw();
  }
}
void keyPressed()
{
  if (mode == false)
  {
    if (key == 'c' || key == 'C')
    {
      mode = !mode;
      background(255);
      redraw();
    }
  }
  else
  {
    if (key == 'b' || key == 'D')
    {
      mode = !mode;
      background(255);
      redraw();
    }
  }
}
