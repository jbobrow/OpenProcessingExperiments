
void setup()
{
  size(600, 600);
  background(0, 0, 0);
  frameRate(5);
}

void draw()
{
  fill(0, 255, 0);
  triangle(300, 100, 100, 400, 500, 400);
  
  fill(111,47,8);
  rect(275,400,50,75);
  
  fill(random(255), random(255), random(255));
  ellipse(random(150,450), random(320,350), 10, 10);
  fill(random(255), random(255), random(255));
  ellipse(random(150,450), random(320,350), 10, 10);
  fill(random(255), random(255), random(255));
  ellipse(random(125,475), random(360,380), 10, 10);
  fill(random(255), random(255), random(255));
  ellipse(random(125,475), random(360,380), 10, 10);
  fill(random(255), random(255), random(255));
  ellipse(random(200,400), random(250,300), 10, 10);
  fill(random(255), random(255), random(255));
  ellipse(random(200,400), random(250,300), 10, 10);
  fill(random(255), random(255), random(255));
  ellipse(random(250,350), random(175,225), 10, 10);
  fill(random(255), random(255), random(255));
  ellipse(random(250,350), random(175,225), 10, 10);
  
  textAlign(CENTER);
  text("Merry Christmas!", 200, 100);
}

