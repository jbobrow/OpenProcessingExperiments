
//variable
float y=5;
float c=200;
float angle=0.0;

//background
void setup()
{
  size(250, 250);
  smooth();
  background(0, 1, 60);
  frameRate(30);
}

//shape animation + loop + rotation
void draw()
{
  fill(0, 1, 60, 20);
  noStroke();
  rect(0, 0, width, height);
  fill(66, 83,140, 100);
  stroke(255, 40);
  angle=angle+0.03;
  translate(50,25);
  rotate(angle);
  strokeWeight(.5);
  rect(y-50, random(y)-100, 50, 50);
  fill(178, 167, 224, 200);
  ellipse(y, random(y), 50, 50);
  fill(231, 101, 123, 100);
  rect(random(y)-100, y-50, 50, 50);
  fill(244, 210, 191, 200);
  ellipse(random(y), y, 50, 50);
  
  //condition to restart out of boundary
  y+=10;
  if (y>height) {
    y=-height;
  }
}


