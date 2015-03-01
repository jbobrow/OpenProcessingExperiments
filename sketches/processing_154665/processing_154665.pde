
PShape eye;
PShape irisShape;
PShape eyeballShape;
PShape skull;

void setup ()
{
  size (500, 500);
  smooth();
  skull = loadShape ("skull.svg");
  eye = loadShape ("eye.svg");
  irisShape = eye.getChild ("iris");

  println (eye.getChild ("black"));

  eyeballShape = eye.getChild ("eyeball");
  eyeballShape.disableStyle();
}

void draw ()
{
  background (#57385c);
  shape (skull, 0, 0);

  float h = 300;

  drawEye(width/3, h, width/2, h);
  drawEye(width*2/3, h, width/2, h);
}

void drawEye (float cx, float cy, float CX, float CY)
{
  float eyeCenterX = cx;
  float eyeCenterY = cy;

  float eyeBall = 100;
  float iris = 62;

  pushMatrix();
  translate (eyeCenterX, eyeCenterY);

  noStroke();
  fill (#A75265);
  shape (eyeballShape.getChild ("white"), -eyeballShape.width/2, -eyeballShape.height/2);
  fill (0);
  shape (eyeballShape.getChild ("black"), -eyeballShape.width/2, -eyeballShape.height/2);

  popMatrix();
  pushMatrix();

  float angle = atan2 (mouseY-CY, mouseX - CX);
  float maxDist = 150;
  float dist = dist (mouseX, mouseY, CY, CX);
  float r = map (dist, 0, maxDist, 0, eyeBall/2 - iris/2);

  if (r > eyeBall/2 - iris/2) r = eyeBall/2 - iris/2;

  float irisX = eyeCenterX + cos (angle)*r;
  float irisY = eyeCenterY + sin (angle)*r;


  translate (irisX, irisY);

  shape (irisShape, -irisShape.width/2, -irisShape.height/2);

  popMatrix();
}


