



//make a command that will imply an action to another set of code
//make something to repeat around the screen: use a for loop.


void setup() {
  size(500, 300);
  smooth();
  background(0);
}



//visible information: lightswitch

void draw() {
}

void mousePressed() {
  groovycolor();
  for (int n =75; n < width-25; n += 50) {//horizontal
    for (int r=75; r < height-25; r += 50) {//vertical
      earth (n, r);//function (hardwire)
    }
  }
}



//hidden information: hardwiring

//helper function
void groovycolor() {
  fill(random (20, 100), random (20, 200), random (10, 200))  ;
}

//shape function

void earth(float X, float Y) {

  stroke(255);
  strokeWeight(10);
  ellipse(X, Y, 75, 75);
}


