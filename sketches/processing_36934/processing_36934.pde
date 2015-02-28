
void setup()
{ background(255, 255, 255);
  size(600, 600);
  smooth();
  frameRate(30);
}

void draw()
{ noStroke();
  fill(mouseY%255, random(256), random(256), 150);
  ellipse(300, 300, width-mouseX, height-mouseY);
  fill (random(256), mouseX%255, random(256), 150);
  ellipse(300, 300, width-mouseY, height-mouseX);
  fill (mouseX%255, mouseY%255, random(256), 150);
  ellipse(300, 300, mouseX, mouseY);
  fill(random(256), mouseY%255, mouseX%255, 150);
  ellipse(300, 300, mouseY, mouseX);


}

void mousePressed()
{ fill(255, 255, 255);
rect(0, 0, 600, 600);
}                                               
