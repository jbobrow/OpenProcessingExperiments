
color newColor;
PImage ColorWheel;
float myRotate = 0.0;
float timer = 0.0;
float timerScaler = 20.0;
float myScale = 1.0;

void setup()
{
  size(500,500);
  background(255);
  frameRate(30);
  ColorWheel= requestImage("ColorWheel.jpg");
}

void draw()
{
  noStroke();
  image(ColorWheel,0,0,130,130);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      fill(newColor);
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(myRotate);
      scale(myScale);
      triangle(0,0,-20,20,20,20);
      popMatrix();
    }
    if (mouseButton == RIGHT);
    {
      newColor= get(mouseX,mouseY);
    }
  }
  if (keyPressed)
  {
    if(key == 'e')
    {
      pushMatrix();
      translate(mouseX,mouseY);
      colorMode(RGB);
      fill(255);
      rotate(myRotate);
      scale(myScale);
      rectMode(CENTER);
      rect(0,0,20,20);
      popMatrix();
    }
    if (key == '4')
    {
      myRotate= myRotate + 0.02;
    }
    if (key == '3')
    {
      myRotate= myRotate - 0.02;
    }
    if (key == 's')
    {
      myScale= myScale + 0.02;
    }
    if (key == 'a')
    {
      myScale= myScale -0.02;
    }
    if (key == 'w')
    {
      timer = timer + (1.0/30.0);
      colorMode(HSB,360,100,100,255);
      fill(timer*timerScaler,100,100,255);
      scale(myScale);
      translate(mouseX,mouseY);
      smooth();
      strokeWeight(3);
      beginShape();
      vertex(0,0);
      vertex(4,4);
      vertex(20,5);
      vertex(8,10);
      vertex(16,20);
      vertex(0,14);
      vertex(-16,20);
      vertex(-8,10);
      vertex(-20,5);
      vertex(-4,4);
      endShape();
      colorMode(RGB);
    }
    if (key == '1')
    {
      fill(newColor);
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(myRotate);
      scale(myScale);
      ellipse(0,0,-20,20);
      popMatrix();
    }
  }
}


