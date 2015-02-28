
/*
 * The Amazing Pocket Galaxy
 * 
 * By Juan Sebastian Robles Jimenez
 * 
*/

/*
  Constants
*/
final int MAX_PLANETS = 500;
final float G = .5;

/*
  Main Objects
*/
PlanetManager pManager;
KeyboardListener kl;
MouseListener ml;
PImage backgroundImg;

/*
  Planet names
*/
String[] planetList = {"Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"};
int idx = 0;

void setup()
{
  size(1000, 1000);
  pManager = new PlanetManager(MAX_PLANETS, G);
  kl = new KeyboardListener(pManager);
  ml = new MouseListener(pManager);
  noFill();
  println(planetList[idx]);
  backgroundImg = loadImage("galaxy.jpg");
  backgroundImg.resize(width, height);
  
}

void draw()
{
  background(backgroundImg);
  pManager.applyForces();
  pManager.updatePlanets();
  pManager.drawPlanets();
}

void mousePressed()
{
  ml.buttonClicked(mouseButton);
}

void keyPressed()
{
  kl.keyPressed(key);
}

