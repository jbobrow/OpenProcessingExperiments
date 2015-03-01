
PVector ZERO_SPOT;

PVector one; 
PVector two;

PVector moveVector;

@Override
public void setup()
{
  size(640, 480);

  // (320, 240)
  //
  one = new PVector(width / 2, height / 2);
  two = new PVector(120, 340);

  moveVector = new PVector(width / 2, height / 2);

  ZERO_SPOT = new PVector(420, 240);
}

@Override
public void draw()
{
  background(0);

  stroke(255, 0, 0);
  fill(0);
  ellipse(one.x, one.y, 200, 200);

  fill(255);
  stroke(255);

  ellipse(ZERO_SPOT.x, ZERO_SPOT.y, 2, 2);

  ellipse(one.x, one.y, 2, 2);
  ellipse(two.x, two.y, 2, 2);

  PVector tempPVector = PVector.sub(two, one);

  double squareX = Math.pow(tempPVector.x, 2);
  double squareY = Math.pow(tempPVector.y, 2);

  double hyp = Math.sqrt(squareX + squareY);

  // Provides the angles
  //
  // double speedX = Math.acos((double)tempPVector.x / hyp);
  // double speedY = Math.asin((double)tempPVector.y / hyp);
  double speedX = (double)tempPVector.x / hyp;
  double speedY = (double)tempPVector.y / hyp;

  println(speedX);

  moveVector = PVector.add(moveVector, 
  new PVector((float)speedX, (float)speedY));

  ellipse(moveVector.x, moveVector.y, 2, 2);
}


