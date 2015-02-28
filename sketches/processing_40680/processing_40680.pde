
PImage myPic;
int num = 35;  //Assign amount of crayons coloring
Crayon[] myCrayon = new Crayon [num];  //Crayon setup


void setup() {
  size(400, 400);  //Background setup
  colorMode(RGB, 255);
  myPic = loadImage("pop_art_kiss.jpg");  //Using this image for the selection of crayon colors
  background(0);
  smooth();

  for (int i=0; i<myCrayon.length; i++) {  //Setting up the array of crayons
    myCrayon[i] = new Crayon();
  }
}


void draw() {

  for (int i=0; i < myCrayon.length; i++) {
    myCrayon[i].update();
    myCrayon[i].display();
  }
}


class Crayon {


  int x = int(random(width));  //Creating random drawing paths
  int y = int(random (height));

  int a = int(random(0, myPic.width));    // Pulling random colors from random x and y coordinates from the image
  int b = int(random(0, myPic.height)); 
  color myColor = myPic.get(a, b); 

  Crayon() {
  }

  void update() {
    x = x + int(random (-4, 4));
    y = y + int(random (-4, 4));
  }


  void display() {
    noStroke();  //Setting up the crayon
    fill(myColor);
    ellipse (x, y, 2, 2);
  }
}

void keyPressed() {
  if ((key == 's') || (key == 's')) {    //Saves screanshot image
    save("image.jpg");
    println("Image saved.");
  }
}



