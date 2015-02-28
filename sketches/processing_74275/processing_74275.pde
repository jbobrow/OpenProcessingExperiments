
Stripe[] stripes = new Stripe[16];
Star[] stars = new Star[4];
PImage myImage;

void setup() {
  colorMode(HSB, 100);
  size(400, 260);
  myImage = loadImage( "fearAndLoathing.png" ); // load the image data
  smooth();

  // for loop to generate all the classes
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(100, 100, 10, color(100, 0, 100));
  }

  for (int i = 0; i < stripes.length; i++) {
    stripes[i] = new Stripe(100, random(height), random(3, 5), color(100, random(10, 40), 100));
  }
}


void draw() {
  noStroke();
  fill(100, random(55, 85), random(75, 85), random(8, 15));
  rect(0, 0, 800, 640);

  // for loop to tell them to run thier member functions
  for (int i = 0; i < stripes.length; i++ ) {
    stripes[i].drive();
    stripes[i].display();
  }

  fill(60, random(85, 100), random(20, 28), 99);
  rect(0, 0, random(245, 250), random(245, 250));

  fill(0, 0, 80);
  ellipse(random(500), random(300), random(3), random(2));

  fill(0, 0, 80);
  ellipse(random(500), random(300), random(1), random(1));

  fill(100, 100, 80);
  ellipse(random(500), random(300), random(1), random(1));

  for (int i = 0; i < stars.length; i++ ) {
    stars[i].drive();
    stars[i].display();
  }
  fill(60, random(85, 100), random(20, 28), 65);
  rect(0, 0, random(245, 250), random(245, 250));
  
  fill(100, random(2), random(75, 85), random(5));
  rect(0, 0, 800, 640);
  
  image(myImage,0,0);
  
  fill(0, 0, 100);
  ellipse(random(500), random(300), random(8), random(8));
  
  fill(0, 0, 0);
  ellipse(random(500), random(300), random(4), random(3));
}


class Star {         // define class name

  float xpos;
  float ypos;
  float xspeed;
  color c;

  // The Constructor is defined with arguments.
  // constructor is called when the object is created
  Star(float tempx, float tempy, float tempspeed, color tempC) {

    // println("a star has been created");

    xpos = tempx;    // put passed values into class variables
    ypos = tempy;
    xspeed = tempspeed;
    c = tempC;
  }

  /////////BEGIN DEFINED POLYGON
  void polygon(int n, float cx, float cy, float r, float proportion)
  {
    polygon(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion);
  }

  void polygon(int n, float cx, float cy, float w, float h, 
  float startAngle, float proportion)
  {
    if (n > 2)
    {
      float angle = TWO_PI/ (2 *n);  // twice as many sides
      float dw; // draw width
      float dh; // draw height

      w = w / 2.0;
      h = h / 2.0;

      beginShape();
      for (int i = 0; i < 2 * n; i++)
      {
        dw = w;
        dh = h;
        if (i % 2 == 1) // for odd vertices, use short radius
        {
          dw = w * proportion;
          dh = h * proportion;
        }
        vertex(cx + dw * cos(startAngle + angle * i), 
        cy + dh * sin(startAngle + angle * i));
      }
      endShape(CLOSE);
    }
    //////END DEFINED POLYGON
  }
  void display() {
    noStroke();
    fill(c);
    polygon(5, random(120), random(120), 10, 10, -PI / 2.0, 0.50);   // draws a star
  }
  void drive() {              // moves star forward?
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

class Stripe {         // define class name

  float xpos;
  float ypos;
  float xspeed;
  color c;         


  // The Constructor is defined with arguments.
  // constructor is called when the object is created
  Stripe(float tempx, float tempy, float tempspeed, color tempC) { 

    // println("a stripe has been created");

    xpos = tempx;    // put passed values into class variables
    ypos = tempy;
    xspeed = tempspeed;
    c = tempC;
  }

  void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(xpos, random(ypos, ypos+2), 20, 15);    // draws a rectangle
  }

  void drive() {              // moves box forward
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

