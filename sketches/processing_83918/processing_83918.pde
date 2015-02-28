
String words[]={"Yes","No","Most likely","Absolutely","Who knows", "Go ask Linda", "On Break", "Never","Buy me cheesecake","Maybe","After the iPhone 8","Out of Battery"};
boolean mode;
void setup()
{
  size(400,400);
  noLoop();
  frameRate(15);
}

void draw()
{
  int i = int(random(0,12));
  background(160,58,58);
  smooth();
  fill(0);
  ellipse(200,200,350,350);
  fill(255);
  ellipse(200,100,190,140);
  stroke(0);
  strokeWeight(7);
  ellipse(200,60,80,40);
  ellipse(200,113,110,70);
  if(mode==true)
  {
    background(13,43,129);
    fill(100,33,219);
    ellipse(200,200,350,350);
    fill(255);
    ellipse(200,100,190,140);
    ellipse(200,60,80,40);
    ellipse(200,113,110,70);
    stroke(0);
    textAlign(CENTER);
    textSize(35);
    text(words[i], 200,240);
  }
  else if(mode==false)
  {
    textAlign(CENTER);
    textSize(20);
    text("Ask a yes/no question and click!",200,225);
  }
}
void mouseClicked()
{
  mode=!mode;
  redraw();
}
