
PImage sky;
ArrayList Clouds;

int cloudsize = 15;
int thickness = 15;

void setup()
{
  size(1400, 600);
  noStroke();
  rectMode(CENTER);
  Clouds = new ArrayList();
  frameRate(60);
  smooth();

  sky = createImage(width, height, RGB);
  for (int i = 0; i < width; i++)
  {
    for (int j = 0; j < height; j++)
    {
      sky.pixels[i + j * width] = lerpColor(#157ABC, #66B9F0, (float)j/height);
    }
  }
  restart();
}

void restart()
{
  background(sky);
}

void draw() {
  restart();

  //An airplane
  fill(255, 100, 100);
  ellipse(mouseX, mouseY, 20, 50);
  rect(mouseX - 48, mouseY - 8, 15, 10, 5, 5, 5, 5);
  rect(mouseX - 48, mouseY + 8, 15, 10, 5, 5, 5, 5);
    fill(250, 240, 150);
  ellipse(mouseX, mouseY, 100, 20);

  fill(255);
  ellipse(mouseX, mouseY, 5, 5);
  ellipse(mouseX - 10, mouseY, 5, 5);
  ellipse(mouseX + 10, mouseY, 5, 5);
  ellipse(mouseX + 20, mouseY, 5, 5);
  ellipse(mouseX + 30, mouseY, 5, 5);


  for (int i = Clouds.size() - 1 ; i >= 0; i--) {
    cloud newcloud = (cloud) Clouds.get(i);

    newcloud.display();
    newcloud.move();
    newcloud.die();
    if (newcloud.life < 0) {
      Clouds.remove(i);
    }
  }

  if (mousePressed && (mouseButton == LEFT)) {
    Clouds.add(new cloud(mouseX, mouseY));
  }
}

class cloud {
  float xpos;
  float ypos;
  float life = 200;
  float opac;

  cloud(float x, float y) {
    xpos = x;
    ypos = y;
  }
  void display() {
    pushMatrix();
    translate(xpos - 70, ypos);
    bigcloud();
    bigcloud();
    bigcloud();
    popMatrix();
  }

  void move() {
    xpos = xpos + 1.5;
    ypos = ypos + 0.5;
  }
  void die() {
    life= life - 1;
    if(life<100){
    opac = opac + 1;
    }
  }

  void bigcloud() {
    pushMatrix();
    cloud();
    cloud();
    cloud();
    popMatrix();
  }

  void cloud() {
    pushMatrix();
    fill(255, random(50, 100) - opac);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize, cloudsize);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize - 5, cloudsize - 5);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize - 10, cloudsize - 10);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize + 5, cloudsize + 5);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize + 10, cloudsize + 10);
    popMatrix();
  }
}
