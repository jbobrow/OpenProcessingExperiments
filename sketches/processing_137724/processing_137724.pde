
//background code from processing reference 
/* @pjs preload="bg.jpg"; */ 
/* @pjs preload="club.jpg"; */ 

PImage bg;
PImage club;

float ballWidth = 55;
float ballHeight = 70;

float X;
float Y;

int z = 180;
int y = 253;

void setup() {
  size(600, 450);
  bg = loadImage("newyork.jpg");
  club = loadImage("club.jpg");

  ellipseMode(CENTER);
  frameRate(8);
  noStroke();
  X = 100;
  Y = 400;
}

void draw() {
//  background(bg);


  if (mousePressed == true) {
    background(club);
  }

  randomSeed(43);
  for (int i = 50; i < width + 40; i += 40) {
    int gray = int(random(0, 250));
    float scalar = random(0.25, 1.0);
    balloon(i, 110, gray, scalar);
  }
}

void balloon(int x, int y, int g, float s) {
  if (mousePressed == false) {
    background(bg);
  }

  Y -= 2;
  //balloon
  strokeWeight(0.5);
  stroke(0, 322, 230);
  ellipse(X+100, Y, ballWidth, ballHeight );

  // highlight
  noStroke();
  strokeWeight(1);
  stroke(255, 50);
  fill(random(z, y), random(z, y), random(z, y));
  ellipse(X + 95, Y - 5, 15, 18);
  //triangle at bottom
  fill(188, 86, 219);
  triangle(X+100, Y + ballHeight/2, X + 105, Y + ballHeight/2 + 5, X + 95, Y + ballHeight/2 + 5);

  // string
  stroke(150);
  strokeWeight(1.5);
  line(X + 100, Y + ballHeight/2 + 5, X+100, Y + ballHeight/2 + 100);
  
//***SECOND SCENE***
  if (mousePressed == true) {
    pushMatrix();
    translate(x, y);
    scale(s);
    stroke(g);
    //makes it move up 
    Y -= 2;
    //balloon
    strokeWeight(0.5);
    stroke(0, 322, 230);
    ellipse(X, Y, ballWidth, ballHeight );

    // highlight
    noStroke();
    strokeWeight(1);
    stroke(255, 50);
    fill(random(z, y), random(z, y), random(z, y));
    ellipse(X - 5, Y - 15, 15, 18);
    //triangle at bottom
    fill(100, 211, 98);
    triangle(X, Y + ballHeight/2, X + 5, Y + ballHeight/2 + 5, X - 5, Y + ballHeight/2 + 5);

    // string
    stroke(150);
    strokeWeight(1.5);
    line(X, Y + ballHeight/2 + 5, X, Y + ballHeight/2 + 100);

    //repeat
    if (Y < -120) {
      Y = 600;
    }
    popMatrix();
  }
    //repeat
    if (Y < -120) {
      Y = 600;
  }
}


