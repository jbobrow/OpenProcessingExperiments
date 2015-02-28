
//Alex Lim, CP1 mods 4/5
//www.dizbalex.webs.com
int num = int(random(16));
boolean mode = false;
void setup()
{
  size(400, 400);
  background(100, 175, 120);
  smooth();
  noLoop();
}
void draw()
{
  String responses[] = {"outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"};
  if (mode == true)
  {
    fill(0);
    ellipse(200, 200, 380, 380);
    fill(255);
    triangle(100, 50, 300, 50, 200, 150);
    fill (255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text(responses[num], 50, 200, 300, 200);
    num = int(random(16));
  }
  else
  {
    noStroke();
    fill(0);
    ellipse(200, 200, 380, 380);
    fill(255);
    ellipse(200, 200, 200, 200);
    stroke(0);
    strokeWeight(8);
    noFill();
    ellipse(200, 160, 80, 65);
    ellipse(200, 235, 110, 80);
    strokeWeight(3);
  }
}
 
void mousePressed()
{
  mode = !mode;
  redraw();
}
