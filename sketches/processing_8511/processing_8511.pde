
class Car { 
  color c;            // sets up variables for the cars, positions and speeds, as well as color so that they can be changed in the main area
  float xpos;
  float ypos;
  float xspeed;

  Car(color c_, float xpos_, float ypos_, float xspeed_) {
    c = c_;
    xpos = xpos_;
    ypos = 508-(ypos_*45); 
    xspeed = xspeed_;
  }

  void display() {
    //rectMode(CENTER);
    noStroke();
    fill(c);
    rect(xpos,ypos,60,40);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width +10) {
      xpos = -20;
    }
    if (xpos < -25){
      xpos = width +10;
    }


    //colision detection of frog and car
    if((frogy >= ypos && frogy <= ypos + 40 && frogx >= xpos && frogx <= xpos + 60) || (frogy + 40 >= ypos && frogy + 60 <= ypos + 40 && frogx >= xpos && frogx <= xpos + 60) || 
      (frogy >= ypos && frogy <= ypos + 40 && frogx + 60 >= xpos && frogx + 40 <= xpos + 60) || (frogy + 40 >= ypos && frogy + 60 <= ypos + 40 && frogx + 60 >= xpos && frogx + 40 <= xpos + 60)){
      // collision detected
      println("collision detected"); 
      frogx = 275;
      frogy = 575;
      life = life - 1;

    } 
  }
}




