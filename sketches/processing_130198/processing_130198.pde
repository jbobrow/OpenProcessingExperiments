
float counter = 0.8;
float radius = 0.0;
float s = 0.01;
float scale = 0.0;
float rad = 0.0;
float timer = 0.0;
float j = 0.2; //for for <span class="k14j9d2c" id="k14j9d2c_14">rotation</span>
PImage myimage;
/* @pjs preload="eye.jpg"; */

void setup()
{
  size (1024, 768);
  colorMode(RGB, 100);
  myimage = requestImage ("eye.jpg");
  filter(INVERT);
  frameRate(30);
  println("x: " + mouseX + " y: " + mouseY);
  
}

void draw()
{
  image(myimage, 0, 0, width, height);
  rad = rad + 0.7;
  s = s + 0.005;
  fill(random (255), random (255), random(255));
  
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  rotate(j++); //rotate shape
  rectMode(CENTER);
  rect (0, 0, 100, 100);
  popMatrix();

  pushMatrix();
  translate (50, 200);
  rotate(radians(90));
  scale(s);
  rectMode(CENTER);
  triangle (30, 75, 58, 20, 86, 75);
  popMatrix();
  
  pushMatrix();
  translate (50, 200);
  scale(s);
  rectMode(CENTER);
  triangle (55, 60, 70, 60, 79, 89);
  popMatrix();
  
  pushMatrix();
  translate (width/2, height/2);
  scale(s);
  rotate(radians(45));
  rectMode(CENTER);
  ellipse (0, 0, 100, 100);
  popMatrix();
  }


