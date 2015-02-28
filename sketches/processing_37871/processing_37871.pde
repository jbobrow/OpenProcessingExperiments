
//Nathan Trevino  
//Processing Thursday, September 15, 2011
//Copyright September 15th 2011
//Carnegie Mellon University. Pittsburgh PA


float[] x = new float  [3000]; //3000 variable array... geez
float Rad = 20; //i dont know what im doing with this..i know i had it for a reason..
//int cx, cy; //Position of my rollover button.
//int MyDiam = 250; //diameter of my button to rollover

//images. thanks George Lucas.
PImage space;
PImage xwing;
PImage dstar;
PImage falcon;



boolean overCircle = false;

void setup() {
  size (500, 500);  
  smooth();
  noStroke();
  fill(255, 0, 0);

  //my infinite spaceship array. they start at some crazy distance to the left and just travel
  //until they reach me
  for (int i = 0; i < x.length; i ++ ) {
    x[i] = random (-100000, 200);
  }

  //load all the images here
  space = loadImage("space.jpg");
  xwing = loadImage("xwing.png");
  dstar = loadImage("deathstar.png");
  falcon = loadImage("falcon.png");
}

//draws all the awesome pictures the way i want!
void draw() {
  noStroke();
  

  float vx = 0;
  image (space, vx, 0 );
  vx += 1;

  //this next part is me trying to rotate the deathstar according to the x,y of the mouse...
  //....still no luck. I just don't know enough yet.

  pushMatrix();
  //
  translate(100, 100);
  //rotate(radians(frameCount/2));
  image(dstar, -125, -125);
  //
  //
  popMatrix();


  //this is for the xwings as they travel forever... but not really.. they actually
  //only last for a certain amount of time.


  for (int i = 0; i < x.length; i ++ ) {
    x[i] += 3;
    float y = i * 0.4;
    image(xwing, x[i], y, 100, 75);
  }


  //laser!!!!!! 
  if (mousePressed) {
    int Bx = 169;
    int By = 72;
    noStroke();
    fill(random(0, 256), random(0, 256), random(0, 256));
    ellipse(Bx, By, random(10, 20), random(5, 20));
    fill(random(0, 256), random(0, 256), random(0, 256), 50);
    ellipse(Bx, By, random(20, 50), random(20, 50));
    strokeWeight(8);
    stroke(100, 0, 30);
    line(Bx, By, mouseX, mouseY);
    strokeWeight(1);
    stroke(255, 0, 0);
    line(Bx, By, mouseX, mouseY);
    strokeWeight(3);
    line ( Bx, By, Bx + (random(0, 50)), By + (random(0, 50)));
  }
}


