
PImage cd;

//START - setup
void setup()
{
  cd = loadImage("cd.png");
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

//START - image
imageMode(CENTER);
  image(cd, 200, 200);

}

