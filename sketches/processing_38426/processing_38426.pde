
//Irina Shumskaya
//Project I
//Press the mouse to see variation of line compositions
//Inspiration taken from the "Brick House" by Mies

void setup() { 
  size(500, 500);
  smooth();
  colorMode(RGB);
  background(41, 82, 224);


  pushMatrix();
  
  //rotating the composition 15 degrees
  rotate( radians(15));
  translate(100, -50);

  //first layer of constant grid
  for ( int d=-500; d<=800; d+=random(1,4)) {
    for ( int e=-500; e<=800; e+=random(1,4)) {
      stroke(91, 219, 64, 155);
      point(d, e);
    }
  }
}

void draw() {
}

void mousePressed() {

  float a = random(0, 250);
  float b = random(250, 500);


  size(500, 500);
  smooth();
  colorMode(RGB);
  background(41, 82, 224);

  //rotating the composition 15 degrees to the right
  pushMatrix();
  rotate( radians(15));
  translate(100, -50);

  //this is the texture in the background
  for ( int d=-500; d<=800; d+=random(1,4)) {
    for ( int e=-500; e<=800; e+=random(1,4)) {
      stroke(91, 219, 64, 155);
      point(d, e);
    }
  }

  //this is the grid with increments of 5 
  for (int x=-200; x < 700; x+=5) { 
    for (int y=-200; y < 700; y+=5) { 

      noFill();
      stroke(250, 250, 0, 10);
      strokeWeight(.15);
      rect(x, y, 25, 25);
    }
  }

  //this is a grid with increments of 25, layered on top of the smaller grid
  for (int x=-200; x<=700; x+=25) {
    for ( int y=-200; y<=700; y+=25) {
      stroke(250, 250, 0, 100);
      rect(x, y, 25, 25);
    }
  }


  //this is the set of lines that are randmoly generated within the constraints given 
  for ( int x=50; x<=450; x+=random(50,100)) {
    stroke(255);
    strokeWeight(random(.5, 7));
    line(x, a, x, b);
    strokeWeight(random(.25, 2));
    line(random(a), x, random(b), x);
  }

  popMatrix();
}


