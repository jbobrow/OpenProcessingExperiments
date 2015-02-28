

class Car {         // define class name

  float xpos;
  float ypos;
  float yspeed;
  color c;         


  // The Constructor is defined with arguments.
  // constructor is called when the object is created
  Car(float tempx, float tempy, float tempspeed, color tempC) { 

    println("a car has been created");

    xpos = tempx;    // put passed values into class variables
    ypos = tempy;
    yspeed = tempspeed;
    c = tempC;
  }

  void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,random(1,3),random(7,12));    // draws a rectangle
  }

  void drive() {              // moves box forward
    ypos = ypos + yspeed;


    if (ypos > mouseY-20) {
      if (xpos < mouseX+53 && xpos > mouseX) {

        xpos = mouseX +53;
      }
      if (xpos < mouseX && xpos > mouseX-47) {

        xpos = mouseX -47;
      }
    }


    if (ypos > height) {
      ypos = 0;
    }
  }
}


