
PFont font;
PImage flag;
PImage smiley;
PImage arrow;

Player p;
Grid g;


boolean upPressed, leftPressed, downPressed, rightPressed;
void setup()
{
  size(600, 400);
  font = loadFont("AlMateen-Bold-48.vlw");
  textFont(font, 45);
  frameRate(10);
  initialize();
}
void initialize()
{
  p = new Player(20, 20);
  g = new Grid();
  g.create();
}
void draw() {
background(230);
fill (230);
rect(19,19,361,361);
p.display();
g.display();
p.move();
fill(0);
arrow = loadImage("ArrowKeys.png");
image(arrow, 430, 220);
smiley = loadImage("High-contrast-face-plain.png");
image(smiley, 420, 60);
flag = loadImage("flagCheck.gif");
image(flag, 420, 140);
text(g.CompteurJoueur, 540, 100 );
text(g.CompteurManhattan, 540, 170 );
//upPressed = false;
//leftPressed = false;
//downPressed = false;
//rightPressed = false;
}

void keyPressed()
{
  if (keyCode == UP) upPressed = true;
  if (keyCode == LEFT) leftPressed = true;
  if (keyCode == DOWN) downPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
}

