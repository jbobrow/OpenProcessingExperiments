
Swerve mySwerve = new Swerve (5, 5);

ArrayList swervers;

int black = 0;
int white = 255;

void setup () {
  size (600, 600);
  background (white);
  noStroke ();
  smooth();

  swervers = new ArrayList ();
  swervers.add (new Swerve (mouseX, mouseY));

  //  col = new Colony (100, 100);
  frameRate (60);
}

void draw() {


  fill(white);
  noStroke();
  rect(4, 0, 50, 40);
  fill(black);
  text("clear", 5, 15);
  text("invert", 5, 39);

  for (int i = swervers.size () -1; i >=0; i--) {
    Swerve mySwerve = (Swerve) swervers.get(i);
    mySwerve.dance ();
  }

  println ("velX");
  println (" ");
  println ("velY");
}


void keyPressed () {
  if (key == ' ') {
    swervers.add (new Swerve (mouseX, mouseY));
  }
  else if (key == 'z') {
    noLoop ();
  }
  else if (key == 'x') {
    loop ();
  }
}


void mousePressed() {
  if (mouseX < 50 && mouseY < 16) setup();
  if (mouseX < 50 && mouseY > 16 && mouseY < 40) {
    black = 255 - black;
    white = 255 - white;
    setup();
  }
}


