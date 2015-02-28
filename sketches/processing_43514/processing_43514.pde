
/*Allison Schaefer
Brittany Green
Jennifer Sochacki
adopted from proxDemo code from Lab 8*/

PImage img; 

int num = 300; //amount of things
Thing things[] = new Thing[num]; //thing array

void setup() {
  size(400, 400);
  frameRate(15); //slowing down the sketch
  img = loadImage("33870374.gif"); //load in firework image
  background(255); //base background color

  for (int i=0; i<num; i++) { //seeding the array, different options for the starting location of things 
    //things[i] = new Thing(0, random(height)); 
    //things[i] = new Thing(width/4, random(height/2));
    things[i] = new Thing(3*width/4, height/2);
    //things[i] = new Thing(width/2, height/2);

    if (random(2) > 1) { //ratio to determine the things being true or false which will later be identified as color
      things[i].flip = true;
    }
  }

  noStroke();
}

void mousePressed() {
  int a = int(random(0, img.width));
  int b = int(random(0, img.height));
  color fireworkColor = img.get(a, b); //get pixel colors from the loaded image
  
  if (mouseButton == LEFT) { //if the left mouse is pressed, a white cicle appears within the sketch
    fill(255);
    ellipse(mouseX, mouseY, 50, 50);
  }

  else if (mouseButton == RIGHT) { //if the right mouse is pressed the background color changes to a pixel color from the image
    background(fireworkColor);
  }
}

void draw() {
  //background(0); //if turned on, the things trails disappear and all you can see are the individal things moving

  for (int i=0; i<num; i++) { //method functions for the things
    things[i].check(things, i);
    things[i].display();
    things[i].mover();
  }
}

class Thing { //identifying the class and its' variables
  float x;
  float y;
  boolean flip;
  float r = 7;

  Thing(float x_, float y_) { //constructor and the variables that define how its made
    x = x_;
    y = y_;
  }

  void mover() { //changes the x and y coordinates of individual things
    if ((x<width) || (y<height)) { //if the things are within the limits of the sketch, they can move
      x+=random(-5, 5);
      y+=random(-5, 5);
    }
    else { //if the things move out of the limits of the sketch they start back along the y-axis
      x=0;
      y=random(height);
    }
  }

  void check(Thing[] a, int num) {

    for (int i=0; i<a.length; i++) {
      if (i != num) {
        if (dist(x, y, a[i].x, a[i].y) < r) {  
          flip = true;
          break;
        }
        else {
          flip = false;
        }
      }
    }
  } /*as the things move, if the distance between two things' x and y coordinates are less than the variable r,
    the boolean flip is true, if not then it will be false. This will later be identified with color*/

  void display() {

    int a = int(random(0, img.width));
    int b = int(random(0, img.height));

    color fireworkColor = img.get(a, b); //getting the color of the pixels from the image

    if (flip == true) { //from the boolean above, when flip is true (the distance of two things is less than variable r) they fill this color (white)
      fill(255);
    }
    else {
      fill(fireworkColor);//otherwise the things fill with random colors from the image
      //noFill();
    }
    ellipse(x, y, r, r); //the shape and size of the things
  }
}


