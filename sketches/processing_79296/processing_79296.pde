
//Cristen W, CP1, Mods 16/17, Magic8Ball

String lines[]  = {
  "Outlook not so good", "Don't count on it", 
  "My sources say no", "Without a doubt", "Reply hazy, try again", 
  "It is certain", "My reply is no", "As I see it yes", 
  "Most likely", "You may rely on it", "Cannot predict now", 
  "Better not tell you now", "Very doubtful", "Outlook good", 
  "Yes definitely", "Concentrate and ask again"
};
boolean mode = false;

void setup()
{
  size(300, 300);
  background(167,167,167);
  noLoop();
}
void draw()
{
  if (mode == false)
  {
    fill(0);
    ellipse(150, 150, 250, 250);
    triangle(15, 15, 30, 15, 15, 30);
    triangle(285, 15, 270, 15, 285, 30);
    triangle(15, 285, 15, 270, 30, 285);
    triangle(285, 285, 270, 285, 285, 270);
    fill(255);
    ellipse(150, 120, 150, 150);
    noFill();
    strokeWeight(8);
    ellipse(150, 145, 50, 50);
    ellipse(150, 95, 50, 50);
  }
  else
  {
    fill(0);
    ellipse(150, 150, 250, 250);
    //background
    triangle(15, 15, 30, 15, 15, 30);
    triangle(285, 15, 270, 15, 285, 30);
    triangle(15, 285, 15, 270, 30, 285);
    triangle(285, 285, 270, 285, 285, 270);
    //not
    fill(255);
    noStroke();
    rect(55,90,188,90,55,188,188,188);
    fill(0);
    stroke(0);
    textSize(14);
    textAlign(CENTER);
    int i = int(random(0,16));
    text (lines [i], 150,140);
  }
}

void mouseClicked()
{
  mode =! mode;
  redraw();
}
