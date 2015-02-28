
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/134465*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload= "sea.jpg"; */
/* @pjs preload= "2.jpg"; */
/* @pjs preload= "3.jpg"; */

PImage sea;
PImage coral;
PImage fish;

void setup() { 

  size(700, 700);
  noStroke();
  /*
  PImage img;
   img = loadImage("sea.jpg");
   image(img, 0, 0);
   */
  frameRate(30);

  sea = loadImage("sea.jpg");
  coral = loadImage("fish2.png");
  fish = loadImage("fish3.png");
}


void draw() { 

  //background(#A0DFE5);


  //  float c = map(mouseX, 0, width, 175, 10);
  // background(c, c, 255);

  float seaX = map(mouseX, 0, width, 0, -20 );
  image(sea, seaX, 0);

  float coralX = map(mouseX, 0, width, -20, -100 );
  image(coral, coralX, 0);

  float fishX = map(mouseX, 0, width, 0, -1200 );
  image(fish, fishX, 0);


  //bubbles

  float x = random(0, 50);
  float y = random(0, 100);
  float xp = random(0, 700);


  fill(#FFFFFF, 60);
  ellipse( xp, mouseY, x, x);

  fill(#FFFFFF, 30);
  ellipse( xp+x, xp+mouseY, y, y);

  fill(#FFFFFF, 70);
  ellipse( xp-x, xp-mouseY, x, x);


  float circlex = random(30, 300);
  float circley = random(30, 300);

  noFill();
  stroke(#FFFFFF, 30);
  strokeWeight(2);
  ellipseMode(CENTER);
  ellipse( mouseX, mouseY, circlex, circley);


  //light

  int light1 = round( map(mouseY, 0, height, 000, 700));

  fill(#DCF5FA, 50);
  beginShape();
  vertex(340, -50);
  vertex(light1, 800);
  vertex(light1+200, 800);
  vertex(360, -50);
  endShape(CLOSE);
}



