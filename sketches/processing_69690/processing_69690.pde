
//Homework 4
//Sun Park; sunkyunp
//Copyright Sun Park, Sept 2012

float x, y, wd, ht;
color c;

void setup()
{
  size(400, 400);
  x=100;
  y=100;
  wd=50;
  ht=50;
  textSize(5);
  frameRate (15);
  c = color(255);
}

void draw()
{

  if (mousePressed) {

    ellipse (mouseX, mouseY, random(15, 20), random(15, 20));
  
  } else {
     
    background(c);

     
    
  }
  
  //center circle
  fill(random(192), random(192), random(192), 80);
  smooth();
  noStroke();
  ellipse(200, 200, 20, 20);

  //mouse point circle
  strokeWeight(random (10, 100));
  stroke (mouseX, mouseY, random(130, 244), 80);

  ellipse (mouseX, mouseY, random(5, 10), random(5, 10));
 
}

void keyPressed() {
  c = color(random (20,200), random (20,210), random (50,220),50);
}

  





//saveFrame ("hw4.jpg");


