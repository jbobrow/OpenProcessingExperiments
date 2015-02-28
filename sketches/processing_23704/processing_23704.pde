
PImage img;
float angle = 0.0;
void setup()
{
  size(500,500);
  background(255);
  img = loadImage("bridge.jpg");
  smooth();
}
 
void draw()
{
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angle);
  imageMode(CENTER);
  stroke(102);
  image(img,0,0);
  
   angle+=0.1; //try commenting this line out,
  //and un-commenting the line below
  //angle = atan2(mouseY-height/2,mouseX-width/2);
   
  popMatrix();
 
}


