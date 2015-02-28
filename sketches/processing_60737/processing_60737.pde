
//Defining the shooter here
class Shooter {
  //class data or variables
  float x1;
  float y1;
  float dia;
  PImage logo;

  Shooter(float tex, float tey, float ted, PImage togo) {
    //constructor
    x1 = tex;
    y1 = tey;
    dia = ted;
    logo = togo;
  }

  void make() { //method 1 -draw the shooter here
    noStroke();
    fill(255);
    ellipse(x1, y1, dia*2, dia*2); 
    image(logo, x1-dia, y1-dia, dia*2, dia*2);
  }

  void scrollUp() { //method 2 - move the shooter up
    make();
    y1 = y1-2;
  }

  void scrollDown() {//move the shooter down
    make();
    y1  = y1+2;
  }

  void dash() { //give it a faster movement
    y1 = mouseY;
  }

  void shoot() { //shoots a bullet
    x1 = x1 +5; //moves the shooter forward a little to imply action
    where[counter] = y1; //resets a global variable value so bullets always come from where the shooter is
    impact[counter] = x1;
    bulletShot = true; //rests a global variable to allow bullet-related code through
  }

  void goBack() { //kicks the shooter backwards
    x1 = spacing;
  }
}

