
PFont font = createFont ("Arial", 24);

void setup ()
{
  size (600, 200);
  smooth();

  textFont (font, 24);
  textAlign (LEFT, TOP);
}

void draw ()
{
  background (#57385c);
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  pushMatrix();            // save matric

  translate (100, 50);     // translate 

  // -------------------

  fill (#ffedbc);
  rect (0, 0, 70, 35);

  fill (#57385c);
  text (" 1", 0, 0);

  // -------------------

  translate (150, 0);    // translate
  rotate (PI/6);         // rotate

  // -------------------

  fill (#ffedbc);
  rect (0, 0, 70, 35);

  fill (#57385c);
  text (" 2", 0, 0);

  // -------------------

  rotate (PI/2);       // rotate
  scale (0.5);         // scale

  // -------------------

  fill (#ffedbc);
  rect (0, 0, 70, 35);

  fill (#57385c);
  text (" 3", 0, 0);

  // -------------------

  popMatrix();        // reset matrix

  // -------------------

  fill (#ffedbc);
  rect (0, 0, 70, 35);

  fill (#57385c);
  text (" 4", 0, 0);
}

