
import controlP5.*;

ControlP5 cp5;

float g;
int length;
int n;
float k;
float dt;

// Need doubles for some values - otherwise get an irritating loss of precision when calculating acc due to Hooke's Law
double[] pointY;
double[] newPointY;
double pointMass;
double kMod;
double springLength;

float[] velY;
float[] accY;
float centreOG;
float centreOGRef;
float velCOGB;
float t;

Numberbox gBox;
Numberbox lengthBox;
Numberbox nBox;
Numberbox kBox;
Numberbox dtBox;
Button release;
Button start;

void setup() {
  size(800, 1000);
  
  // Add various controls to modify variables
  cp5 = new ControlP5(this);
  int yPos = 0;
  gBox = cp5.addNumberbox("g")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(1)
     .setMin(0)
     .setValue(980)
     .setDirection(Controller.HORIZONTAL)
     ;
  lengthBox = cp5.addNumberbox("length")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     .setScrollSensitivity(1.1)
     //.setMin(0)
     .setValue(10)
     .setDirection(Controller.HORIZONTAL)
     ;
  nBox = cp5.addNumberbox("n")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     .setScrollSensitivity(1.1)
     .setRange(2, 50)
     .setValue(2)
     .setDirection(Controller.HORIZONTAL)
     ;
  kBox = cp5.addNumberbox("k")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     .setScrollSensitivity(1.1)
     .setMultiplier(0.001) // set the sensitifity of the numberbox
     .setDecimalPrecision(3)
     .setMin(0)
     .setValue(1.6)
     .setDirection(Controller.HORIZONTAL)
     ;
  dtBox = cp5.addNumberbox("dt")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     .setScrollSensitivity(1.1)
     .setMultiplier(0.0001) // set the sensitifity of the numberbox
     .setDecimalPrecision(4)
     .setMin(0.0001)
     .setValue(0.0001)
     .setDirection(Controller.HORIZONTAL)
     ;
  yPos++;
  release = cp5.addButton("release")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     .setSwitch(true)
     ;
  start = cp5.addButton("start")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     .setSwitch(true)
     ;
  cp5.addButton("step")
     .setPosition(50, 20 + 30 * yPos++)
     .setSize(60, 14)
     ;
  
  // Initialise the point masses
  resetPoints();
}
  
void draw() {
  background(125);
  
  if (!release.isOn()) {
    resetPoints();
  }
  
  if (start.isOn()) {
    update();
  }
  
  drawSlinky();
  drawText();
}

public void release(int theValue) {
  // This function is called when the release button is pressed
  if (release.isOn()) {
    gBox.lock();
    lengthBox.lock();
    nBox.lock();
    kBox.lock();
    dtBox.lock();
  } else {
    gBox.unlock();
    lengthBox.unlock();
    nBox.unlock();
    kBox.unlock();
    dtBox.unlock();
  }
}

public void step(int theValue) {
  // This function is called when the step button is pressed
  if (!start.isOn()) {
    update();
  }
}

void resetPoints() {
  // Reset variables & positions for point masses
  pointMass = 1.0 / (n - 1);
  kMod = n * k / 2;
  springLength = (double) length / (n - 1);
  pointY = new double[n];
  newPointY = new double[n];
  velY = new float[n];
  accY = new float[n];
  
  pointY[0] = 0;
  for (int i = 1; i < n; i++) {
    pointY[i] = pointY[i - 1] + springLength + (n - i) * pointMass * g / kMod;
    velY[i] = 0;
    accY[i] = 0;
  }
  
  // Calculate the centre of gravity
  calcCOG();
  
  // Set the reference COG to start at the same point - this is just a double check that the physics is correct
  centreOGRef = centreOG;
  velCOGB = 0;
  
  t = 0;
}

void update() {
  // Only update the first point mass & reference COG if the slinky has been released
  if (release.isOn()) {
    accY[0] = g + (float) (kMod * (pointY[1] - pointY[0] - springLength) / pointMass);
    centreOGRef += velCOGB * dt + g * dt * dt / 2;
    velCOGB += g;
  } else {
    accY[0] = 0;
  }
  
  // First update acceleration, then position, then speed
  newPointY[0] = pointY[0] + velY[0] * dt + accY[0] * dt * dt / 2;
  velY[0] += accY[0];
  for (int i = 1; i < n - 1; i++) {
    accY[i] = g + (float) (kMod * (pointY[i + 1] + pointY[i - 1] - 2 * pointY[i]) / pointMass);
    newPointY[i] = pointY[i] + velY[i] * dt + accY[i] * dt * dt / 2;
    velY[i] += accY[i];
  }
  accY[n - 1] = g - (float) (kMod * (pointY[n - 1] - pointY[n - 2] - springLength) / pointMass);
  newPointY[n - 1] = pointY[n - 1] + velY[n - 1] * dt + accY[n - 1] * dt * dt / 2;
  velY[n - 1] += accY[n - 1];
  
  // Check whether any masses have overtaken each other - limit to springLength apart & combine momenta evenly
  int i = 0;
  println();
  println((float) springLength);
  while (i < n) {
    double allPoints = newPointY[i];
    float allVels = velY[i];
    int j = i + 1;
    println("i "+i+": "+(float) newPointY[i]);
    while ((j < n) && (newPointY[i] >= newPointY[j] - (j - i) * springLength)) {
      println("j "+j+": "+(float) newPointY[j]);
      allPoints += newPointY[j] - (j - i) * springLength;
      allVels += velY[j];
      j++;
    }
    if (j > i + 1) {
      // There were at least two overlapping points
      double newPoint = allPoints / (j - i);
      float newVel = allVels / (j - i);
      // Reset the points & speeds
      for (int k = i; k < j; k++) {
        println("k "+k+": "+(float) newPointY[k]);
        newPointY[k] = newPoint + (k - i) * springLength;
        velY[k] = newVel;
      }
    }
    i = j;
  }
  
  for (i = 0; i < n; i++) {
    pointY[i] = newPointY[i];
  }
  
  // Calculate the new centre of gravity
  calcCOG();
  
  t += dt;
}

void calcCOG() {
  // Calculate the centre of gravity of the point masses
  centreOG = 0;
  for (int i = 0; i < n; i++) {
    centreOG += pointY[i];
  }
  centreOG /= n;
}

void drawSlinky() {
  // Draw line & point masses
  int yStart = 100;
  line(250, yStart + (float) pointY[0], 250, yStart + (float) pointY[n - 1]);
  for (int i = 0; i < n; i++) {
    fill(255 * i / (n - 1));
    ellipse(250, yStart + (float) pointY[i], 10, 10);
  }
  
  // Draw actual centre of gravity
  fill(0);
  ellipse(200, yStart + (float) centreOG, 20, 20);
  
  // Draw reference centre of gravity
  fill(255);
  ellipse(300, yStart + (float) centreOGRef, 20, 20);
  text("CoG", 188, yStart + (float) centreOG - 25);
  text("Ref CoG", 278, yStart + (float) centreOGRef - 25);
}

void drawText() {
  // Display useful stats: time plus pos, speed & acceleration of each poingt mass
  int col1 = 350;
  int col2 = 400;
  int col3 = 500;
  int col4 = 620;
  
  text("t:", col1, 30);
  text((float) t, col2, 30);
  text("dt:", col1, 50);
  text((float) dt * 1000000, col2, 50);
  text("(1/1000000)", col3, 50);
  text("PtY", col2 + 10, 90);
  text("Vel", col3 + 10, 90);
  text("Acc", col4 + 10, 90);
  
  int yPos = 0;
  for (int i = 0; i < n; i++) {
    text(i+":", col1, 110 + 20 * yPos);
    float f = (float) pointY[i];
    text(""+f, col2, 110 + 20 * yPos);
    text(""+velY[i], col3, 110 + 20 * yPos);
    text(""+accY[i], col4, 110 + 20 * yPos++);
  }
}


