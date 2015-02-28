
//Adam Anzivino
//Clouds


cloud [] cloud = new cloud [44];

void setup() {          //basic setup
  size(300, 300);

  background(0, 172, 255);
  noStroke();

  fill(0, 131, 0);
  rect(0, 280, width, 21);

  for (int i=0; i<cloud.length; i++) {     //loop for creating clouds
    smooth();
    noStroke();
    cloud[i] = new cloud();
  }
}

void draw() {
  for (int i=0; i< cloud.length; i++) {
    cloud[i].update();
    cloud[i].display();
  }
}

class cloud {

  //random


  float x = random(width);      //x-coords

  float y = random(0, 100);      //y-coord

  color c = color(random(130, 255), 50);      //color of the cloud

  float puff = random(40, 120);




  cloud() {
  }

  void update() {
    //clouds moving
    x = x + random(0, .1);
    y= y + random(-1, 1);
  }

  void display() {
    fill(c);
    ellipse(x, y, puff, puff);
  }
}


