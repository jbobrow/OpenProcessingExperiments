
//Wayland L. , Eight Ball, CP1 16-17
boolean mode = false;

void setup()
{
  noLoop();
  size(500, 500);
  noStroke();
}
void draw()
{
  background(0, 255, 0);
  fill(0);
  mode =!mode;
  if ( mode == true)
  {
    ellipse(250, 250, 500, 500);
    fill(255);
    ellipse(250, 270, 450, 450);
    fill(255, 0, 0);
    textSize(350);
    textAlign(CENTER);
    text("8", 250, 400);
    fill(0,0,0,50);
    ellipse(250,450,50,50);
  }
  else
  {
    int x = int(random(15));
    ellipse(250, 250, 500, 500);
    fill(255);
    ellipse(250, 270, 450, 450);
    fill(255, 0, 0);
    String answer [] = {
      "outlook not so good", "dont count on it", "my sources say no", "without a doubt, no", "reply hazy, try again", "it is certain not happen", "how about no?", "as I see it, no", "most likely never", "no.", "cannot predict now", "better not tell you now \n because it won't happen", "very doubtful", 
      "yes definitely...not", "concentrate and ask again \n in an hour"
    };
    fill(23, 103, 93);
    triangle(150, 190, 350, 190, 250, 290);

    textSize(32);
    textAlign(CENTER);
    text(answer[x], 250, 325);
        fill(0,0,0,100);
    ellipse(250,450,50,50);
    fill(0,0,0,150);
    ellipse(250,450,40,40);
  }
}

void mousePressed()
{
  if(mouseX > 225 && mouseX < 275 &&
  mouseY > 425 && mouseY < 475)
  {
    ellipse(250,450,40,40);
  redraw();
  }
}
