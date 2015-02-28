
// Name: Gingrefel G. Constante
// Subject: ISTA 301
// Professor: Kelland Thomas

// this program makes multiple dots inside a box while spinning 

// initialization of my variables

int [] x = new int [300]; // this a single dimensional array with the elements of 120
int [] y = new int [300]; // this a single dimensional array with the elements of 120
int [] z = new int [300]; // this a single dimensional array with the elements of 120

void setup() {
  size(800, 600, P3D); // this is telling processing that we are working on 3D
  background(#380000); // this is the background we may not use this one
  noFill(); // making sure it is not fill
  stroke(204, 102, 0); // this is the stroke or borders for the box that keeps rotating
  strokeWeight(2); // this makes the weight of the dots a little bit bigger

  // make sure to parse the random function because your global variables are declared as an int
  for (int i = 0; i<300; i++) { // while i is less than 120
    x[i] = int(random(-150, 150)); // setting/assigning the values for x and it will go through until i is less than 119 and it will make up some random numbers
    y[i] = int(random(-150, 150)); // setting/assigning the values for y and it will go through until i is less than 119 and it will make up some random numbers
    z[i] = int(random(-150, 150)); // setting/assigning the values for z and it will go through until i is less than 119 and it will make up some random numbers
  }
}

void draw() {
  background(#380000); // this will erase the box if you type this again
  translate(width/2, height/2); // this will put the box and move it to the center
  rotateY(frameCount/100.0); // this will spin in Y axis and the reason it is a floating point number is because you want it to spin slowly as possible
  box(300); // this is the size of the box that will rotate
  for (int i= 0; i<300; i++) {
    point(x[i], y[i], z[i]); // this is specifying what values are we working on
  }
}
