
// Just like we can have as many variables as we like, we can also
// have many arrays!  For instance, we could have a second array to 
// store the "y" coordinate for each circle..  

// The (x, y) coordinate pair for a circle simply shares the same 
// index in each array!

// You could go crazy and add a color[] array too!...

float x[] = new float[50]; 
float y[] = new float[50];  

void setup() {
  size(300, 300);
  fill(0, 100, 255, 100);
  smooth(); 

  // arrays "know" their size.. we can use their length field instead
  // of hard-coding the size of the array.
  // this is better because if we change the size of the array, we don't
  // need to change the loop!
  for (int i=0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw() {
  background(255);

  for (int i=0; i < x.length; i++) {
    float dia = dist(x[i], y[i], mouseX, mouseY);
    ellipse(x[i], y[i], dia, dia);
  }
}

