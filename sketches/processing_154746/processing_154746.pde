
PVector current;
PVector addVector;
PVector result;

PVector current_02;
PVector addVector_02;
PVector result_02;

PFont font;

void setup ()
{
  size (600, 300);
  smooth();
  frameRate (50);

  font = createFont ("Arial", 14);
  textFont (font, 14);
  textAlign (CENTER, TOP);

  float angle = random (TWO_PI);
  current = new PVector (cos (0), sin (0));
  current.mult (85);

  angle = random (TWO_PI);
  addVector = new PVector (cos (angle), sin (angle));
  addVector.mult (random (20, 50));

  result = PVector.add (current, addVector);

  angle = random (TWO_PI);
  current_02 = new PVector (cos (0), sin (0));
  current_02.mult (85);

  angle = random (TWO_PI);
  addVector_02 = new PVector (cos (angle), sin (angle));
  addVector_02.mult (random (50, 70));

  result_02 = current_02.get();
  result_02.add (PVector.mult (addVector_02, 0.1));
  result_02.normalize();
  result_02.mult (current_02.mag());
}

void draw ()
{
  background (#57385c);

  strokeWeight (2);
  noFill();

  // left pair -------------------------

  stroke (#A75265);
  ellipse (140, height/2, current.mag()*2, current.mag()*2);

  strokeWeight (0.7);
  stroke (#ffedbc);
  arrow (140, height/2, result.mag(), 10, result.heading2D());

  strokeWeight (3);
  stroke (255);
  arrow (140, height/2, current.mag(), 10, current.heading2D());

  float x = 140 + cos (current.heading2D()) * current.mag();
  float y = height/2 + sin (current.heading2D()) *  current.mag();

  strokeWeight (2);
  stroke (254, 190, 126);
  arrow (x, y, addVector.mag(), 10, addVector.heading2D());

  // right pair -------------------------

  stroke (#A75265);
  ellipse (width-140, height/2, current_02.mag()*2, current_02.mag()*2);

  strokeWeight (3);
  stroke (255);
  arrow (width-140, height/2, current_02.mag(), 10, current_02.heading2D());

  strokeWeight (0.7);
  stroke (#ffedbc);
  arrow (width-140, height/2, result_02.mag(), 10, result_02.heading2D());

  float x2 = width-140 + cos (current_02.heading2D()) * current_02.mag();
  float y2 = height/2 + sin (current_02.heading2D()) *  current_02.mag();

  strokeWeight (2);
  stroke (254, 190, 126);
  arrow (x2, y2, addVector_02.mag(), 10, addVector_02.heading2D());

  // info bar top -----------------------------------

  fill (0, 50);
  noStroke();
  rect (0, 0, width, 40);


  fill (255);
  String txt = "LEFT: white (" + nf (round (degrees (current.heading2D())), 3) + "°) , orange ("+  nf (round (degrees (addVector.heading2D())), 3) + "°), orange vector added to white vector (" +  nf (round (degrees (result.heading2D())), 3) + "°)";
  text(txt, width/2, 10);
  
   // info bar top -----------------------------------

  fill (0, 50);
  noStroke();
  rect (0, height-40, width, 40);


  fill (255);
  txt = "RIGHT: white (" + nf (round (degrees (current_02.heading2D())), 3) + "°) , orange ("+  nf (round (degrees (addVector_02.heading2D())), 3) + "°), 10% of orange vector added to white vector (" +  nf (round (degrees (result_02.heading2D())), 3) + "°)";
  text(txt, width/2, height-30);
}

void mousePressed ()
{
  // LEFT -----------
  float currentMag = current.mag();
  current.add (addVector);
  current.normalize();
  current.mult (currentMag);

  float angle = random (TWO_PI);
  addVector = new PVector (cos (angle), sin (angle));
  addVector.mult (random (20, 50));

  result = PVector.add (current, addVector);

  // RIGHT ----------------
  float currentMag2 = current_02.mag();
  PVector av = addVector_02.get ();
  av.mult (0.1);
  current_02.add (av);
  current_02.normalize();
  current_02.mult (currentMag2);

  result_02 = current_02.get();
  result_02.add (PVector.mult (addVector_02, 0.1));
  result_02.normalize();
  result_02.mult (current_02.mag());
}

void arrow (float x, float y, float r, float ar, float angle)
{
  float endX = x + cos (angle)*r;
  float endY = y + sin (angle)*r;
  line (x, y, endX, endY );
  line (endX, endY, endX + cos (angle-PI * 0.88) * ar, endY + sin (angle-PI*0.88) * ar);
  line (endX, endY, endX + cos (angle-PI * 1.12) * ar, endY + sin (angle-PI*1.12) * ar);
}

void keyPressed ()
{
  setup();
}

