
PImage sun;
PImage planet;
PImage stars;

void setup()
{
  size(600, 600);
  imageMode(CENTER);
  sun = loadImage("sun.png");
  planet = loadImage("planet.png");
  stars = loadImage("stars.jpg");
  smooth();
}

void draw()
{
  image(stars, width/2,height/2,width,height);
 
  drawPlanet(color(150, 50, 0), 150, 50);
  drawPlanet(color(0, 50, 150), 250, 100);
  drawPlanet(color(180, 150, 30), 400, 200);
  drawSun();
}

void drawPlanet(color c, float r, float s)
{
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(width/2, height/2);

  pushMatrix();
  translate(x, y);
  rotate(-frameCount/(r/2));
  tint(c);
  image(planet, 0, 0, s,s); //4th, 5th param sizes it...
  popMatrix();
  popMatrix();
}

void drawSun()
{
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/500.0);
  tint(255);
  image(sun, 0, 0, 100, 100); //4th, 5th param sizes it...
  popMatrix();
}


