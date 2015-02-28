
//Martin C, Rotating Cube, CP1, Mods 4-5

float rotx = 0;
float roty = 0; 
float rotz = 0;
int initMouseX;
int initMouseY;
PImage question;
PImage questionbottom;
PImage questiontop;

void setup()
{
  size(500, 500, P3D);
  question = loadImage("question.gif");
  questionbottom = loadImage("questionbottom.png");
  questiontop = loadImage("questionbottom.png");
}

void draw()
{
  background(125);
  stroke(0);
  text("Use 1-3 to change texture. Drag mouse to rotate.", 10, 10);
  noStroke();
  translate(250, 250);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);

  translate(0, 0, 100);
  image(question, -100, -100, 200, 200);
  translate(0, 0, -100);

  translate(0, 0, -100);
  rotateY(PI);
  image(question, -100, -100, 200, 200); //backwards
  rotateY(-PI);

  translate(0, 0, 100);

  rotateY(-PI/2);

  translate(0, 0, -100);
  rotateY(PI);
  image(question, -100, -100, 200, 200);
  rotateY(-PI);
  translate(0, 0, 100);

  translate(0, 0, 100);
  image(question, -100, -100, 200, 200);
  translate(0, 0, -100);

  rotateY(-PI/2);

  rotateX(PI/2);

  translate(0, 0, 100);
  image(questiontop, -100, -100, 200, 200);
  translate(0, 0, -100);

  translate(0, 0, -100);
  image(questionbottom, -100, -100, 200, 200);
  translate(0, 0, 100);

  rotateX(PI/2);

  noFill();
  box(200);

  if (mousePressed)
  {
    rotx = rotx - (mouseY - initMouseY)/(19200/PI);
    roty = roty + (mouseX - initMouseX)/(19200/PI);
  }
}

void mousePressed()
{
  initMouseX = mouseX;
  initMouseY = mouseY;
}

void keyPressed() {
  if (key == '1')
  {
    question = loadImage("question.gif");
    questionbottom = loadImage("questionbottom.png");
    questiontop = loadImage("questionbottom.png");
  }

  if (key == '2')
  {
    question = loadImage("diamondblock.png");
    questionbottom = loadImage("diamondblock.png");
    questiontop = loadImage("diamondblock.png");
  }

  if (key == '3')
  {
    question = loadImage("piston.png");
    questionbottom = loadImage("pistonbottom.png");
    questiontop = loadImage("pistontop.png");
  }
}


