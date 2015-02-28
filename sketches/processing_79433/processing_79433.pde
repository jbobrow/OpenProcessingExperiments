
//Matheson Gee Computer Programming 1 Mods:14/15
boolean mode= false;
String[] answers=
{"outlook not so good",
"don't count on it",
"my sources say no",
"without a doubt",
"reply hazy, try again",
"it is certain",
"my reply is no",
"as i see it yes",
"most likely",
"you may rely on it",
"cannot predict now",
"better not tell you",
"very doubtful",
"outlook good",
"yes definitely",
"concentrate and ask again",
};

void setup()
{
  size(400, 400);
}
void draw()
{ 
  background(255, 255, 255);
  if (mode==false)
  {
    fill(0, 0, 0);
    ellipse(200, 200, 325, 325);
    fill(255);
    ellipse(200, 110, 145, 125);
    noFill();
    stroke(0);
    strokeWeight(8);
    ellipse(200, 75, 50, 38);
    ellipse(200, 123, 70, 55);
  }
  else
  {
    noLoop();
    size(400, 400);
    background(255);
    fill(0, 0, 0);
    ellipse(200, 200, 325, 325);
    fill(168, 28, 229);
    triangle(140, 100, 260, 100, 200, 160);
    int i=int(random(0,16));
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text(answers[i],200,200);
  }
}
void mouseClicked()
{ 
  mode=!mode;
  redraw();
  }
