
PImage swan;

//START - setup
void setup()
{
  swan = loadImage("swan.png");
  size(400, 400);
  smooth ();
  frameRate(25);
}

//START - bg animation
void draw()
{

background(255);

for(int y=0; y < width; y++)
{
  line(y, mouseX, y, width);
}

//START - mouseline
//  fill (255, 0, 0, 4);
//  strokeWeight(10);
//  line (pmouseX, pmouseY, mouseX, mouseY);
//  ellipse (mouseX, mouseY, 255, 255);

imageMode(CENTER);
  image(swan, 200, 200);

}

