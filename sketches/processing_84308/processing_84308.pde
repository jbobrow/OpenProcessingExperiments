
int xPixels = 20;
int yPixels = 20;
float x, y;
float xSpacing, ySpacing;
boolean lines = false;
string inst = "Press left to toggle lines, press up and down to expand/contract";
float textOpacity = 255;

superPixel[][] pixelArray = new superPixel[xPixels][yPixels];

void setup() {
  size(400, 400);
  background(50);

  smooth();
  //code this
  //initialize each superPixel, using the average color for that area of the picture
  for (int i = 0; i < xPixels; i++) {
    for (int j = 0; j < yPixels; j++) {

      xSpacing =  width/xPixels + 1;
      ySpacing =  height/yPixels + 1;

      x = xSpacing * (i);
      y = ySpacing * (j);

      pixelArray[i][j] = new superPixel(x, y);
    }
  }
}

void draw() {
  background(50);
  if (textOpacity >= 0) {
    fill(225, textOpacity);
    text(inst, 5, height - 8);
    textOpacity -= 1.3;
  }  

  for (int i = 0; i < xPixels; i++) {
    for (int j = 0; j < yPixels; j++) {

      pixelArray[i][j].avoidMouse();
      pixelArray[i][j].update();

      if (lines == true) {
        if (i < xPixels - 1 && j < yPixels - 1) {
          pixelArray[i][j].drawLine(pixelArray[i+1][j+1]);
          pixelArray[i][j].drawLine(pixelArray[i][j+1]);
          pixelArray[i][j].drawLine(pixelArray[i][j+1]);
        }
      }
      pixelArray[i][j].display(); 
      pixelArray[i][j].returnHome();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      for (int i = 0; i < xPixels; i++) {
        for (int j = 0; j < yPixels; j++) {
          pixelArray[i][j].explode();
        }
      }
    } 
    else if (keyCode == DOWN) {
      for (int i = 0; i < xPixels; i++) {
        for (int j = 0; j < yPixels; j++) {
          pixelArray[i][j].constrict();
        }
      }
    } 
    else if (keyCode == LEFT) {
      lines = !lines;
    }
  }
}

class superPixel {
  PVector origin;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float ox, oy;

  superPixel(float x_, float y_) {

    //remember where we started 
    ox = x_;
    oy = y_;
    //standard 
    location = new PVector(x_, y_);
    velocity = new PVector();
    acceleration = new PVector();
    //how should we fill the square? how big are they
    topspeed = 8;
  }


  void avoidMouse() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    float distance = mouse.mag();
    if (distance < 35) {
      float grav = (-3000) / (distance * distance);
      mouse.normalize();
      mouse.mult(grav);
      acceleration.add(mouse);
    }
  }

  //a function to return the super pixels to their starting space
  void returnHome() {
    PVector seek = new PVector(ox, oy);
    seek.sub(location);
    float distance = seek.mag();
    float speed = velocity.mag();
    //the distance test here seems to control the wobble
    if (distance < .35 && speed < 4) {
      location.set(ox, oy, 0);
      velocity.mult(0);
      acceleration.mult(0);
    } 
    else {
      seek.normalize();
      seek.mult(random(.1, .6));
      acceleration.add(seek);
    }
  }

  void update() {
    velocity.add(acceleration);
    velocity.mult(.96);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  } 

  void explode() {
    PVector gunpowder = new PVector(mouseX, mouseY);
    gunpowder.sub(location);
    float distance = gunpowder.mag();
    gunpowder.normalize();
    float amount = random(-1000, -7000);
    gunpowder.mult(amount/distance);
    acceleration.add(gunpowder);
  }

  void constrict() {
    PVector blackhole = new PVector(mouseX, mouseY);
    blackhole.sub(location);
    float distance = blackhole.mag();
    blackhole.normalize();
    float amount = random(1000, 7000);
    blackhole.mult(amount/distance);
    acceleration.add(blackhole);
  }

  void drawLine(superPixel p) {
    strokeWeight(.5);
    stroke(30,200,200);
    line(location.x, location.y, p.location.x, p.location.y);
  }

  void display() {
    stroke(220);
    strokeWeight(3);
    point(location.x, location.y);
  }
}



