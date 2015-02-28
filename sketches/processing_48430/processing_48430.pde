
void setup ()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  textAlign(CENTER);
  frameRate(1);
}
void draw()
{
  fill(0, 0, 0);
  rect(0, 0, width, height);
  textSize(25);
  fill(255, 0, 0);
  //text ("hohoho",random(300),random(500));
  //text("Merry Christmas!",random(400),random(600));
  fill(255, 255, 255);
  frameRate(15);
  stroke(0, 0);
  ellipse(random(width), random(height), 2, 2);
  ellipse(200, 500, 200, 200);
  ellipse(200, 350, 150, 150);
  ellipse(200, 240, 100, 100);
  //image(loadimage(""),0,0);
  fill(224, 81, 41);
  triangle(200, 270, 195, 240, 205, 240);
  
  //eyes
  fill(0);
  ellipse(180,220,10,10);
  ellipse(220,220,10,10);
  
  fill(255,0,0);
  textSize(20);
  textAlign(CENTER);
  text("Merry Christmas",200,100);
}


