
PImage [] images = new PImage [21];
PImage bg;
PFont font;

int i=1;
float angle = 0.0;
float offset = random(0, 480);
float scalar = 20; 
float speed = 0.05;
float speed2 = random(0.3, 0.6);

float x = 0;
float y = 0;

boolean drop = false;
void setup() {

  colorMode(HSB, 100);
  float r = random (0, 100);
  size(480, 676);
  noStroke();
  smooth();


  for (int i = 1; i<images.length; i++)
  {
    images [i] = loadImage (i+".png");
  }
  bg = loadImage ("flower10a.jpg");

  imageMode(CENTER);
  image(bg, width/2, height/2);

  noFill();
  strokeWeight(20);
  stroke(r, 30, 100, 50);
  quad(40, 40, width-40, 40, width-40, height-40, 40, height-40);
}


void draw() {
  
  float offsetA = offset + sin(angle+0.01)*scalar;
  float offsetB = (y+=4)*speed2;

  image (bg, width/2, height/2);

  image(images [i], offsetA, offsetB, 125, 125);
    
  if (offsetB>height+100)
  {
    y=random(-150);
    offset = random (0, 480);
    i= i+1;
  }
  
  if (i>=21)
  {
   i=1; 
  }

//  image(images [(int)random(1, 21)], offsetA, offsetB, 125, 125);

  angle +=speed;

  noFill();
  strokeWeight(20);
  stroke(200, 30, 100, 80);
  quad(40, 40, width-40, 40, width-40, height-40, 40, height-40);

  fill(0, 85);
  noStroke();
  ellipse(width/2, height/2, 300, 300);

  fill(100);
  font = loadFont ("Garamond-Italic-48.vlw");
  textFont(font);
  textLeading(50);

  textAlign(CENTER);
  String s = "Welcome Home My Darling.";
  text (s, (width/2)-100, (height/2)-90, 200, 200);

  strokeCap(SQUARE);
  strokeWeight(3);
  stroke(100);
  noFill();
  line(150, 420, 330, 420);
}


