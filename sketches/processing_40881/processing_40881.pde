
//Graduate Challenge: Modify the objects to create a more interesting aesthetic composition.
//Consider how color, new shapes, modified rules, and/or an interesting constraint might affect 
//the output of the program. Use OOP to make these changes easier!

//write a new program converting the random path into a new class
//modify the new program so it uses an array of new objects (at least 25) based on my class
//generative system


int num = 25; // number of Balls
float shapeSize = 1; // constant for Ball size
float x, y;

// define an array that holds Ball objects & declare them
Marker[] myMarker = new Marker[num];

color[] colorPalette = new color[4]; //declare and create the array color palette

void setup() {
  size(200, 200);
  background(255);

  //load colors into the array
  colorPalette[0] = color(255, 200, 0, 75);
  colorPalette[1] = color(2, 16, 52, 50);
  colorPalette[2] = color(175);
  colorPalette[3] = color(20, 0, 80);

  // seed the array with initialized Ball objects
  for (int i=0;i<myMarker.length;i++) {
    myMarker[i] = new Marker();
  }
}

 void draw() {
  //iterate through the Ball array and update and draw the objects
  for (int i=0; i < myMarker.length; i++) {
    myMarker[i].draw();
  }
}


class Marker {

  float xpos = random(0, width);
  float ypos = random(0, height);
  float speed = random(1,2);


  Marker() {
  }

  void draw() {
    for (int i=0;i<myMarker.length;i=i+7) {
      noStroke();
      smooth();
      fill(pickAColor());
      x = x + random(-1, 1);
      y = y + random(-1, 1);
      ellipse(xpos+x, ypos+y, shapeSize, shapeSize);
    }
  }
}

color pickAColor() { //helper function picks a random color from the array
  int c = int(random(4)); // random number from 0-3
  return colorPalette[c];
}


