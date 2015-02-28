
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(15);
} 
void draw() 
{
  //background
  fill(255, 255, 255);
  rect(0, 500, 400, 100);
  fill(0, 0, 255);
  rect(0, 0, 400, 500);

  //snow
  fill(255, 255, 255);
  ellipse(random(400), random(600), 10, 10);
  fill(255, 255, 255);
  ellipse(random(400), random(600), 10, 10);
  fill(255, 255, 255);
  ellipse(random(400), random(600), 10, 10);
  fill(255, 255, 255);
  ellipse(random(400), random(600), 10, 10);
  ellipse(random(400), random(600), 10, 10);
  fill(255, 255, 255);
  ellipse(random(400), random(600), 10, 10);

  //words
  textSize(36);
  textAlign(CENTER);
  text(" Happy Penguin", 200, 100);
  text("☺",mouseX,mouseY);

  //tree 1
  fill(0, 255, 0);
  triangle(20, 475, 40, 400, 60, 475);
  fill(77, 39, 17);
  rect(35, 475, 10, 35);

  //tree 2 
  fill(0, 255, 0);
  triangle(380, 475, 360, 400, 340, 475);
  fill(77, 39, 17);
  rect(355, 475, 10, 35);

  //penguin body
  fill(0, 0, 0);
  ellipse(200, 465, 75, 90);
  fill(255, 255, 255);
  ellipse(200, 472, 60, 80);
  //eyes
  ellipse(190, 430, 15, 15);
  ellipse(210, 430, 15, 15);
  fill(0, 0, 0);
  ellipse(190, 430, 5, 5);
  ellipse(210, 430, 5, 5);
  //mouth
  fill(242, 85, 12);
  triangle(210, 440, 190, 440, 200, 455);
  //feet
  triangle(220, 515, 210, 515, 212,500);
  triangle(180, 515, 190, 515, 188, 500);
} 


