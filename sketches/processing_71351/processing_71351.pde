
PImage miley;
PImage linz;
PImage britney;

PFont font;
void setup()
{
  size(800, 800);
  background(255);
  miley = loadImage("miley.jpg");
  linz= loadImage("lindsay.jpg");
  britney = loadImage("brit.jpg");

  frameRate(24);
  font = loadFont("font.vlw");
}

void draw()
{

  noStroke();
  fill(random (0, 255), random (0, 255), random (0, 255));
  ///ellipse(mouseX, mouseY, 100, 100);
  quad(random(0, height), random(0, width), random(0, height), random(0, width), random(0, height), random(0, width), random(0, height), random(0, width));


   tint(255, 126); 
  image(linz, random(0, width), random(0, height), random(0, 400), random(0, 400));
  image(miley, random(0, width), random(0, height), random(0, 400), random(0, 400));
 
  image(britney, random(0, width), random(0, height), random(0, 400), random(0, 400));

  textFont(font, 100);

  text("ok, cool", random(0, height), random(0, width));
}



