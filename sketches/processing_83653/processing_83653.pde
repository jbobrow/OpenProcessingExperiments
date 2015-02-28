
void setup()
{
  size(400,525);
  background(0,255,255);
  smooth();
  frameRate(20);
  noStroke();
  textSize(36); 
}
void draw()
{
 
 
  fill(255,255,255);
  ellipse(200,450,145,145);
  fill(255,255,255);
   ellipse(200,335,125,125);
   fill(255,255,255);
   ellipse(200,237,105,105);
   fill(0,0,0);
  ellipse(200,345,20,20);
  fill(0,0,0);
  ellipse(200,305,20,20);
  fill(0,0,0);
  ellipse(200,385,20,20);
  fill(0,0,0);
  ellipse(200,420,20,20);
  fill(0,0,0);
  ellipse(175,232,15,15);
  fill(0,0,0);
  ellipse(225,232,15,15);
  fill(255,210,0);
  triangle(195,242,195,258,218,250);
  fill(255,255,255);
  rect(1,505,400,20);
  fill(255,255,255);
  ellipse(random(width),random(height),10,10);
  fill(139,69,19);
  quad(250,300,350,350,340,360,250,310);
  fill(139,69,19);
  quad(150,300,50,350,40,360,150,310);
  fill(0,0,0);
  quad(250,150,250,210,150,210,150,150);
  quad(275,210,275,220,125,220,125,210);
 smooth();
  fill(0,255,0);
  textAlign(CENTER);

  text("Merry",200,80);
  smooth();
  fill(255,0,0);
  textSize(36);
  text("Christmas",200,130);
}
