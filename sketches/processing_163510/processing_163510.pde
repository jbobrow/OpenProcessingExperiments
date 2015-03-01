
float x = 50.0; // X-coordinate
float y = 50.0; // Y-coordinate
float radius = 30.0; // Radius of the circle
float speedX = 5.0; // Speed of motion on the x-axis
float speedY = 2.0; // Speed of motion on the y-axis
int directionX = 1; // Direction of motion on the x-axis
int directionY = -1; // Direction of motion on the y-axis
PImage img;
PImage img1;
PImage img2;
PImage img3;
PFont font;
int score = 0;

void setup() {
  size(500, 1000);
  smooth();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  img = loadImage ("space.jpg");
  img1 = loadImage ("cows.png");
  img2 = loadImage ("tractor.png");
  img3 = loadImage ("spaceship.png");
  font = loadFont("ColonnaMT-48.vlw");
}

void draw() {
  tint(255, 50);
  image(img, 0, 0 );
  noTint();
  image (img1, 0, 850, 650, 150);
  fill(random(293, 323), random(70, 100), 99);
  image(img3, 120, 0, 300, 250);
  ellipse(x, y, radius, radius);

  x += speedX * directionX;
  if ((x > width-radius) || (x < radius)) {      
    directionX = -directionX;
  }    

  y += speedY * directionY;    
  if ((y > height-radius) || (y < radius)) {
    directionY = -directionY;
  }
  image (img2, mouseX, height-190, 120, 92);
  if ((x >= mouseX ) && (x < mouseX+80) && (y > 800)) {
    directionY = directionY*-1;
 
  }
    fill(184, 74, 99);
    textFont(font, 20);
    text("ABDUCTIONS avoided = " + str(score+1), 10, 20);
}



