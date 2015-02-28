
float a=0;
float b=0;
float c=0;
float d=0;
float e=0;
float posX;
float posY;
float change=0.1;


void setup() {
  background(240);
  size(600, 600);

  fill(60, 200, 0);
  rect(100, 100, 50, 50);
  fill(255, 200, 0);
  rect(200, 100, 50, 50);
  fill(0, 20, 255);
  rect(300, 100, 50, 50);
  fill(255);
  rect(400, 100, 100, 50, 18);
}



void draw() {
  fill(c, d, e);
  ellipse(a, b, 30, 30);

  posX = mouseX - a;
  posY = mouseY - b;

  a += posX*change;
  b += posY*change;

  if (mouseX > 100 && mouseX < 150 && mouseY > 100 && mouseY < 150)
  {
    fill(60, 200, 0);
    rect(100, 100, 50, 50);
    fill(255, 200, 0);
    rect(200, 100, 50, 50);
    fill(0, 20, 255);
    rect(300, 100, 50, 50);
    fill(255);
    rect(400, 100, 100, 50, 18);
    c=60; 
    d=200;
    e= 0;
  } 
  else if (mouseX > 200 && mouseX < 250 && mouseY > 100 && mouseY < 150)
  {
    fill(60, 200, 0);
    rect(100, 100, 50, 50);
    fill(255, 200, 0);
    rect(200, 100, 50, 50);
    fill(0, 20, 255);
    rect(300, 100, 50, 50);
    fill(255);
    rect(400, 100, 100, 50, 18);
    c=255;
    d= 200;
    e= 0;
  }
  else if (mouseX > 300 && mouseX < 350 && mouseY > 100 && mouseY < 150)
  {
    fill(60, 200, 0);
    rect(100, 100, 50, 50);
    fill(255, 200, 0);
    rect(200, 100, 50, 50);
    fill(0, 20, 255);
    rect(300, 100, 50, 50);
    fill(255);
    rect(400, 100, 100, 50, 18);
    c=0;
    d=20;
    e= 255;
  }
  else if (mouseX > 400 && mouseX < 500 && mouseY > 100 && mouseY < 150)
  {
    background(240);
    fill(60, 200, 0);
    rect(100, 100, 50, 50);
    fill(255, 200, 0);
    rect(200, 100, 50, 50);
    fill(0, 20, 255);
    rect(300, 100, 50, 50);
    fill(255);
    rect(400, 100, 100, 50, 18);
  }
}




