


// Demonstrates a dynamically changing acceleration (towards the mouse)
// Declare a "Thing" object
boolean showVectors = true;

//here I tried to establish the array of objects

Thing[] myList = new Thing[40];
int numThings;

PImage b;


//Thing t;    ///JFS - get rid of single instance

void setup() {
  b = loadImage("2.jpg");
  size(600, 300);
  numThings = 40;
  //smooth();

  // Create the thing object
  // loop throught the thing obejcts ?
  for (int i = 0; i < numThings; i++ ) {
    PVector a = new PVector(0.0, 0.125);
    PVector v = new PVector(0.0, 0.0);
    PVector l = new PVector( random(0,width), random(0,height));
    
    ///JFS assign to ARRAY @ each index i
    myList[i] = new Thing(a, v, l);
  }
}

void draw() {
  image(b, 0, 0);

  for ( int i = 0; i < numThings; i++) {
  
  //not sure how to get my array here to multiply
  ///JFS - do the same thing as before but to every element
  
  
  myList[i].go();
  }

  // Run the Thing object
  //t.go();

  if (mousePressed) {
    // Compute difference vector between mouse and object location
    // 3 steps -- (1) Get Mouse Location, (2) Get Difference Vector, (3) Normalize difference vector
    
    PVector m = new PVector(mouseX, mouseY);
    
    ///JFS do this for every element.....
    for ( int i = 0; i < numThings; i++) 
    {
      PVector diff = PVector.sub(m,  myList[i].getLoc());
      diff.normalize();
      float factor = .2;  // Magnitude of Acceleration (not increasing it right now)
      diff.mult(factor);
      //object accelerates towards mouse
       myList[i].setAcc(diff);
    }
  } 
  else {
    
    //JFS  Same here....
    for ( int i = 0; i < numThings; i++) 
    {
      myList[i].setAcc(new PVector(0, 0));
    }
  }
}


//Renders a vector object 'v' as an arrow and a location 'loc'


void drawVector(PVector v, PVector loc, float scayl) {
  pushMatrix();

  translate(loc.x, loc.y);

  float arrowsize = 2;
  // Translate to location to render vector
  stroke(1);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0, 0, len, 0);
  line(len, 0, len-arrowsize, +arrowsize/2);
  line(len, 0, len-arrowsize, -arrowsize/2);
  
  popMatrix();
}


void keyPressed() {
  showVectors = !showVectors;
}



