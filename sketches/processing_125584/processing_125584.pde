
int counter;

void setup()
{
  size(1000, 500);
  counter = 0;

  fill(0, 0, 0);
  textSize(24);
  text("Press Space To Drive", 375, 485);
}

void draw()
{
  image(loadImage("dark city.jpg"), 0, -500); //background
  //street
  fill(175, 175, 175);
  rect(0, 400, 1000, 200);




  if (counter % 2 == 0)
  {
    //street lights 1
    fill(100, 100, 100);
    rect(-10, 100, 20, 300);
    rect(190, 100, 20, 300);
    rect(390, 100, 20, 300);
    rect(590, 100, 20, 300);
    rect(790, 100, 20, 300);
    rect(990, 100, 20, 300);
    rect(1190, 100, 20, 300);
    fill(252, 215, 23);
    ellipse(0, 100, 50, 50);
    ellipse(200, 100, 50, 50);
    ellipse(400, 100, 50, 50);
    ellipse(600, 100, 50, 50);
    ellipse(800, 100, 50, 50);
    ellipse(1000, 100, 50, 50);
    ellipse(1200, 100, 50, 50);
  }

  if (counter % 2 == 1)
  {
    //street lights 2
    fill(175, 175, 175);
    rect(0, 400, 1000, 200);
    fill(100, 100, 100);
    rect(90, 100, 20, 300);
    rect(290, 100, 20, 300);
    rect(490, 100, 20, 300);
    rect(690, 100, 20, 300);
    rect(890, 100, 20, 300);
    rect(1090, 100, 20, 300);
    rect(1290, 100, 20, 300);
    fill(252, 215, 23);
    ellipse(100, 100, 50, 50);
    ellipse(300, 100, 50, 50);
    ellipse(500, 100, 50, 50);
    ellipse(700, 100, 50, 50);
    ellipse(900, 100, 50, 50);
    ellipse(1100, 100, 50, 50);
    ellipse(1300, 100, 50, 50);
  }

  //car
  fill(185, 0, 0);
  rect(300, 325, 400, 100);
  fill(0, 0, 0);
  ellipse(360, 420, 100, 100);
  fill(0, 0, 0);
  ellipse(640, 420, 100, 100);
  noStroke();
  fill(113, 255, 247);
  triangle(510, 325, 600, 325, 510, 250);
  rect(460, 250, 50, 75);
  triangle(460, 250, 300, 325, 460, 325);
}
void keyPressed()
{
  loop();
  counter++;
}



