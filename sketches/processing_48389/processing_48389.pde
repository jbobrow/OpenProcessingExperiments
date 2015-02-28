
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
}
void draw() 
{
  fill(random (250), random(250), 0);
  frameRate(2);
  textAlign(CENTER);
  textSize(45);
  text("Feliz Navidad!", 200, 100);
  fill(100, 250, 0);
  triangle(200, 150, 50, 500, 350, 500);
  fill(118, 75, 75);
  rect (150, 500, 100, 50);

  fill(random(0, 255), random(200, 255), random(255));
  ellipse(random(105, 295), random(450, 470), 10, 10);

  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(110, 290), random(400, 430), 10, 10);

  fill(random(200, 255), random(255), random(255));
  ellipse(random(115, 285), random(465, 485), 10, 10);

  fill(random(200, 255), random(200, 255), random(255));
  ellipse(random(120, 280), random(340, 360), 10, 10);

  fill(random(200, 255), random(255), random(200, 255));
  ellipse(random(130, 270), random(315, 335), 10, 10);

  fill(random(200, 255), random(255), random(255));
  ellipse(random(140, 260), random(390, 310), 10, 10);

  fill(random(0, 255), random(200, 255), random(255));
  ellipse(random(145, 255), random(365, 385), 10, 10);

  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(160, 240), random(340, 360), 20, 20);

  fill(random(200, 255), random(255), random(255));
  ellipse(random(175, 225), random(315, 335), 10, 10);

  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(180, 220), random(275, 200), 20, 20);

  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(190, 210), random(250, 260), 10, 10);

  fill(245, 206, 79);
  triangle(150, 140, 250, 140, 200, 170);
  fill(250, 250, 250);
  triangle(200, 120, 170, 180, 230, 180);
  fill(250, 250, 0);
  ellipse(200, 120, 30, 30);
  fill(0, 0, 0);
  ellipse(195, 115, 5, 5);
  ellipse(205, 115, 5, 5);
  ellipse(200, 120, 5, 5);
  fill(250, 0, 0);
  line(195, 130, 205, 130);
  fill(250, 0, 0);
  rect(90, 510, 150, 80);
}


void mousePressed()
{

  image(loadImage("puppy.jpg"), 90, 510, 150, 80);
}


