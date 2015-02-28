
/*@pjs preload= "Sunshine.jpg";*/

PFont Times;
PFont Arial;
float x = random(500);
float myscale = 1;
float myscalespeed = 0.01;
float xspeed = 1;
float rad1 = 45.0;
boolean runOnce = false;
float timer = 0;
PImage sunshine;
         
void setup()
{
  size(750,500);
  Times = createFont("Times New Roman",32);
  sunshine = loadImage("Sunshine.jpg");
}
 
 
void draw()
{
  background(255);
  image(sunshine, 0, 0, width, height);
  textFont(Times);
  textAlign(CENTER, TOP);
  textSize(12);
  fill(0);
  text("The fundamental cause of the trouble is that in the modern world the stupid are cocksure while the intelligent are full of doubt.", 
  300, 175, 115, 115);
  
  pushMatrix();
  translate(150, 0);
  rotate(PI/4.0);
  text("Not sure what I want...", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(400, 250);
  rotate(PI/4.0);
  text("I'm going nowhere...", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(365, -50);
  rotate(PI/2.0);
  text("Is this even good enough?", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(365, 275);
  rotate(PI/2.0);
  text("How do I know I've succeeded?", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(90, 225);
  text("I'll never finish on time...", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(390, 225);
  text("I'll never amount to anything...", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(400, 180);
  rotate(radians(315));
  text("Where's the creative spark?", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(130, 450);
  rotate(radians(315));
  text("Why try if I'll fail every time?", 0, 0, 250, 50);
  popMatrix();
  
  pushMatrix();
  translate(550, 20);
  text("The greater the artist, the greater the doubt. Perfect confidence is granted to the less talented as a consolation prize.",
  0, 0, 150, 150);
  popMatrix();
}


