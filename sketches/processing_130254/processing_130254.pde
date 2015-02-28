

float counter = 0.8;
float radius = 0.0;
float s = 0.01;
float scale = 0.0;
float rad = 0.0;
float timer = 0.0;
float j = 0.2; //for for <span class="k14j9d2c" id="k14j9d2c_14">rotation</span>

 
void setup()
{
  size (500, 500);
  colorMode(RGB, 100);
  frameRate(30);
  println("x: " + mouseX + " y: " + mouseY);
   
}
 
void draw()
{

  rad = rad + 0.5;
  s = s + 0.001;
  fill(random (255), random (255), random(255));
   
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  rotate(j++); //rotate shape
  rectMode(CENTER);
  rect (0, 0, 100, 100);
  popMatrix();
 
  pushMatrix();
  translate (width/2, height/2);
  rotate(radians(j++)); //rotate shape
  scale(s);
  rectMode(CORNER);
  rect (0, 0, 400, 400);
  popMatrix();
   
  pushMatrix();
  translate (width/2, height/2);
  scale(s);
  rotate(radians(45));
  rectMode(CORNER);
  ellipse (0, 0, 400, 400);
  popMatrix();
   
  pushMatrix();
  translate (width/2, height/2);
  scale(s);
  rotate(radians(45));
  rectMode(CENTER);
  ellipse (0, 0, 100, 100);
  popMatrix();
  
  pushMatrix();
  translate (50, 200);
  scale(s);
  rotate(radians(j++)); //rotate shape
  rectMode(CENTER);
  rect (0, 0, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate (50, 200);
  scale(s);
  rotate(radians(45));
  rectMode(CENTER);
  ellipse ( 0, 0, 50, 50);
  popMatrix();

  pushMatrix();
  translate ( 100, 300);
  scale(s);
  rotate(radians(j++)); //rotate shape
  rectMode(CENTER);
  rect (0, 0, 350, 350);
  popMatrix();
  
  pushMatrix();
  translate (100, 300);
  scale(s);
  rotate(radians(45));
  rectMode(CENTER);
  ellipse (0, 0, 350, 350);
  popMatrix();
  
  }
  



