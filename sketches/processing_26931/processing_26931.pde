
class Bead {


  //variables of beads 
  float x,y;
  float theta; 
  float speed;
  float fi;

  PImage myImage;


  //constructor connected to new bead pole()
  Bead (float tempX, float tempY, String iName, float tempSpeed) {
    x= tempX;
    y= tempY;
    myImage = loadImage(iName);
    theta= PI*mouseX/ width;
    speed= tempSpeed;
  }

  void spin() {
    theta= theta+0.1;
  }

  void display() {
    image(myImage,x,y);
    if (mousePressed) {
      pushMatrix();
      theta= theta+ 0.1;
      fi= (theta);
      translate(x,y);
      rotate(theta);
      //imageMode (CENTER);
      image(myImage,0,0);

      popMatrix();
    }
  }

  //set my location to the mouse
  void setLocation (int tempX, int tempY) {
    //x = tempX;
    y = tempY;
    y = constrain(mouseY,30,height-30);
  }

  //if the mouse is not over return false
  //if the mouse is over return true
  boolean drag () {
    boolean dragging = false;
     float d = dist(mouseX,mouseY,x,y);
    if (d < 30) {
      dragging = true;
    }
    return dragging;
  }

  void checkMouse () {
    //print("checking mouse");
    //check to see if mouse is in the circle;
    float d = dist(mouseX,mouseY,x,y);
    println(d);
    if (d < 30) {
      println("hey");
      y = constrain(mouseY,30,height-30);
    }
  }
}


