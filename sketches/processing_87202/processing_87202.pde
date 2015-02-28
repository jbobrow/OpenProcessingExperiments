
//Sunny Li
//(c) Sunny Li 2013

PImage sky;

void setup()
{
  size(400, 400);
  smooth();
  background(0);
  
  frameRate(30);
  
  sky = loadImage("sky.jpg");
  image(sky, 0, 0);

  
}

void draw() {
  
if (keyPressed == true) {
    image(sky, 0, 0);
  } else {
    fill(255);
  }
}

void mousePressed()
{
  
 
  //image(sky, 0, 0);
  //fill(0, 20);
  //noStroke();
  //rect(0, 0, 400, 400);
  stroke(255, random(0, 20));
  strokeWeight(2);
  line(random(mouseX - 30, mouseX + 30), random(mouseY - 30, mouseY + 30), mouseX, mouseY);
  line(random(mouseX - 30, mouseX + 30), random(mouseY - 30, mouseY + 30), mouseX, mouseY);
  line(random(mouseX - 30, mouseX + 30), random(mouseY - 30, mouseY + 30), mouseX, mouseY);
  line(random(mouseX - 30, mouseX + 30), random(mouseY - 30, mouseY + 30), mouseX, mouseY);
  
  stroke(255, random(20, 50));
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);

  stroke(255, random(50, 80));
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);
  line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), mouseX, mouseY);
  
  strokeWeight(1);
  stroke(255, 90);
  line(random(mouseX - 10, mouseX + 10), random(mouseY - 10, mouseY + 10), mouseX, mouseY);
  line(random(mouseX - 10, mouseX + 10), random(mouseY - 10, mouseY + 10), mouseX, mouseY);
  line(random(mouseX - 10, mouseX + 10), random(mouseY - 10, mouseY + 10), mouseX, mouseY);
  line(random(mouseX - 10, mouseX + 10), random(mouseY - 10, mouseY + 10), mouseX, mouseY);
  
  
}
