
boolean mode=true;
String responce[] =
{
  "Outlook not so good", "Heck no!", "Ask your teacher", 
  "Yes indeed", "You better believe it", "I dont think so, buddy", 
  "I have no idea. Ask again!", "1100101100!\nthats computer speak for YES", 
  "Nope", "100% Yes!", "maybe, maybe not", "eh"
};

void setup()
{
  size(500, 500);
  smooth();
  frameRate(200);
  textAlign(CENTER);
  noLoop();
}

void draw()
{
  int i=int(random(responce.length)); 

  if (mode==true)
  {
    redraw();
    background(100, 0, 100);
    fill(0);
    rect(20, 20, 75, 75);
    ellipse(250, 250, 300, 300);
    fill(255);
    ellipse(250, 250, 125, 125);
    noFill();
    strokeWeight(3.5);
    ellipse(250, 275, 40, 50);
    ellipse(250, 225, 40, 50);
  }

  else
  {
    redraw();
    background(100, 0, 100);
    rect(25, 25, 75, 75);
    fill(0);
    ellipse(250, 250, 300, 300);
    fill(255);
    textSize(15);
    
    text(responce[i],250,250);
    
  }
  textSize(12);
  text("PRESS ME",60,55);
}
void mousePressed()
{
  if (mouseX > 20 && mouseX < 95 &&
    mouseY > 20 && mouseY < 95)
  {
    redraw();
    fill(155);
    mode=!mode;
  }
}
void mouseReleased()
{
  fill(0);
  rect(20, 20, 75, 75);
}


