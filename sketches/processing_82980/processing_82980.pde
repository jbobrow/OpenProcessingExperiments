
int numCharges = 3;//the number of charges
Electrons[] charge = new Electrons[numCharges];//Declare the 1D array called 'charge', the elements of which are objects of the class called 'Electrons'
int numVectorsX = 21;//20*30 that's number of vectors across by spacing between each is width and add 1 to the number of vectors in the x-direction
int numVectorsY = 21;//10*30 that's number of vectors down by spacing between each is height and add 1 to the number of vectors in the y-direction
int distance = 30;//spacing between vectors, same for x and y directions
Field[][] vectors = new Field[numVectorsX][numVectorsY];//Declare the 2D array called 'vectors', the elements of which are objects of the class called 'Field'
float targetX = 300, targetY = 150, pol, fieldStrength, minDiameter, maxDiameter;//the field initially points to a singularity at the coordinate (300,150). targetX and targetY is where the field points to. 'pol' is the polarity of the charge
float theta = 0;//angle between charge and each vector
int magnitude;//length or magnitude of a vector
int r, g, b;//red green blue variables for charge colour
float Fieldstrength;
void setup() {
  size(600, 600);
  smooth();
  noStroke();
  for (int k = 0; k < numCharges; k++) {//these loops populate the 2D array, each element of this array is an object and each object is a vector
    //x, y, r, g, b, transparency, count, initial diameter, minChargediameter, maxChargediameter... the fields
    charge[k] = new Electrons(100 + (100*k), 100 + (50*k), 0, 0, 255, 30, 1, 100, 20, 400); //Construct the object charge
  }
  float maxdist = 400;
  for (int i = 0; i < numVectorsX; i++) {//these loops populate the 2D array, each element of this array is an object and each object is a vector
    for (int j = 0; j < numVectorsY; j++) {
      // xField, yField, magnitude, theta, maxdist
      vectors[i][j] = new Field(i*distance, j*distance, magnitude, theta, maxdist);
    }
  }
}
void draw() {
  background(#DAEBF2);
  for (int k = 0; k < numCharges; k++) {//these loops populate the 2D array, each element of this array is an object and each object is a vector
    charge[k].move();
    charge[k].display();
  }
  for (int k = 0; k < numCharges; k++) {
    for (int i = 0; i < numVectorsX; i++) {
      for (int j = 0; j < numVectorsY; j++) {
        // xField, yField, l, theta
        vectors[i][j].plot();
        vectors[i][j].update(charge[k].x, charge[k].y, charge[k].diameter, charge[k].minChargediameter, charge[k].maxChargediameter);//puts the fields x, y etc. from the object 'charge' into the object 'vectors', there they are set equal to targetX, targetY, etc. which is where the field points to
        vectors[i][j].polarity(charge[k].r);//puts the field r from the object 'charge' into the object 'vectors', there it is set equal to 'pol'.
      }
    }
  }
}
void mouseReleased() {
  if (mouseButton == CENTER) {
    for (int k = 0; k < numCharges; k++) {//these loops populate the 2D array, each element of this array is an object and each object is a vector
      charge[k].released();
    }
  }
}

class Electrons {
  float x, y, r, g, b, transparency, diameter, minChargediameter, maxChargediameter;
  int count;
  //Constructor
  Electrons(float xpos, float ypos, float rpos, float gpos, float bpos, float trans, int countpos, float diameterpos, float minChargediameterpos, float maxChargediameterpos) {
    x = xpos;
    y = ypos;
    r = rpos;
    g = gpos;
    b = bpos;
    transparency = trans;
    count = countpos;
    diameter = diameterpos;
    minChargediameter = minChargediameterpos;
    maxChargediameter = maxChargediameterpos;
  }
  void move() {
    if (((dist(mouseX, mouseY, x, y))<(diameter/2))&&(mousePressed == true)) {//tests to see if mouse is on charge
      if (mouseButton == LEFT) {
        x = mouseX;
        y = mouseY;
      }
      else if (mouseButton == RIGHT) {//dragging mouse toward centre decreases size of charge
        if (((dist(mouseX, mouseY, x, y))-(dist(pmouseX, pmouseY, x, y)))>(0)) {
          if (diameter < maxChargediameter) {//prevents diameter getting too big, max diameter is 400
            diameter = diameter + 5; //increases size of diameter
            transparency += 0.5;
          }
        } //dragging mouse away from center increases size of charge
        else if (((dist(mouseX, mouseY, x, y))-(dist(pmouseX, pmouseY, x, y)))<(0)) {
          if (diameter > minChargediameter) {//prevents diameter getting too small and circle disappearing, min diameter is 20
            diameter = diameter - 5; // decreases size of diameter
            transparency -= 0.5;
          }
        }
      }
    }
  }
  void display() {
    fill(r, g, b, transparency);//fills the charge with colours red, green, blue
    ellipse(x, y, diameter, diameter);//draws the charge
  }
  void released() {
    if (((dist(mouseX, mouseY, x, y))<(diameter/2))) {//tests to see if mouse is on charge
      count = (count + 1) % 2;
      if (count == 1) {//sets colour to blue once
        r = 0;
        b = 255;
      }
      else if (count == 0) {//set colour red to blue
        r = 255;
        b = 0;
      }
    }
  }
}

class Field {
  float xField, yField, magnitude, theta, maxdist;
  //Constructor
  Field(float xFieldpos, float yFieldpos, float magnitudepos, float thetapos, float maxdistpos) {
    xField = xFieldpos;
    yField = yFieldpos;
    magnitude = magnitudepos;
    theta = thetapos;
    maxdist = maxdistpos;
  }
  void plot() {
    float theta = atan((targetY-yField)/(targetX-xField));
    if (targetX < xField) {//without this the vectors on the right of screen will point away from charge and vectors on right of screen toward it. All should point away or toward it
      theta += PI;
    }
    if (pol == 0) {//if 'pol' is 0 then r = 0 in charge.released and so charge is blue and positive
      theta += PI; //points the field away from the charge position for a positive charge
    }   
    float d = (sqrt(pow(targetY-yField, 2) + pow(targetX-xField, 2)));//should be 1/r^2 but not practical here
    float maxFieldstrength, minFieldstrength = 0;
    float newVectorlengthmin = 10, newVectorlengthmax = 35;
    float minDiameter = 20, maxDiameter = 400;
    maxFieldstrength = map(fieldStrength, minDiameter, maxDiameter, newVectorlengthmin, newVectorlengthmax);//maps the fieldStrength, which is the diameter of the charge, from the max and mix charge diameter to the max and min charger length
    if (d > maxFieldstrength) {
      float magnitude = map(d, 0, maxdist, maxFieldstrength, minFieldstrength);//the second last value is the maximum length of a vector. 2nd last value should a min and last a max value, inverting them puts longest vectors near charge
      float fieldTransparency = map(d, 0, maxdist, 205, -20);
      stroke(1, fieldTransparency);
      fill(0, 0, 0);
      pushMatrix();
      translate(xField, yField);
      rotate(theta);
      line(0, 0, magnitude, 0);
      beginShape();//this shape are the arrow heads of the vectors
      vertex(magnitude, -3);
      vertex(magnitude, 3);
      vertex(magnitude + 3, 0);
      endShape(CLOSE);
      popMatrix();
      noFill();
      noStroke();
    }
  }
  void update(float x, float y, float diameter, float minChargediameter, float maxChargediameter) {
    targetX = x;
    targetY = y;
    fieldStrength = diameter;
    minDiameter = minChargediameter;
    maxDiameter = maxChargediameter;
  }
  void polarity(float r) {
    pol = r;
  }
}
