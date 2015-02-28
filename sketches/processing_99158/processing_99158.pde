
float ballX=250;
float ballXSpeed=4;


void setup()
{
  size(500, 500);
  background(63, 191, 240);
  smooth();
  frameRate(60);
}

void draw()
{
    background(63, 191, 240);
  fill(226,245,178);
  stroke(226,245,178);
  rect(0, 400, 500,100);
  fill(63,240,152);
  stroke(63,240,152);
  ellipse(250,ballX,100,100);
  fill(255,175,0);
  stroke(255,175,0);
  ellipse(0,0,100,100);
  fill(214,145,207);
  textSize(random(36));
  textAlign(CENTER);
  text("Have fun at \n the beach!!", mouseX, mouseY);


  ballX = ballX+ballXSpeed;
  if(ballX>400)
  ballXSpeed=ballXSpeed*-1;
  if(ballX<175)
  ballXSpeed=ballXSpeed*-1;
  
}
