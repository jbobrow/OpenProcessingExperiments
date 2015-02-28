

PImage me;


void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  noFill();
 
  me = loadImage("me.jpg");

}
 
void draw()
{
  background(255);
  println("x: " + mouseX + " y: " + mouseY);
  textSize(40);
  pushMatrix();
  translate(125,125);
  image(me, 0, 0, width/2, height/2);
  popMatrix();


 
  pushMatrix();
  translate(120, 250);
  fill(0);
  rotate(radians(45));
  text("EYES", 0, 0);
  popMatrix();

  pushMatrix();
  translate(200, 310);
  fill(0);
  rotate(radians(0));
  text("EYES", 0, 0);
  popMatrix();

   pushMatrix();
  translate(300, 310);
  fill(0);
  rotate(radians(315));
  text("EYES", 0, 0);
  popMatrix();

  pushMatrix();
  translate(140, 225);
  fill(0);
  rotate(radians(315));
  text("EYES", 0, 0);
  popMatrix();

  pushMatrix();
  translate(200, 170);
  fill(0);
  rotate(radians(0));
  text("EYES", 0, 0);
  popMatrix();

   pushMatrix();
  translate(290, 170);
  fill(0);
  rotate(radians(45));
  text("EYES", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(380, 165);
  fill(0);
  rotate(radians(90));
  text("TATTOOS", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(120, 350);
  fill(0);
  rotate(radians(270));
  text("TATTOOS", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(150, 110);
  fill(0);
  rotate(radians(0));
  text("TATTOOS", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(350, 390);
  fill(0);
  rotate(radians(180));
  text("TATTOOS", 0, 0);
  popMatrix();
}


