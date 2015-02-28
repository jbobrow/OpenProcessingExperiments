
//Watch the tree continue to grow.  If mousePressed you can stop the growth.  

int num =100;

Leaves[] myLeaves = new Leaves [num]; // creating my object
color[] myColors = new color[2]; //creating 2 differnt colors


void setup() {
  size(500, 500);

  myColors[0] = color(150, 255, 46, 95);  //allows me to set colors for my color indices
  myColors[1] = color(12, 191, 159, 80);

  background(177, 225, 250);
  noStroke();
  fill(250, 255, 8,80);
  ellipse(350, 40, 50, 50);
  fill(152, 95, 60, 80);
  rect(height/2, width/2, 20, height/2); //sets up the static tree trunk
  smooth();

  for (int i=0; i<myLeaves.length; i++) {
    myLeaves[i] = new Leaves();
  }
}


void draw() {

  for (int i=0; i < myLeaves.length; i++) {
    myLeaves[i].update();
    myLeaves[i].draw();
  }
}


class Leaves {
  int x = int(random(200, 300));  //starts the leaves towards the center of the screen
  int y = int(random(200, 300));
  color c = myColors[floor(random(0, 2))];

  Leaves() {
  }

  void update() {

    x =  x+int(random (-4, 4)); //this updates the position of the point and makes it move across the screen
    y = y + int(random(-4, 4));
    if (mousePressed) {
      noLoop();
    }
  }

  void draw() {
    if (random(20)>18) {
      fill(c);
    }
    else {
      strokeWeight(5);
      fill(0);
      stroke(c);
      point(x, y);
    }
  }
 /*void tree(float x, float y, float w, float l) {
    fill(152, 95, 60, 80);
    rect(height/2, width/2, 10, height/2);*/
  }



