
//http://processing.org/learning/basics/arctangent.html

eyeBall[] eye = new eyeBall[115]; //declare the array


void setup() {
  size(800,800);
  smooth();
  noStroke();
  background(234, 205, 192);
  //will use to count eyes we are adding to the array
  int count=0;
  for (int i = 0; i < eye.length; i++) {
    float x = random(width);
    float y = random(height);
    int r = i + 2; //radius
    eye[i] = new eyeBall(x, y, r);
  }
}

/* class eyeBall {
  //changed it to float here too
  float ex, ey;
  float size;
  float angle = 0.0;
  //changed the first two to float, as with random you are passing in a float not an int
  //constructor function should be same name as class (you had Eye here)
  eyeBall(float x, float y, float s) {
    ex = x;
    ey = y;
    size = s;
  } */

void draw() {
  //loop through eye array
  //you just had used i without the for loop which had no values
  for (int i = 0; i < eye.length; i++) {
       if (mousePressed) {
    background(234, 205, 192);
    eye[i].update(mouseX, mouseY);
    eye[i].display();
  } else {
    
    eye[i].update(mouseX, mouseY);
    eye[i].display();
    }
}
}



class eyeBall {
  //changed it to float here too
  float ex, ey;
  float size;
  float angle = 0.0;
  //changed the first two to float, as with random you are passing in a float not an int
  //constructor function should be same name as class (you had Eye here)
  eyeBall(float x, float y, float s) {
    ex = x;
    ey = y;
    size = s;
  }

  void update(float mx, float my) {
    angle = atan2(my-ey, mx-ex);
  }

  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(250);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(50);
    //the reason for this is, if you put at 0,0 you are rotating a circle from the centre
    //which you can't see, because it is a circle
    //if you give it an x pos away from the 0,0 the centre, you see it circling
    //the centre axis (0,0);
    ellipse(size/4, 0, size/2, size/2);
    //adding pupil
    fill(255);
    ellipse(size/3,0,size/9,size/9);
    popMatrix();
  }
}

