
//Alvin Ha, Computer Programming 4-5, Mr Simon
//Magic Eight Ball

String[] answers = {
  "Outlook not so good", "Don't count on it", "My sources say no", "Without a doubt", "Reply hazy, try again", "It is certain", "My reply is No", "As I see it yes", "Most likely", "You may rely on it", "Cannot predict now", "Better not tell you now", "Very doubtful", "Outlook good", "Yes definitely", "Concentrate and ask again", "YEAHHH"
};
PImage img;
int r = 0;

void setup()
{
  size(576, 390);
}


void draw()
{
  img=loadImage("Galaxy.jpg");
  image(img, 0, 0);
  if (keyPressed != true)
  {
    noStroke();
    fill(0);
    ellipse(288, 195, 350, 350);
    fill(255);
    ellipse(288, 100, 150, 120);
    stroke(0);
    strokeWeight(7);
    ellipse(288, 70, 30, 25);
    ellipse(288, 100, 35, 30);
  }
  else if (keyPressed == true)
  {
    for (int i = 1; i <5; i++)
    {
      int x = int(random(275, 285));
      int y = int(random(190, 200));
      int a = int(random(90, 110));
      noStroke();
      fill(0);
      ellipse(x, y, 350, 350);
      fill(255);
      ellipse(x, a, 150, 120);
      stroke(0);
      strokeWeight(7);
      ellipse(x, 70, 30, 25);
      ellipse(x, 100, 35, 30);
    }
  }

  if (mousePressed == true)
  {
    noStroke();
    fill(0);
    ellipse(288, 195, 350, 350);
    fill(255);
    ellipse(288, 100, 150, 120);
    fill(103, 8, 206);
    triangle(290, 80, 210, 105, 370, 105);
    fill(255);
    text(answers[r], 250, 200);
  }
}

void mousePressed()
{
  r = int(random(0, 16));
}
