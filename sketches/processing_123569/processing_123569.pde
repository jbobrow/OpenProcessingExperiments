
float[] xCoord = new float[75];
float[] yCoord = new float[75];
float[] size = new float[75];
Fish[] fish = new Fish[6];
float[] fishSize = new float[6];
float[] x = new float[6];
float[] y = new float[6];
float[] speed = new float[6];

void setup() {
  size(500, 500);
  //frameRate(50);
  //noCursor();
  //bubbles for loop
  for (int i = 0; i < 75; i++) {
    xCoord[i] = random(1, width);
    yCoord[i] = random(1, height);
    size[i] = random(5, 15);
  }
  //fish for loop
  for (int g = 0; g < 6; g++) {
    x[g] = random(width);
    y[g] = random(width);
    speed[g] = random(.07, .7);
    fishSize[g] = random(.5, 1.5);
    fish[g] = new Fish(x[g], y[g], fishSize[g], color(random(255), random(255), random(255)), speed[g]);
  }
}

void draw() {
  background(90);
  strokeWeight(20);
  stroke(40);

  fill(10, 100, 255);
  ellipse(mouseX, mouseY, 300, 300);

  stroke(random(230, 255));
  strokeWeight(2);

  for (int g = 0; g < 6; g++) {
    fish[g].swim();
  }
  for (int i = 0; i < 75; i++) {
    fill(0, 0, 0, 0);

    if (dist(mouseX, mouseY, xCoord[i], yCoord[i]) < 130) {
      stroke(255);
      ellipse(xCoord[i], yCoord[i], size[i], size[i]);
    }

    yCoord[i] --;
    xCoord[i] += xCoord[i] * random(-.008, .008);

    if (yCoord[i] <= 0) {
      yCoord[i] = height;
    }
  }
  for (int g = 0; g < fish.length; g++) {
    if(dist(mouseX, mouseY, fish[g].xpos, fish[g].ypos) < 130)fish[g].display();
  }


  for (int g = 0; g < 6; g++) {
    fish[g].swim();
 
  }
}

class Fish {
  float xpos;
  float ypos;
  float size;
  color c;
  float speed;
  float fishSizeX = size * 30;
  float fishSizeY = size * 20;

  Fish(float _xpos, float _ypos, float _size, color _c, float _speed) {
    xpos = _xpos;
    ypos = _ypos;
    size = _size;
    c = _c;
    speed = _speed;
  }

  void display() {
    float fishSizeX = size * 30;
    float fishSizeY = size * 20;
    stroke(0);
    fill(c);
    ellipse(xpos, ypos, fishSizeX, fishSizeY);
    triangle(xpos-fishSizeX/2, ypos, xpos-fishSizeX/2-size*10, ypos-size*10, xpos-fishSizeX/2-size*10, ypos+size*10);
  }

  void swim() {
    xpos += speed;
    ypos += random(-.8,.8);
    if (xpos > width) {
      xpos = 0-fishSizeX/2;
    }
  }
}



