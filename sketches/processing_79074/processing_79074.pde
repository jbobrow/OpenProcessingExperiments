
boolean Q = true;
String words [] = {
      "No", "Yes", "Think Harder", "Go Away", "It is certain", "Let me think about it", "You don't want to know...", "Look Behind You", "Don't worry about it", "Shut Up", "QUIT Bothering me", "It is kno  awww forget it"
    };
void setup()
{
  size(500, 500);
  noLoop();
}
void draw()
{
  if (Q == true)
  {
    //Magic Ball
    smooth();
    strokeWeight(1);
    stroke(0);
    fill(20);
    ellipse(250, 250, 430, 430);
    fill(255);
    ellipse(250, 150, 170, 135);
    strokeWeight(10);
    ellipse(250, 180, 60, 60);
    ellipse(250, 120, 50, 50);
    //text box
    rect(0, 400, 500, 100);
    fill(0);
    textSize(25);
    text("Think of a Question and press a key", 50, 430);
  }
  if (Q==false)
  {
    //Magic Ball
    fill(10);
    ellipse(250, 250, 430, 430);
    fill(225, 13, 250); 
    rect(130, 130, 230, 200);
    fill(0);
    textSize(15);
    text(words[(int(random(0, 12)))], 170, 250);
    // Text Box
    fill(255);
    rect(0, 400, 500, 100);
    textSize(25);
    fill(0);
    text("Now press b to restart again or go away", 50, 430);
  }
}
void keyPressed()
{
  Q=!Q;
  redraw();
}
