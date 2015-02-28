
//Julie O, CP1 Mods 4/5, Magic 8 Ball

boolean modeAnswer = false;
String[]answers = {"i sure hope so.", "YOU BETCHA \n*Sarah Palin wink*", "haha, yeah right...","i'd tell you, \nbut the answer \nwould make you \nhit me","not in a \nmillion years,\ndude","what? no way \nam i answering \nthat","the answer is 42","what a weird \nquestion. lemme think. \nask again","sure, why not?"};

void setup()
{
  size(300,300);
  smooth();
  background(69,139,116);
  frameRate(5);
  noLoop();
  text("",-100,-100);
}

void draw()
{
  fill(55,16,109);
  ellipse(150,150,250,250);
  fill(255,255,255);
  ellipse(150,115,125,125);
  stroke(0,0,0);
  strokeWeight(3);
  ellipse(150,100,20,20);
  ellipse(150,125,30,30);
  if (modeAnswer == true)
  {
    fill(55,16,109);
    ellipse(150,150,250,250);
    fill(171,130,255);
    ellipse(150,150,175,175);
    fill(255);
    textAlign(CENTER);
    textSize(14);
    text(answers[int(random(answers.length))],150,120);
  }
}

void mousePressed()
{
  if(mouseX>50 && mouseY<250 && mouseY>50 && mouseY<250)
  {
    modeAnswer = true;
    redraw();
  }
//  if(mouseX>250 && mouseY<50 && mouseY>0 && mouseX<300)
//  {
//    modeAnswer = false;
//    redraw();
//  }
}

void mouseReleased()
{
  modeAnswer = false;
  fill(255);
  redraw();
}
