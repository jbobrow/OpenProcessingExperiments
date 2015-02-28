
//Tina L., CP1 14/15 OneHundredRandomShapes
void setup()
{
  size(320, 385);
  frameRate(13);
  textSize(50);
}
void draw()
{
  background(0);
  noStroke();
  ellipse(300,130,20,20);
  rect(290,130,20,180); //gold retangle
  stroke(0);
  fill(242,233,46);
  rect(10,10,280,300); //yellow rectangle
  fill(150,150,150);
  rect(90,170,120,40); //big gray rectangle
  rect(270,175,5,30); //small gray rectangle
  fill(random(175,256),random(175,256),random(175,256));
  rect(35,50,70,80);
  rect(115,50,70,80);
  rect(195,50,70,80);
  fill(255);
  textSize(50);
  text("7",55,110);
  text("7",135,110);
  text("7",215,110);
  fill(random(256),random(256),random(256));
  text("You won!",40,270);
  translate(100,180);
  int c = 1;
  while (c<=100)
  {
    fill(222,180,13);
    ellipse(int(random(100)), int(random(200)), 10, 10);
    c++;
  }
}
