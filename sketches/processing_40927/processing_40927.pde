
int num = 25; // number of functions

Light[] myLights = new Light[num]; //limits how many objects


void setup() {
  colorMode(HSB, 100);
  size(300, 300);



  for (int i=0;i<myLights.length;i++) {
    myLights[i] = new Light();
  }

  noStroke();
  smooth();
}

void draw() {
  background(1);

  for (int i=0; i < myLights.length; i++) {
    myLights[i].update();
    myLights[i].draw();
  }
}



class Light {

  float x = random(0, width);
  float y = random(0, height);
  float speed = random(-3, 3);


  Light() { //object instructor is empty
  }

  void update() {

    y = y + speed;

    if (y > height + 0) y = 0;
    if (y < - 1) y = 0;
    
  }

  void draw() {
    fill(0, 0, 100);
    globe(x, y);
  }
}

void globe(float x, float y) { //function that is used as an object
  pushMatrix();
  translate(x, y);
  fill(0, 0, 100);
  ellipse(x, y, 20, 20);
  stroke(0, 0, 100, 15);
  strokeWeight(1);
  line(x, y, random(width), random(height));
  line(x, y, random(-width), random(-height));
  popMatrix();
}

//code is a variation of Nick Senske's arrayDemoObjects

